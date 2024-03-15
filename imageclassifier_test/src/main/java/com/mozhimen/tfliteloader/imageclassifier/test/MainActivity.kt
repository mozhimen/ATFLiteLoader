package com.mozhimen.tfliteloader.imageclassifier.test

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import com.mozhimen.basick.elemk.androidx.appcompat.bases.viewbinding.BaseActivityVB
import com.mozhimen.basick.utilk.android.content.startContext
import com.mozhimen.classifyloader.tf.TFImageClassifier
import com.mozhimen.tfliteloader.imageclassifier.test.databinding.ActivityMainBinding

class MainActivity : BaseActivityVB<ActivityMainBinding>() {
    fun TFImageClassifier(view: View) {
        startContext<TFImageClassifierActivity>()
    }

    fun TFLiteImageClassifier(view: View) {
        startContext<TFLiteImageClassifierActivity>()
    }
}