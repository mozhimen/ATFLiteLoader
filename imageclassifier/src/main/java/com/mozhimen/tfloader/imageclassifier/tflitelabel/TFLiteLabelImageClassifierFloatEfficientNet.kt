package com.mozhimen.tfloader.imageclassifier.tflitelabel

import com.mozhimen.tfloader.mos.ChipType
import org.tensorflow.lite.support.common.TensorOperator
import org.tensorflow.lite.support.common.ops.NormalizeOp


/**
 * @ClassName TFLiteLoaderFloatEfficientNet
 * @Description TODO
 * @Author mozhimen / Kolin Zhao
 * @Date 2022/6/18 10:23
 * @Version 1.0
 */
open class TFLiteLabelImageClassifierFloatEfficientNet(
    modelPath: String,
    labelPath: String,
    resultSize: Int,
    chipType: ChipType,
    numThreads: Int
) : TFLiteLabelImageClassifier(modelPath, labelPath, resultSize, chipType, numThreads) {
    private val IMAGE_MEAN = 127.0f
    private val IMAGE_STD = 128.0f

    /**
     * Float model does not need dequantization in the post-processing. Setting mean and std as 0.0f
     * and 1.0f, repectively, to bypass the normalization.
     */
    private val PROBABILITY_MEAN = 0.0f
    private val PROBABILITY_STD = 1.0f

    override fun getPreProcessNormalizeOp(): TensorOperator {
        return NormalizeOp(
            IMAGE_MEAN,
            IMAGE_STD
        )
    }

    override fun getPostProcessNormalizeOp(): TensorOperator {
        return NormalizeOp(
            PROBABILITY_MEAN,
            PROBABILITY_STD
        )
    }
}