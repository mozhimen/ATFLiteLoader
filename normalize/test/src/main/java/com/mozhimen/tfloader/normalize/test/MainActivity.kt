package com.mozhimen.tfloader.normalize.test

import android.view.View
import com.mozhimen.bindk.bases.viewbinding.activity.BaseActivityVB
import com.mozhimen.kotlin.utilk.android.content.startContext
import com.mozhimen.tfloader.normalize.test.databinding.ActivityMainBinding

class MainActivity : BaseActivityVB<ActivityMainBinding>() {
    fun goEdgeDetection(view: View){
        startContext<EdgeDetectionActivity>()
    }
}