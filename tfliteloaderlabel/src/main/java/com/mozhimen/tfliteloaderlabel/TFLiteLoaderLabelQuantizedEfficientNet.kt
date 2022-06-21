package com.mozhimen.tfliteloaderlabel

import com.mozhimen.baseloader.mos.ChipType
import org.tensorflow.lite.support.common.TensorOperator
import org.tensorflow.lite.support.common.ops.NormalizeOp


/**
 * @ClassName TFLiteLoaderQuantizedEfficientNet
 * @Description TODO
 * @Author mozhimen / Kolin Zhao
 * @Date 2022/6/18 10:26
 * @Version 1.0
 */
class TFLiteLoaderLabelQuantizedEfficientNet(
    modelPath: String,
    labelPath: String,
    resultSize: Int,
    chipType: ChipType,
    numThreads: Int
) : TFLiteLoaderLabel(modelPath, labelPath, resultSize, chipType, numThreads) {

    /**
     * The quantized model does not require normalization, thus set mean as 0.0f, and std as 1.0f to
     * bypass the normalization.
     */
    private val IMAGE_MEAN = 0.0f

    private val IMAGE_STD = 1.0f

    /** Quantized MobileNet requires additional dequantization to the output probability.  */
    private val PROBABILITY_MEAN = 0.0f

    private val PROBABILITY_STD = 255.0f
    override fun getPostProcessNormalizeOp(): TensorOperator {
        return NormalizeOp(
            IMAGE_MEAN,
            IMAGE_STD
        )
    }

    override fun getPreProcessNormalizeOp(): TensorOperator {
        return NormalizeOp(
            PROBABILITY_MEAN,
            PROBABILITY_STD
        )
    }
}