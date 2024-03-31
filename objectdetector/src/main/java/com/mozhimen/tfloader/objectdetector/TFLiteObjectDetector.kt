package com.mozhimen.tfloader.objectdetector

import android.annotation.SuppressLint
import android.graphics.Bitmap
import android.os.SystemClock
import android.util.Log
import com.mozhimen.basick.utilk.android.graphics.applyBitmapAnyCompress
import com.mozhimen.basick.utilk.android.graphics.compressBitmapAny2bitmapRgb565
import com.mozhimen.tfloader.mos.ChipType
import com.mozhimen.basick.utilk.bases.BaseUtilK
import com.mozhimen.tfloader.objectdetector.commons.IObjectDetectorListener
import com.mozhimen.tfloader.objectdetector.mos.DetectionResult
import org.tensorflow.lite.gpu.CompatibilityList
import org.tensorflow.lite.support.image.ImageProcessor
import org.tensorflow.lite.support.image.TensorImage
import org.tensorflow.lite.support.image.ops.Rot90Op
import org.tensorflow.lite.task.core.BaseOptions
import org.tensorflow.lite.task.vision.detector.ObjectDetector
import java.io.IOException

/**
 * @ClassName TFLiteObjectDetector
 * @Description TODO
 * @Author mozhimen / Kolin Zhao
 * @Date 2022/6/25 12:15
 * @Version 1.0
 */
@SuppressLint("LongLogTag")
class TFLiteObjectDetector(
    modelPath: String,
    threshold: Float,
    resultSize: Int,
    numThreads: Int,
    chipType: ChipType,
    objectDetectorListener: IObjectDetectorListener?
) : BaseUtilK() {
    companion object {
        private const val TAG = "TFLiteObjectDetector>>>>>"

        /**
         * 使用提供的配置创建一个处理器
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
            threshold: Float = 0.1f,
            resultSize: Int = 1,
            chipType: ChipType = ChipType.CPU,
            numThreads: Int = 1,
            listener: IObjectDetectorListener? = null
        ): TFLiteObjectDetector {
            return TFLiteObjectDetector(modelPath, threshold, resultSize, numThreads, chipType, listener)
        }
    }

    // For this example this needs to be a var so it can be reset on changes. If the ObjectDetector
    // will not change, a lazy val would be preferable.
    private var _objectDetector: ObjectDetector? = null
    private var _objectDetectorListener: IObjectDetectorListener? = null

    // Initialize the object detector using current settings on the
    // thread that is using it. CPU and NNAPI delegates can be used with detectors
    // that are created on the main thread and used on a background thread, but
    // the GPU delegate needs to be used on the thread that initialized the detector
    init {
        _objectDetectorListener = objectDetectorListener
        // Create the base options for the detector using specifies max results and score threshold
        val optionsBuilder =
            ObjectDetector.ObjectDetectorOptions.builder()
                .setScoreThreshold(threshold)
                .setMaxResults(resultSize)

        // Set general detection options, including number of used threads
        val baseOptionsBuilder = BaseOptions.builder().setNumThreads(numThreads)

        // Use the specified hardware for running the model. Default to CPU
        when (chipType) {
            ChipType.CPU -> {
                // Default
            }

            ChipType.GPU -> {
                if (CompatibilityList().isDelegateSupportedOnThisDevice) {
                    baseOptionsBuilder.useGpu()
                } else {
                    objectDetectorListener?.onError("GPU is not supported on this device")
                }
            }

            ChipType.NNAPI -> {
                baseOptionsBuilder.useNnapi()
            }
        }

        optionsBuilder.setBaseOptions(baseOptionsBuilder.build())

        try {
            _objectDetector =
                ObjectDetector.createFromFileAndOptions(_context, modelPath, optionsBuilder.build())
        } catch (e: IllegalStateException) {
            e.printStackTrace()
            _objectDetectorListener?.onError(
                "Object detector failed to initialize. See error logs for details"
            )
            Log.e(TAG, "TFLite failed to load model with error: " + e.message)
        }
    }

    fun detectAsync(bitmap: Bitmap, imageRotation: Int) {
        // Inference time is the difference between the system time at the start and finish of the
        // process
        var inferenceTime = SystemClock.uptimeMillis()

        // Create preprocessor for the image.
        // See https://www.tensorflow.org/lite/inference_with_metadata/
        //            lite_support#imageprocessor_architecture
        val imageProcessor =
            ImageProcessor.Builder()
                .add(Rot90Op(-imageRotation / 90))
                .build()

        // Preprocess the image and convert it into a TensorImage for detection.
        val tensorImage = imageProcessor.process(TensorImage.fromBitmap(bitmap))

        val results = _objectDetector?.detect(tensorImage)
        inferenceTime = SystemClock.uptimeMillis() - inferenceTime
        _objectDetectorListener?.onResults(
            bitmap,
            tensorImage.width,
            tensorImage.height,
            inferenceTime,
            results
        )
    }

    fun detect(bitmap: Bitmap, imageRotation: Int): DetectionResult {
        // Inference time is the difference between the system time at the start and finish of the
        // process
        var inferenceTime = SystemClock.uptimeMillis()

        // Create preprocessor for the image.
        // See https://www.tensorflow.org/lite/inference_with_metadata/
        //            lite_support#imageprocessor_architecture
        val imageProcessor =
            ImageProcessor.Builder()
                .add(Rot90Op(-imageRotation / 90))
                .build()

        // Preprocess the image and convert it into a TensorImage for detection.
        val tensorImage = imageProcessor.process(TensorImage.fromBitmap(bitmap))

        val results = _objectDetector?.detect(tensorImage)
        inferenceTime = SystemClock.uptimeMillis() - inferenceTime
//        _objectDetectorListener?.onResults(
//            bitmap,
//            tensorImage.width,
//            tensorImage.height,
//            inferenceTime,
//            results
//        )
        val bitmapNew = bitmap.compressBitmapAny2bitmapRgb565()
        return DetectionResult(bitmapNew, tensorImage.width, tensorImage.height, inferenceTime, results)
    }

    fun close() {
        _objectDetectorListener = null
        _objectDetector = null
    }

}