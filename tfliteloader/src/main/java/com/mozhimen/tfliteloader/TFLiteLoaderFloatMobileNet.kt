package com.mozhimen.tfliteloader

import com.mozhimen.baseloader.mos.ChipType

/**
 * @ClassName TFLiteLoaderFloatMobileNet
 * @Description TODO
 * @Author mozhimen / Kolin Zhao
 * @Date 2022/6/18 10:21
 * @Version 1.0
 */
class TFLiteLoaderFloatMobileNet(
    modelPath: String,
    resultSize: Int,
    chipType: ChipType,
    numThreads: Int
) : TFLiteLoader(modelPath, resultSize, chipType, numThreads) {

}