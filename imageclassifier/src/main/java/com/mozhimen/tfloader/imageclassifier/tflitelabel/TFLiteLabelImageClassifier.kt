package com.mozhimen.tfloader.imageclassifier.tflitelabel

import android.graphics.Bitmap
import android.os.SystemClock
import android.os.Trace
import android.util.Log
import com.mozhimen.tfloader.mos.ChipType
import com.mozhimen.tfloader.imageclassifier.mos.ModelType
import com.mozhimen.tfloader.mos.Recognition
import com.mozhimen.basick.utilk.bases.BaseUtilK
import org.tensorflow.lite.Interpreter
import org.tensorflow.lite.gpu.CompatibilityList
import org.tensorflow.lite.gpu.GpuDelegate
import org.tensorflow.lite.nnapi.NnApiDelegate
import org.tensorflow.lite.support.common.FileUtil
import org.tensorflow.lite.support.common.TensorOperator
import org.tensorflow.lite.support.common.TensorProcessor
import org.tensorflow.lite.support.image.ImageProcessor
import org.tensorflow.lite.support.image.TensorImage
import org.tensorflow.lite.support.image.ops.ResizeOp
import org.tensorflow.lite.support.image.ops.ResizeOp.ResizeMethod
import org.tensorflow.lite.support.image.ops.ResizeWithCropOrPadOp
import org.tensorflow.lite.support.image.ops.Rot90Op
import org.tensorflow.lite.support.label.TensorLabel
import org.tensorflow.lite.support.tensorbuffer.TensorBuffer
import java.io.IOException
import java.util.*

/**
 * @ClassName TFLiteLabelImageClassifier
 * @Description 一个专门使用TensorFlow Lite来标记图像的加载器
 * 适配采用tensorflow训练的pb转化而来的tflite文件,例如toco工具
 * A loader specialized to label images using TensorFlow Lite.
 * you need add in app build gradle
 * android {
 *  ......
 *  aaptOptions {
 *      noCompress "tflite"//example
 *  }
 * }
 * @Author Kolin Zhao / Mozhimen
 * @Date 2022/6/17 14:11
 * @Version 1.0
 */
