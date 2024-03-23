package com.mozhimen.tfloader.imageclassifier.tflitelabel

import com.mozhimen.tfloader.mos.ChipType
import org.tensorflow.lite.support.common.TensorOperator
import org.tensorflow.lite.support.common.ops.NormalizeOp


/**
 * @ClassName TFLiteLoaderFloatMobileNet
 * @Description TODO
 * @Author mozhimen / Kolin Zhao
 * @Date 2022/6/18 10:21
 * @Version 1.0
 */
class TFLiteLabelImageClassifierFloatMobileNet(
    modelPath: String,
    labelPath: String,
    resultSize: Int,
    chipType: ChipType,
    numThreads: Int
) : TFLiteLabelImageClassifier(modelPath, labelPath, resultSize, chipType, numThreads) {
    /** Float MobileNet requires additional normalization of the used input.  */
    private val IMAGE_MEAN = 127.5f

    private val IMAGE_STD = 127.5f

    /**
     * Float model does not need dequantization in the post-processing. Setting mean and std as 0.0f
     * and 1.0f, repectively, to bypass the normalization.
     */
    private val PROBABILITY_MEAN = 0.0f

    private val PROBABILITY_STD = 255.0f

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