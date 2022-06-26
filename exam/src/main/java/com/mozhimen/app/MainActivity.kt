package com.mozhimen.app

import android.Manifest
import android.annotation.SuppressLint
import android.graphics.Bitmap
import android.graphics.ImageFormat
import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.camera.core.CameraSelector
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import com.mozhimen.abilityk.cameraxk.helpers.ImageConverter
import com.mozhimen.app.databinding.ActivityMainBinding
import com.mozhimen.app.imageclassifier.ImageClassifierActivity
import com.mozhimen.app.objectdetection.ObjectDetectionActivity
import com.mozhimen.basick.basek.BaseKActivity
import com.mozhimen.basick.basek.BaseKViewModel
import com.mozhimen.basick.extsk.start
import com.mozhimen.basick.utilk.UtilKBitmap
import com.mozhimen.componentk.permissionk.PermissionK
import com.mozhimen.componentk.permissionk.annors.PermissionKAnnor
import com.mozhimen.classifyloader.tflite.TFLiteImageClassifier
import java.lang.StringBuilder
import java.util.concurrent.locks.ReentrantLock

class MainActivity : BaseKActivity<ActivityMainBinding, BaseKViewModel>(R.layout.activity_main) {
    fun goImageClassifier(view: View) {
        start<ImageClassifierActivity>()
    }

    fun goObjectDetection(view: View) {
        start<ObjectDetectionActivity>()
    }
}