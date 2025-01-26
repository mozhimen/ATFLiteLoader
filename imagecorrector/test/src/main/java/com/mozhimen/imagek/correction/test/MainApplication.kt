package com.mozhimen.imagek.correction.test

import android.app.Application
import com.mozhimen.imagek.correction.ImageKCorrection

/**
 * @ClassName MainApplication
 * @Description TODO
 * @Author Mozhimen / Kolin Zhao
 * @Date 2024/2/12 18:11
 * @Version 1.0
 */
class MainApplication:Application() {
    override fun onCreate() {
        super.onCreate()
        ImageKCorrection.initTfLiteEdgeDetector(this)
    }
}