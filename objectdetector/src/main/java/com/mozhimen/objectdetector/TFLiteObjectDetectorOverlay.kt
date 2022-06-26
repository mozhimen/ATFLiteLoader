package com.mozhimen.objectdetector

import android.content.Context
import android.graphics.*
import android.util.AttributeSet
import android.view.View
import androidx.core.content.ContextCompat
import org.tensorflow.lite.task.vision.detector.Detection
import java.util.*
import kotlin.math.max

/**
 * @ClassName TFLiteObjectDetectorOverlay
 * @Description TODO
 * @Author mozhimen / Kolin Zhao
 * @Date 2022/6/25 13:32
 * @Version 1.0
 */
class TFLiteObjectDetectorOverlay @JvmOverloads constructor(
    context: Context, attrs: AttributeSet? = null
) : View(context, attrs) {

    companion object {
        private const val BOUNDING_RECT_TEXT_PADDING = 8
    }

    private var _scaleFactor: Float = 1f

    private var _results: List<Detection> = LinkedList<Detection>()
    private var _boxPaint = Paint()
    private var _textBackgroundPaint = Paint()
    private var _textPaint = Paint()
    private var _bounds = Rect()

    init {
        initPaints()
    }

    fun setObjectRect(
        imageWidth: Int,
        imageHeight: Int,
        detectionResults: MutableList<Detection>,
    ) {
        _results = detectionResults

        // PreviewView is in FILL_START mode. So we need to scale up the bounding box to match with
        // the size that the captured images will be displayed.
        _scaleFactor = max(width * 1f / imageWidth, height * 1f / imageHeight)
        invalidate()
    }

    fun clear() {
        _textPaint.reset()
        _textBackgroundPaint.reset()
        _boxPaint.reset()
        invalidate()
        initPaints()
    }

    private fun initPaints() {
        _textBackgroundPaint.color = Color.BLACK
        _textBackgroundPaint.style = Paint.Style.FILL
        _textBackgroundPaint.textSize = 50f

        _textPaint.color = Color.WHITE
        _textPaint.style = Paint.Style.FILL
        _textPaint.textSize = 50f

        _boxPaint.color = ContextCompat.getColor(context!!, R.color.blue_normal)
        _boxPaint.strokeWidth = 8F
        _boxPaint.style = Paint.Style.STROKE
    }

    override fun draw(canvas: Canvas) {
        super.draw(canvas)

        for (result in _results) {
            val boundingBox = result.boundingBox

            val top = boundingBox.top * _scaleFactor
            val bottom = boundingBox.bottom * _scaleFactor
            val left = boundingBox.left * _scaleFactor
            val right = boundingBox.right * _scaleFactor

            // Draw bounding box around detected objects
            val drawableRect = RectF(left, top, right, bottom)
            canvas.drawRect(drawableRect, _boxPaint)

            // Create text to display alongside detected objects
            val drawableText =
                result.categories[0].label + " " +
                        String.format("%.2f", result.categories[0].score)

            // Draw rect behind display text
            _textBackgroundPaint.getTextBounds(drawableText, 0, drawableText.length, _bounds)
            val textWidth = _bounds.width()
            val textHeight = _bounds.height()
            canvas.drawRect(
                left,
                top,
                left + textWidth + Companion.BOUNDING_RECT_TEXT_PADDING,
                top + textHeight + Companion.BOUNDING_RECT_TEXT_PADDING,
                _textBackgroundPaint
            )

            // Draw text for detected object
            canvas.drawText(drawableText, left, top + _bounds.height(), _textPaint)
        }
    }
}