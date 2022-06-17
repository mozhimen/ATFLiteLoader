package com.mozhimen.tfliteloader.mos

import android.graphics.RectF

/**
 * @ClassName Recognition
 * @Description 一个不可变的结果，由分类器返回，描述被识别的内容。 An immutable result returned by a Classifier describing what was recognized.
 * @Author Kolin Zhao / Mozhimen
 * @Date 2022/6/17 17:14
 * @Version 1.0
 */
data class Recognition(
    /**
     * 已识别事物的唯一标识符。特定于类，而不是实例
     * A unique identifier for what has been recognized. Specific to the class, not the instance of
     * the object.
     */
    val id: String?,
    /**
     * 显示名称以进行识别
     * Display name for the recognition.
     */
    val title: String?,
    /**
     * 这是一个相对于其他识别程度的可分类分数。越高越好
     * A sortable score for how good the recognition is relative to others. Higher should be better.
     */
    val confidence: Float?,
    /**
     * 源图像中可选的位置，用于识别对象的位置
     * Optional location within the source image for the location of the recognized object.
     */
    private var location: RectF?
) {

    fun getLocation(): RectF {
        return RectF(location)
    }

    fun setLocation(location: RectF?) {
        this.location = location
    }

    override fun toString(): String {
        var resultString = ""
        if (id != null) {
            resultString += "[$id] "
        }
        if (title != null) {
            resultString += "$title "
        }
        if (confidence != null) {
            resultString += String.format("(%.1f%%) ", confidence * 100.0f)
        }
        if (location != null) {
            resultString += location.toString() + " "
        }
        return resultString.trim { it <= ' ' }
    }
}
