package com.mozhimen.tfloader.exam

import android.view.View
import com.mozhimen.basick.elemk.androidx.appcompat.bases.databinding.BaseActivityVDB
import com.mozhimen.basick.utilk.android.content.startContext
import com.mozhimen.tfloader.databinding.ActivityMainBinding
import com.mozhimen.tfloader.exam.imageclassifier.ImageClassifierActivity
import com.mozhimen.tfloader.exam.objectdetection.ObjectDetectionActivity

class MainActivity : BaseActivityVDB<ActivityMainBinding>() {
    fun goImageClassifier(view: View) {
        startContext<ImageClassifierActivity>()
    }

    fun goObjectDetection(view: View) {
        startContext<ObjectDetectionActivity>()
    }
}