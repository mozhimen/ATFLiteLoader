package com.mozhimen.tfloader.imageclassifier.test

import android.view.View
import com.mozhimen.kotlin.utilk.android.content.startContext
import com.mozhimen.bindk.bases.viewbinding.activity.BaseActivityVB
import com.mozhimen.tfloader.imageclassifier.test.databinding.ActivityMainBinding

class MainActivity : BaseActivityVB<ActivityMainBinding>() {

    fun TFImageClassifier(view: View) {
        startContext<TFImageClassifierActivity>()
    }

    fun TFLiteImageClassifier(view: View) {
        startContext<TFLiteImageClassifierActivity>()
    }
}