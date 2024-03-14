package com.mozhimen.digitclassifier.test

import android.annotation.SuppressLint
import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.MotionEvent
import android.view.View
import android.widget.AdapterView
import android.widget.Toast
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.mozhimen.basick.elemk.androidx.appcompat.bases.viewbinding.BaseActivityVB
import com.mozhimen.digitclassifier.TFLiteDigitClassifier
import com.mozhimen.digitclassifier.test.databinding.ActivityDigitClassifierBinding
import org.tensorflow.lite.task.vision.classifier.Classifications
import java.util.Locale

class DigitClassifierActivity : BaseActivityVB<ActivityDigitClassifierBinding>(), TFLiteDigitClassifier.DigitClassifierListener {
    private lateinit var digitClassifierHelper: TFLiteDigitClassifier
    private lateinit var classificationResultAdapter:
            ClassificationResultsAdapter

    override fun initView(savedInstanceState: Bundle?) {
        digitClassifierHelper = TFLiteDigitClassifier(
            context = this, digitClassifierListener = this
        )
        setupDigitCanvas()
        setupClassificationResultAdapter()
        // Attach listeners to UI control widgets
        initBottomSheetControls()

        vb.btnClear.setOnClickListener {
            vb.digitCanvas.clearCanvas()
            classificationResultAdapter.reset()
        }
    }

    private fun setupClassificationResultAdapter() {
        classificationResultAdapter = ClassificationResultsAdapter()
        with(vb.recyclerViewResults) {
            adapter = classificationResultAdapter
            layoutManager = LinearLayoutManager(this@DigitClassifierActivity)
            addItemDecoration(
                DividerItemDecoration(
                    this@DigitClassifierActivity,
                    DividerItemDecoration.VERTICAL
                )
            )
        }
    }

    private fun initBottomSheetControls() {
        // When clicked, lower classification score threshold floor
        vb.bottomSheetLayout.thresholdMinus.setOnClickListener {
            if (digitClassifierHelper.threshold >= 0.1) {
                digitClassifierHelper.threshold -= 0.1f
                updateControlsUi()
            }
        }

        // When clicked, raise classification score threshold floor
        vb.bottomSheetLayout.thresholdPlus.setOnClickListener {
            if (digitClassifierHelper.threshold < 0.9) {
                digitClassifierHelper.threshold += 0.1f
                updateControlsUi()
            }
        }

        // When clicked, reduce the number of objects that can be classified at a time
        vb.bottomSheetLayout.maxResultsMinus.setOnClickListener {
            if (digitClassifierHelper.maxResults > 1) {
                digitClassifierHelper.maxResults--
                updateControlsUi()
            }
        }

        // When clicked, increase the number of objects that can be classified at a time
        vb.bottomSheetLayout.maxResultsPlus.setOnClickListener {
            if (digitClassifierHelper.maxResults < 3) {
                digitClassifierHelper.maxResults++
                updateControlsUi()
            }
        }

        // When clicked, decrease the number of threads used for classification
        vb.bottomSheetLayout.threadsMinus.setOnClickListener {
            if (digitClassifierHelper.numThreads > 1) {
                digitClassifierHelper.numThreads--
                updateControlsUi()
            }
        }

        // When clicked, increase the number of threads used for classification
        vb.bottomSheetLayout.threadsPlus.setOnClickListener {
            if (digitClassifierHelper.numThreads < 4) {
                digitClassifierHelper.numThreads++
                updateControlsUi()
            }
        }

        // When clicked, change the underlying hardware used for inference. Current options are CPU
        // GPU, and NNAPI
        vb.bottomSheetLayout.spinnerDelegate.setSelection(
            0,
            false
        )
        vb.bottomSheetLayout.spinnerDelegate.onItemSelectedListener =
            object : AdapterView.OnItemSelectedListener {
                override fun onItemSelected(
                    parent: AdapterView<*>?,
                    view: View?,
                    position: Int,
                    id: Long
                ) {
                    digitClassifierHelper.currentDelegate = position
                    updateControlsUi()
                }

                override fun onNothingSelected(parent: AdapterView<*>?) {
                    /* no op */
                }
            }
    }

    // Update the values displayed in the bottom sheet. Reset classifier.
    private fun updateControlsUi() {
        vb.bottomSheetLayout.maxResultsValue.text =
            digitClassifierHelper.maxResults.toString()

        vb.bottomSheetLayout.thresholdValue.text =
            String.format(Locale.US, "%.2f", digitClassifierHelper.threshold)
        vb.bottomSheetLayout.threadsValue.text =
            digitClassifierHelper.numThreads.toString()
        // Needs to be cleared instead of reinitialized because the GPU
        // delegate needs to be initialized on the thread using it when applicable
        digitClassifierHelper.clearDigitClassifier()
    }

    @SuppressLint("ClickableViewAccessibility")
    private fun setupDigitCanvas() {
        with(vb.digitCanvas) {
            setStrokeWidth(70f)
            setColor(Color.WHITE)
            setBackgroundColor(Color.BLACK)
            setOnTouchListener { _, event ->
                // As we have interrupted DrawView's touch event, we first
                // need to pass touch events through to the instance for the drawing to show up
                onTouchEvent(event)

                // Then if user finished a touch event, run classification
                if (event.action == MotionEvent.ACTION_UP) {
                    classifyDrawing()
                }
                true
            }
        }
    }

    private fun classifyDrawing() {
        val bitmap = vb.digitCanvas.getBitmap()
        digitClassifierHelper.classify(bitmap)
    }

    override fun onError(error: String) {
        runOnUiThread {
            Toast.makeText(this, error, Toast.LENGTH_SHORT).show()
            classificationResultAdapter.reset()
        }
    }

    override fun onResults(
        results: List<Classifications>?,
        inferenceTime: Long
    ) {
        runOnUiThread {
            classificationResultAdapter.updateResults(results)
            vb.tvInferenceTime.text = this
                .getString(R.string.inference_time, inferenceTime.toString())
        }
    }

}