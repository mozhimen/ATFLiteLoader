package com.mozhimen.imagek.correction

import android.content.Context
import com.mozhimen.kotlin.lintk.optins.OApiInit_InApplication

/**
 * @ClassName ImageKCorrectionMgr
 * @Description TODO
 * @Author Mozhimen / Kolin Zhao
 * @Date 2024/2/13 11:14
 * @Version 1.0
 */
@OApiInit_InApplication
object ImageKCorrectionMgr {
    @JvmStatic
    fun initTfLiteEdgeDetector(context: Context) {
        ImageKCorrection.initTfLiteEdgeDetector(context)
    }

    @JvmStatic
    fun initTfLiteEdgeDetector(context: Context, modelFile: String) {
        ImageKCorrection.initTfLiteEdgeDetector(context, modelFile)
    }
}