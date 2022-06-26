package com.mozhimen.app.imageclassifier

import android.Manifest
import android.annotation.SuppressLint
import android.graphics.Bitmap
import android.graphics.ImageFormat
import android.os.Bundle
import android.util.Log
import androidx.camera.core.CameraSelector
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import com.mozhimen.abilityk.cameraxk.helpers.ImageConverter
import com.mozhimen.app.R
import com.mozhimen.app.databinding.ActivityImageClassifierBinding
import com.mozhimen.basick.basek.BaseKActivity
import com.mozhimen.basick.basek.BaseKViewModel
import com.mozhimen.basick.utilk.UtilKBitmap
import com.mozhimen.classifyloader.tflite.TFLiteImageClassifier
import com.mozhimen.componentk.permissionk.PermissionK
import com.mozhimen.componentk.permissionk.annors.PermissionKAnnor
import java.lang.StringBuilder
import java.util.concurrent.locks.ReentrantLock

@PermissionKAnnor(permissions = [Manifest.permission.CAMERA])
class ImageClassifierActivity : BaseKActivity<ActivityImageClassifierBinding, BaseKViewModel>(R.layout.activity_image_classifier) {
    private lateinit var _tFLiteImageClassifier: TFLiteImageClassifier
//    private lateinit var _tFLiteLabelImageClassifier: TFLiteLabelImageClassifier
//    private lateinit var _tFImageClassifier: TFImageClassifier

    override fun initData(savedInstanceState: Bundle?) {
        PermissionK.initPermissions(this) {
            if (it) {
                initView(savedInstanceState)
            } else {
                PermissionK.applySetting(this)
            }
        }
    }

    override fun initView(savedInstanceState: Bundle?) {
        initLiteLoader()
        initCamera()
    }

    private fun initLiteLoader() {
        _tFLiteImageClassifier = TFLiteImageClassifier.create("health_model.tflite", resultSize = 3)
//        _tFLiteLabelImageClassifier = TFLiteLabelImageClassifier.create("?", "labels.txt", modelType = ModelType.QUANTIZED_EFFICIENTNET)
//        _tFImageClassifier = TFImageClassifier.create("output_graph.pb", "output_labels.txt", "input", 299, "output", 128f, 128f, 0.1f, 1)
    }

    private fun initCamera() {
        vb.imageClassifierPreview.initCamera(this, CameraSelector.DEFAULT_BACK_CAMERA)
        vb.imageClassifierPreview.setImageAnalyzer(_frameAnalyzer)
        vb.imageClassifierPreview.startCamera()
    }

    private val _frameAnalyzer: ImageAnalysis.Analyzer by lazy {
        object : ImageAnalysis.Analyzer {
            private val _reentrantLock = ReentrantLock()
            private val _stringBuilder = StringBuilder()

            @SuppressLint("UnsafeOptInUsageError", "SetTextI18n")
            override fun analyze(image: ImageProxy) {
                try {
                    _reentrantLock.lock()
                    val bitmap: Bitmap = if (image.format == ImageFormat.YUV_420_888) {
                        ImageConverter.yuv2Bitmap(image)!!
                    } else {
                        ImageConverter.jpeg2Bitmap(image)
                    }
                    val rotateBitmap = UtilKBitmap.rotateBitmap(bitmap, 90)

                    val objList = _tFLiteImageClassifier.classify(rotateBitmap, 0)
                    Log.d(TAG, "analyze: $objList")
                    runOnUiThread {
                        if (objList.isEmpty()) return@runOnUiThread
                        objList.forEachIndexed { index, _ ->
                            _stringBuilder.append("${objList[index].title}: ${objList[index].confidence}").append(" ")
                        }
                        vb.imageClassifierRes.text = _stringBuilder.toString()
                        _stringBuilder.clear()
                    }
                } finally {
                    _reentrantLock.unlock()
                }

                image.close()
            }
        }
    }
}