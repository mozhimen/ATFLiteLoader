package com.mozhimen.objectdetector.commons

import org.tensorflow.lite.task.vision.detector.Detection

/**
 * @ClassName ObjectDetector
 * @Description TODO
 * @Author mozhimen / Kolin Zhao
 * @Date 2022/6/25 11:53
 * @Version 1.0
 */
interface IObjectDetectorListener {
    fun onError(error: String)
    fun onResults(
        imageWidth: Int,
        imageHeight: Int,
        inferenceTime: Long,
        results: MutableList<Detection>?
    )
}