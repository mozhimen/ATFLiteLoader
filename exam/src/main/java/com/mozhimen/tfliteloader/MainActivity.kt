package com.mozhimen.tfliteloader

import android.view.View
import com.mozhimen.basick.elemk.androidx.appcompat.bases.databinding.BaseActivityVB
import com.mozhimen.basick.utilk.android.content.startContext
import com.mozhimen.tfliteloader.databinding.ActivityMainBinding
import com.mozhimen.tfliteloader.imageclassifier.ImageClassifierActivity
import com.mozhimen.tfliteloader.objectdetection.ObjectDetectionActivity

class MainActivity : BaseActivityVB<ActivityMainBinding>() {
    fun goImageClassifier(view: View) {
        startContext<ImageClassifierActivity>()
    }

    fun goObjectDetection(view: View) {
        startContext<ObjectDetectionActivity>()
    }
}