abstract class TFLiteLabelImageClassifier(
    modelPath: String,
    labelPath: String,
    private val _resultSize: Int,
    chipType: ChipType,
    numThreads: Int
) : BaseUtilK() {
    companion object {
        /**
         * 使用提供的配置创建一个分类器
         * Creates a classifier with the provided configuration.
         * @param modelPath String
         * @param resultSize Int
         * @param chipType ChipType
         * @param numThreads Int
         * @return Classifier?
         * @throws IOException
         */
        @Throws(IOException::class)
        fun create(
            modelPath: String,
            labelPath: String,
            resultSize: Int = 1,
            modelType: ModelType = ModelType.QUANTIZED_EFFICIENT_NET,
            chipType: ChipType = ChipType.CPU,
            numThreads: Int = 1
        ): TFLiteLabelImageClassifier {
            return when (modelType) {
                ModelType.QUANTIZED_MOBILE_NET -> {
                    TFLiteLabelImageClassifierQuantizedMobileNet(modelPath, labelPath, resultSize, chipType, numThreads)
                }

                ModelType.FLOAT_MOBILE_NET -> {
                    TFLiteLabelImageClassifierFloatMobileNet(modelPath, labelPath, resultSize, chipType, numThreads)
                }

                ModelType.FLOAT_EFFICIENT_NET -> {
                    TFLiteLabelImageClassifierFloatEfficientNet(modelPath, labelPath, resultSize, chipType, numThreads)
                }

                ModelType.QUANTIZED_EFFICIENT_NET -> {
                    TFLiteLabelImageClassifierQuantizedEfficientNet(modelPath, labelPath, resultSize, chipType, numThreads)
                }
            }
        }
    }

    /**
     * Gets the TensorOperator to dequantize the output probability in post processing.
     *
     * <p>For quantized model, we need de-quantize the prediction with NormalizeOp (as they are all
     * essentially linear transformation). For float model, de-quantize is not required. But to
     * uniform the API, de-quantize is added to float model too. Mean and std are set to 0.0f and
     * 1.0f, respectively.
     */
    protected abstract fun getPostProcessNormalizeOp(): TensorOperator

    /** Gets the TensorOperator to normalize the input image in preprocessing.  */
    protected abstract fun getPreProcessNormalizeOp(): TensorOperator

    /** Optional GPU delegate for accleration.  */
    private var _gpuDelegate: GpuDelegate? = null

    /** Optional NNAPI delegate for accleration.  */
    private var _nnApiDelegate: NnApiDelegate? = null

    /** An instance of the driver class to run model inference with Tensorflow Lite.  */
    private var _tflite: Interpreter

    /** Options for configuring the Interpreter.  */
    private val _tfliteOptions = Interpreter.Options()

    /** Labels corresponding to the output of the vision model.  */
    private var _labels: List<String>

    /** Input image TensorBuffer.  */
    private var _inputImageBuffer: TensorImage? = null

    /** Output probability TensorBuffer.  */
    private var _outputProbabilityBuffer: TensorBuffer

    /** Processer to apply post processing of the output probability.  */
    private var _probabilityProcessor: TensorProcessor

    private val _imageSizeX: Int//得到图像沿x轴的大小 Get the image size along the x axis.
    private val _imageSizeY: Int//得到图像沿y轴的大小 Get the image size along the y axis.

    /**
     * 初始化一个分类器
     * Initializes a `Classifier`.
     */
    init {
        val tfliteModel = FileUtil.loadMappedFile(_context, modelPath)
        when (chipType) {
            ChipType.NNAPI -> {
                _nnApiDelegate = NnApiDelegate()
                _tfliteOptions.addDelegate(_nnApiDelegate)
            }

            ChipType.GPU -> {
                val compatList = CompatibilityList()
                if (compatList.isDelegateSupportedOnThisDevice) {
                    // if the device has a supported GPU, add the GPU delegate
                    val delegateOptions: GpuDelegate.Options = compatList.bestOptionsForThisDevice
                    val gpuDelegate = GpuDelegate(delegateOptions)
                    _tfliteOptions.addDelegate(gpuDelegate)
                    Log.d(
                        TAG,
                        "GPU supported. GPU delegate created and added to options"
                    )
                } else {
                    _tfliteOptions.setUseXNNPACK(true)
                    Log.d(TAG, "GPU not supported. Default to CPU.")
                }
            }

            ChipType.CPU -> {
                _tfliteOptions.setUseXNNPACK(true)
                Log.d(TAG, "CPU execution")
            }
        }
        _tfliteOptions.setNumThreads(numThreads)
        _tflite = Interpreter(tfliteModel, _tfliteOptions)

        // Loads labels out from the label file.
        _labels = FileUtil.loadLabels(_context, labelPath)

        // Reads type and shape of input and output tensors, respectively.
        val imageTensorIndex = 0
        val imageShape = _tflite.getInputTensor(imageTensorIndex).shape() // {1, height, width, 3}

        _imageSizeY = imageShape[1]
        _imageSizeX = imageShape[2]
        val imageDataType = _tflite.getInputTensor(imageTensorIndex).dataType()
        val probabilityTensorIndex = 0
        val probabilityShape = _tflite.getOutputTensor(probabilityTensorIndex).shape() // {1, NUM_CLASSES}
        val probabilityDataType = _tflite.getOutputTensor(probabilityTensorIndex).dataType()
        Log.d(
            TAG,
            "init: _imageSizeY $_imageSizeY _imageSizeX $_imageSizeX imageDataType $imageDataType probabilityShape $probabilityShape probabilityDataType $probabilityDataType"
        )

        // Creates the input tensor.
        _inputImageBuffer = TensorImage(imageDataType)

        // Creates the output tensor and its processor.
        _outputProbabilityBuffer = TensorBuffer.createFixedSize(probabilityShape, probabilityDataType)

        // Creates the post processor for the output probability.
        _probabilityProcessor = TensorProcessor.Builder().add(getPostProcessNormalizeOp()).build()

        Log.d(TAG, "Created a Tensorflow Lite Image Classifier.")
    }

    /**
     * 运行推断并返回分类结果。
     * Runs inference and returns the classification results.
     * @param bitmap Bitmap
     * @param sensorOrientation Int
     * @return List<Recognition>
     */
    fun classify(bitmap: Bitmap, sensorOrientation: Int): List<Recognition> {
        // Logs this method so that it can be analyzed with systrace.
        Trace.beginSection("recognizeImage")

        Trace.beginSection("loadImage")
        val startTimeForLoadImage = SystemClock.uptimeMillis()
        _inputImageBuffer = loadImage(bitmap, sensorOrientation)
        val endTimeForLoadImage = SystemClock.uptimeMillis()
        Trace.endSection()
        Log.v(
            TAG,
            "Time cost to load the image: " + (endTimeForLoadImage - startTimeForLoadImage)
        )

        // Runs the inference call.
        Trace.beginSection("runInference")
        val startTimeForReference = SystemClock.uptimeMillis()
        _tflite.run(_inputImageBuffer!!.buffer, _outputProbabilityBuffer.buffer.rewind())
        val endTimeForReference = SystemClock.uptimeMillis()
        Trace.endSection()
        Log.v(
            TAG,
            "Time cost to run model inference: " + (endTimeForReference - startTimeForReference)
        )

        // Gets the map of label and probability.
        val labeledProbability: Map<String, Float> =
            TensorLabel(_labels, _probabilityProcessor.process(_outputProbabilityBuffer))
                .mapWithFloatValue
        Trace.endSection()

        // Gets top-k results.
        return getTopKProbability(_resultSize, labeledProbability)
    }

    /** Loads input image, and applies preprocessing.  */
    private fun loadImage(bitmap: Bitmap, sensorOrientation: Int): TensorImage {
        // Loads bitmap into a TensorImage.
        _inputImageBuffer?.load(bitmap)

        // Creates processor for the TensorImage.
        val cropSize = bitmap.width.coerceAtMost(bitmap.height)
        val numRotation = sensorOrientation / 90
        // Fuse ops inside ImageProcessor.
        val imageProcessor: ImageProcessor = ImageProcessor.Builder()
            .add(
                ResizeWithCropOrPadOp(
                    cropSize,
                    cropSize
                )
            ) // investigate the impact of the resize algorithm on accuracy.
            // To get the same inference results as lib_task_api, which is built on top of the Task
            // Library, use ResizeMethod.BILINEAR.
            .add(ResizeOp(_imageSizeX, _imageSizeY, ResizeMethod.NEAREST_NEIGHBOR))
            .add(Rot90Op(numRotation))
            .add(getPreProcessNormalizeOp())
            .build()
        return imageProcessor.process(_inputImageBuffer)
    }

    /** Gets the top-k results.  */
    private fun getTopKProbability(resultSize: Int, labelProb: Map<String, Float>): List<Recognition> {
        // Find the best classifications.
        val pq: PriorityQueue<Recognition> =
            PriorityQueue(resultSize) { lhs, rhs -> // Intentionally reversed to put high confidence at the head of the queue.
                (rhs.confidence!!).compareTo(lhs.confidence!!)
            }
        for ((key, value) in labelProb) {
            pq.add(Recognition("" + key, key, value, null))
        }
        val recognitions: ArrayList<Recognition> = ArrayList<Recognition>()
        val recognitionsSize = pq.size.coerceAtMost(resultSize)
        for (i in 0 until recognitionsSize) {
            recognitions.add(pq.poll()!!)
        }
        return recognitions
    }

    /**
     * 关闭解释器和模型以释放资源
     * Closes the interpreter and model to release resources.
     */
    fun close() {
        _tflite.close()
        if (_gpuDelegate != null) {
            _gpuDelegate!!.close()
            _gpuDelegate = null
        }
        if (_nnApiDelegate != null) {
            _nnApiDelegate!!.close()
            _nnApiDelegate = null
        }
    }
}
