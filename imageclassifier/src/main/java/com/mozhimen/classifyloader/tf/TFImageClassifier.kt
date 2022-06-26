package com.mozhimen.classifyloader.tf

import android.content.res.AssetManager
import android.graphics.Bitmap
import android.os.Trace
import android.util.Log
import com.mozhimen.baseloader.mos.Recognition
import com.mozhimen.basick.utilk.UtilKGlobal
import org.tensorflow.Operation
import org.tensorflow.contrib.android.TensorFlowInferenceInterface
import java.io.BufferedReader
import java.io.IOException
import java.io.InputStreamReader
import java.util.*

/**
 * @ClassName TFlLoaderPb
 * @Description 一个专门使用TensorFlow pb来分类图像的加载器
 * 此方法仅限于你的tensorflow版本低于1.13.1
 * 不然会报错Failed to load model from 'output_graph.pb'
 * @Author mozhimen / Kolin Zhao
 * @Date 2022/6/21 11:11
 * @Version 1.0
 */
class TFImageClassifier(
    modelPath: String,
    private val _labels: Vector<String>,
    private val _inputName: String,
    private val _inputSize: Int,
    private val _outputName: String,
    private val _imageMean: Float,
    private val _imageStd: Float,
    private val _threshold: Float,
    private val _resNum: Int,
) {

    /*private val MAX_RESULTS = 3
    private val THRESHOLD = 0.1f*/
    private var _inferenceInterface: TensorFlowInferenceInterface =
        TensorFlowInferenceInterface(UtilKGlobal.instance.getApp()!!.assets, modelPath)

    // Pre-allocated buffers.
    private val _intValues: IntArray
    private val _floatValues: FloatArray
    private val _outputs: FloatArray
    private val _outputNames: Array<String>
    private var _logStats = false

    companion object {
        private const val TAG = "TFImageClassifier>>>>>"

        /**
         * Initializes a native TensorFlow session for classifying images.
         * @param modelPath String
         * @param labelPath String
         * @param assetManager AssetManager
         * @param inputName String
         * @param inputSize Int
         * @param outputName String
         * @param imageMean Int
         * @param imageStd Float
         * @return TFImageClassifier
         */
        @Throws(IOException::class)
        fun create(
            modelPath: String,
            labelPath: String,
            assetManager: AssetManager,
            inputName: String,
            inputSize: Int,
            outputName: String,
            imageMean: Float,
            imageStd: Float,
            threshold: Float,
            resNum: Int
        ): TFImageClassifier {
            val labels = Vector<String>()
            // Read the label names into memory.
            val bufferedReader = BufferedReader(InputStreamReader(assetManager.open(labelPath)))
            var line: String?
            while (bufferedReader.readLine().also { line = it } != null) {
                labels.add(line)
            }
            bufferedReader.close()
            return TFImageClassifier(
                modelPath,
                labels,
                inputName,
                inputSize,
                outputName,
                imageMean,
                imageStd,
                threshold,
                resNum
            )
        }
    }

    init {
        // The shape of the output is [N, NUM_CLASSES], where N is the batch size.
        val operation: Operation = _inferenceInterface.graphOperation(_outputName)
        val numClasses: Int = operation.output<Any>(0).shape().size(1).toInt()
        Log.d(TAG, "Read " + _labels.size + " labels, output layer size is " + numClasses)

        // Pre-allocate buffers.
        _outputNames = arrayOf(_outputName)
        _intValues = IntArray(_inputSize * _inputSize)
        _floatValues = FloatArray(_inputSize * _inputSize * 3)
        _outputs = FloatArray(numClasses)
    }

    fun classify(bitmap: Bitmap): List<Recognition> {
        // Log this method so that it can be analyzed with systrace.
        Trace.beginSection("recognizeImage")
        Trace.beginSection("preprocessBitmap")
        // Preprocess the image data from 0-255 int to normalized float based
        // on the provided parameters.
        bitmap.getPixels(_intValues, 0, bitmap.width, 0, 0, bitmap.width, bitmap.height)
        for (i in _intValues.indices) {
            val itemVal = _intValues[i]
            _floatValues[i * 3 + 0] = ((itemVal shr 16 and 0xFF) - _imageMean) / _imageStd
            _floatValues[i * 3 + 1] = ((itemVal shr 8 and 0xFF) - _imageMean) / _imageStd
            _floatValues[i * 3 + 2] = ((itemVal and 0xFF) - _imageMean) / _imageStd
        }
        Trace.endSection()

        // Copy the input data into TensorFlow.
        Trace.beginSection("feed")
        _inferenceInterface.feed(_inputName, _floatValues, 1L, _inputSize.toLong(), _inputSize.toLong(), 3L)
        Trace.endSection()

        // Run the inference call.
        Trace.beginSection("run")
        _inferenceInterface.run(_outputNames, _logStats)
        Trace.endSection()

        // Copy the output Tensor back into the output array.
        Trace.beginSection("fetch")
        _inferenceInterface.fetch(_outputName, _outputs)
        Trace.endSection()

        // Find the best classifications.
        val pq: PriorityQueue<Recognition> = PriorityQueue(
            3
        ) { lhs, rhs -> // Intentionally reversed to put high confidence at the head of the queue.
            (rhs.confidence!!).compareTo(lhs.confidence!!)
        }
        for (i in _outputs.indices) {
            if (_outputs[i] > _threshold) {
                pq.add(
                    Recognition(
                        "" + i, if (_labels.size > i) _labels[i] else "unknown", _outputs[i], null
                    )
                )
            }
        }
        val recognitions: ArrayList<Recognition> = ArrayList<Recognition>()
        val recognitionsSize = pq.size.coerceAtMost(_resNum)
        for (i in 0 until recognitionsSize) {
            recognitions.add(pq.poll()!!)
        }
        Trace.endSection() // "recognizeImage"
        return recognitions
    }

    fun enableStatLogging(logStats: Boolean) {
        this._logStats = logStats
    }

    fun getStatString(): String {
        return _inferenceInterface.statString
    }

    fun close() {
        _inferenceInterface.close()
    }
}