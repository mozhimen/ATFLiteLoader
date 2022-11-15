package com.mozhimen.tfliteloader.objectdetection

import android.Manifest
import android.annotation.SuppressLint
import android.graphics.Bitmap
import android.os.Bundle
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import com.mozhimen.basick.basek.BaseKActivityVBVM
import com.mozhimen.basick.basek.BaseKViewModel
import com.mozhimen.basick.extsk.showToast
import com.mozhimen.basick.permissionk.PermissionK
import com.mozhimen.basick.permissionk.annors.APermissionK
import com.mozhimen.componentk.cameraxk.annors.ACameraXKFacing
import com.mozhimen.componentk.cameraxk.helpers.ImageConverter
import com.mozhimen.objectdetector.TFLiteObjectDetector
import com.mozhimen.objectdetector.commons.IObjectDetectorListener
import com.mozhimen.tfliteloader.databinding.ActivityObjectDetectionBinding
import org.tensorflow.lite.task.vision.detector.Detection
import java.util.concurrent.locks.ReentrantLock

@APermissionK(permissions = [Manifest.permission.CAMERA])
class ObjectDetectionActivity :
    BaseKActivityVBVM<ActivityObjectDetectionBinding, BaseKViewModel>() {

    private lateinit var _tfLiteObjectDetector: TFLiteObjectDetector
    private val _objectDetectorListener: IObjectDetectorListener = object : IObjectDetectorListener {
        override fun onError(error: String) {
            runOnUiThread {
                error.showToast()
            }
        }

        @SuppressLint("SetTextI18n")
        override fun onResults(
            imageWidth: Int,
            imageHeight: Int,
            inferenceTime: Long,
            results: MutableList<Detection>?
        ) {
            runOnUiThread {
                results?.let {
                    vb.objectDetectionOverlay.setObjectRect(imageWidth, imageHeight, results)
                    vb.objectDetectionTxtCount.text = "钢筋的个数为:${results.size}"
                }
            }
        }
    }

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
        _tfLiteObjectDetector =
            TFLiteObjectDetector.create(
                "efficientdet-lite4.tflite",
                listener = _objectDetectorListener,
                resultSize = 200,
                threshold = 0.29f
            )
    }

    private fun initCamera() {
        vb.objectDetectionPreview.initCamera(this, ACameraXKFacing.BACK)
        vb.objectDetectionPreview.setImageAnalyzer(_frameAnalyzer)
        vb.objectDetectionPreview.startCamera()
    }

    private val _frameAnalyzer: ImageAnalysis.Analyzer by lazy {
        object : ImageAnalysis.Analyzer {
            private val _reentrantLock = ReentrantLock()

            @SuppressLint("UnsafeOptInUsageError", "SetTextI18n")
            override fun analyze(image: ImageProxy) {
                try {
                    _reentrantLock.lock()
                    val bitmap: Bitmap = ImageConverter.yuv2Bitmap(image)!!

                    _tfLiteObjectDetector.detect(bitmap, image.imageInfo.rotationDegrees)
                } finally {
                    _reentrantLock.unlock()
                }

                image.close()
            }
        }
    }

    override fun bindViewVM(vb: ActivityObjectDetectionBinding) {
    }
}