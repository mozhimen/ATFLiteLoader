package com.mozhimen.tfliteloader

import android.os.Bundle
import android.view.View
import com.mozhimen.tfliteloader.databinding.ActivityMainBinding
import com.mozhimen.tfliteloader.imageclassifier.ImageClassifierActivity
import com.mozhimen.tfliteloader.objectdetection.ObjectDetectionActivity
import com.mozhimen.basick.basek.BaseKActivityVBVM
import com.mozhimen.basick.basek.BaseKViewModel
import com.mozhimen.basick.extsk.start

class MainActivity : BaseKActivityVBVM<ActivityMainBinding, BaseKViewModel>() {
    fun goImageClassifier(view: View) {
        start<ImageClassifierActivity>()
    }

    fun goObjectDetection(view: View) {
        start<ObjectDetectionActivity>()
    }

    override fun initData(savedInstanceState: Bundle?) {

    }

    override fun bindViewVM(vb: ActivityMainBinding) {

    }
}