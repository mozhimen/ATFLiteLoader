package com.mozhimen.tfloader.imageclassifier.tflite

import android.annotation.SuppressLint
import android.graphics.Bitmap
import android.graphics.Rect
import android.os.SystemClock
import android.os.Trace
import android.util.Log
import com.mozhimen.tfloader.mos.ChipType
import com.mozhimen.tfloader.mos.Recognition
import com.mozhimen.kotlin.utilk.bases.BaseUtilK
import org.tensorflow.lite.support.common.FileUtil
import org.tensorflow.lite.support.common.ops.NormalizeOp
import org.tensorflow.lite.support.image.ImageProcessor
import org.tensorflow.lite.support.image.TensorImage
import org.tensorflow.lite.support.image.ops.ResizeOp
import org.tensorflow.lite.support.metadata.MetadataExtractor
import org.tensorflow.lite.task.core.BaseOptions
import org.tensorflow.lite.task.core.vision.ImageProcessingOptions
import org.tensorflow.lite.task.vision.classifier.Classifications
import org.tensorflow.lite.task.vision.classifier.ImageClassifier
import org.tensorflow.lite.task.vision.classifier.ImageClassifier.ImageClassifierOptions
import java.io.IOException


/**
 * @ClassName TFLiteImageClassifier
 * @Description 一个专门使用TensorFlow Lite来标记图像的加载器。适配于采用tflite_model_maker构建的tflite
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
@SuppressLint("LongLogTag")
open class TFLiteImageClassifier(
    modelPath: String,
    resultSize: Int,
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
            resultSize: Int = 1,
            chipType: ChipType = ChipType.CPU,
            numThreads: Int = 1
        ): TFLiteImageClassifier {
            return TFLiteImageClassifier(modelPath, resultSize, chipType, numThreads)
        }
    }

    private val _imageSizeX: Int//得到图像沿x轴的大小 Get the image size along the x axis.
    private val _imageSizeY: Int//得到图像沿y轴的大小 Get the image size along the y axis.
    private val _imageClassifier: ImageClassifier//使用Tensorflow Lite运行模型推断的驱动类实例 An instance of the driver class to run model inference with Tensorflow Lite.

    /**
     * 初始化一个分类器
     * Initializes a `Classifier`.
     */
    init {
        val baseOptionsBuilder = BaseOptions.builder()
        when (chipType) {
            ChipType.GPU -> baseOptionsBuilder.useGpu()
            ChipType.NNAPI -> baseOptionsBuilder.useNnapi()
            else -> {
            }
        }

        //创建ImageClassifier实例 Create the ImageClassifier instance.
        val options = ImageClassifierOptions.builder()
            .setBaseOptions(baseOptionsBuilder.setNumThreads(numThreads).build())
            .setMaxResults(resultSize)
            .build()
        _imageClassifier = ImageClassifier.createFromFileAndOptions(_context, modelPath, options)
        Log.d(TAG, "init Created a Tensorflow Lite Image Classifier.")

        //获取底层tflite模型的输入图像大小信息 Get the input image size information of the underlying tflite model.
        val tfliteModelType = FileUtil.loadMappedFile(_context, modelPath)
        val metadataExtractor = MetadataExtractor(tfliteModelType)
        //图像形状的格式为{1, height, width, 3} Image shape is in the format of {1, height, width, 3}.
        val imageShape: IntArray = metadataExtractor.getInputTensorShape( /*inputIndex=*/0)
        _imageSizeY = imageShape[1]
        _imageSizeX = imageShape[2]
    }

    private var _imageProcessor: ImageProcessor? = null

    fun getImageProcessor(targetHeight: Int, targetWidth: Int): ImageProcessor =
        if (_imageProcessor == null) {
            ImageProcessor.Builder()
                .add(ResizeOp(targetHeight, targetWidth, ResizeOp.ResizeMethod.BILINEAR))
                .add(NormalizeOp(0f, 1f))
                .build().also { _imageProcessor = it }
        } else _imageProcessor!!

    /**
     * 运行推断并返回分类结果。
     * Runs inference and returns the classification results.
     * @param bitmap Bitmap
     * @param sensorOrientation Int
     * @return List<Recognition>
     */
    fun classify(bitmap: Bitmap, sensorOrientation: Int, isNormalize: Boolean = false): List<Recognition> {
        // 将该方法记录为日志, 以便使用systrace进行分析 Logs this method so that it can be analyzed with systrace.
        Trace.beginSection("recognizeImage")
        var inputImage = TensorImage.fromBitmap(bitmap)
        val width = bitmap.width
        val height = bitmap.height
        val cropSize = width.coerceAtMost(height)
        if (isNormalize)
            inputImage = getImageProcessor(height, width).process(inputImage)
        // Task Library 使用双线性插值调整图像的大小, 这与lib_support中使用的最近邻采样算法略有不同 Task Library resize the images using bilinear interpolation, which is slightly different from the nearest neighbor sampling algorithm used in lib_support. See https://github.com/tensorflow/examples/blob/0ef3d93e2af95d325c70ef3bcbbd6844d0631e07/lite/examples/image_classification/android/lib_support/src/main/java/org/tensorflow/lite/examples/classification/tflite/Classifier.java#L310.
        val imageOptions = ImageProcessingOptions.builder()
            .setOrientation(getOrientation(sensorOrientation)) // Set the ROI to the center of the image.
            .setRoi(
                Rect( /*left=*/
                    (width - cropSize) / 2,  /*top=*/
                    (height - cropSize) / 2,  /*right=*/
                    (width + cropSize) / 2,  /*bottom=*/
                    (height + cropSize) / 2
                )
            )
            .build()

        // 运行推断调用 Runs the inference call.
        Trace.beginSection("runInference")
        val startTimeForReference = SystemClock.uptimeMillis()
        val results = _imageClassifier.classify(inputImage, imageOptions)
        val endTimeForReference = SystemClock.uptimeMillis()
        Trace.endSection()
        Log.d(TAG, "Time cost to run model inference: " + (endTimeForReference - startTimeForReference))
        Trace.endSection()
        return getRecognitions(results)
    }

    /**
     * 关闭解释器和模型以释放资源
     * Closes the interpreter and model to release resources.
     */
    fun close() {
        _imageClassifier.close()
    }

    /**
     * 将{分类}对象列表转换为{识别}对象列表，以匹配其他推断方法的接口，例如使用{TFLite支持库}。
     * Converts a list of [Classifications] objects into a list of [Recognition] objects
     * to match the interface of other inference method, such as using the [TFLite
         * Support Library.](https://github.com/tensorflow/examples/tree/master/lite/examples/image_classification/android/lib_support).
     * @param classifications List<Classifications>
     * @return List<Recognition>
     */
    private fun getRecognitions(classifications: List<Classifications>): List<Recognition> {
        val recognitions = ArrayList<Recognition>()
        //所有的演示模型都是单头模型。在结果中获得第一个分类 All the demo models are single head models. Get the first Classifications in the results.
        for (category in classifications[0].categories) {
            recognitions.add(Recognition(category.label, category.label, category.score, null))
        }
        return recognitions
    }

    /**
     * 将相机方向转换为 Convert the camera orientation in degree into{@link ImageProcessingOptions#Orientation}.
     * @param cameraOrientation Int
     * @return ImageProcessingOptions.Orientation
     */
    private fun getOrientation(cameraOrientation: Int): ImageProcessingOptions.Orientation {
        return when (cameraOrientation / 90) {
            3 -> ImageProcessingOptions.Orientation.BOTTOM_LEFT
            2 -> ImageProcessingOptions.Orientation.BOTTOM_RIGHT
            1 -> ImageProcessingOptions.Orientation.TOP_RIGHT
            else -> ImageProcessingOptions.Orientation.TOP_LEFT
        }
    }
}
