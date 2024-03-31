package com.mozhimen.tfloader.objectdetector.mos

import android.graphics.Bitmap
import org.tensorflow.lite.task.vision.detector.Detection

/**
 * @ClassName DetectionResult
 * @Description TODO
 * @Author Mozhimen / Kolin Zhao
 * @Date 2024/3/30 1:36
 * @Version 1.0
 */
data class DetectionResult(
    val bitmap: Bitmap,
    val imageWidth: Int,
    val imageHeight: Int,
    val inferenceTime: Long,
    val results: MutableList<Detection>?
)
