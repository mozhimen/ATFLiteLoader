package com.mozhimen.tfliteloader

import com.mozhimen.baseloader.mos.ChipType

/**
 * @ClassName TFLiteLoaderQuantizedMobileNet
 * @Description TODO
 * @Author Kolin Zhao / Mozhimen
 * @Date 2022/6/17 19:27
 * @Version 1.0
 */
class TFLiteLoaderQuantizedMobileNet(
    modelPath: String,
    resultSize: Int,
    chipType: ChipType,
    numThreads: Int
) : TFLiteLoader(modelPath, resultSize, chipType, numThreads) {
    
}