package com.mozhimen.tfliteloader

import com.mozhimen.baseloader.mos.ChipType

/**
 * @ClassName TFLiteLoaderFloatEfficientNet
 * @Description TODO
 * @Author mozhimen / Kolin Zhao
 * @Date 2022/6/18 10:23
 * @Version 1.0
 */
class TFLiteLoaderFloatEfficientNet(
    modelPath: String,
    resultSize: Int,
    chipType: ChipType,
    numThreads: Int
) : TFLiteLoader(modelPath, resultSize, chipType, numThreads) {

}