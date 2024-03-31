package com.mozhimen.tfloader.exam.objectdetection

import android.annotation.SuppressLint
import android.graphics.Bitmap
import android.os.Bundle
import androidx.camera.core.ImageProxy
import com.mozhimen.basick.elemk.androidx.appcompat.bases.databinding.BaseActivityVDB
import com.mozhimen.basick.lintk.optins.OFieldCall_Close
import com.mozhimen.basick.lintk.optins.permission.OPermission_CAMERA
import com.mozhimen.basick.manifestk.cons.CPermission
import com.mozhimen.basick.manifestk.permission.annors.APermissionCheck
import com.mozhimen.basick.utilk.android.widget.showToast
import com.mozhimen.camerak.camerax.annors.ACameraKXFacing
import com.mozhimen.camerak.camerax.annors.ACameraKXFormat
import com.mozhimen.camerak.camerax.commons.ICameraXKFrameListener
import com.mozhimen.camerak.camerax.mos.CameraKXConfig
import com.mozhimen.camerak.camerax.utils.imageProxyRgba88882bitmapRgba8888
import com.mozhimen.camerak.camerax.utils.imageProxyYuv4208882bitmapJpeg
import com.mozhimen.manifestk.xxpermissions.XXPermissionsRequestUtil
import com.mozhimen.tfloader.exam.databinding.ActivityObjectDetectionBinding
import com.mozhimen.tfloader.objectdetector.TFLiteObjectDetector
import com.mozhimen.tfloader.objectdetector.commons.IObjectDetectorListener
import org.tensorflow.lite.task.vision.detector.Detection
import java.util.concurrent.locks.ReentrantLock

@APermissionCheck(CPermission.CAMERA)
class ObjectDetectionActivity :
    BaseActivityVDB<ActivityObjectDetectionBinding>() {

    private lateinit var _tfLiteObjectDetector: TFLiteObjectDetector
    private val _objectDetectorListener: IObjectDetectorListener = object : IObjectDetectorListener {
        override fun onError(error: String) {
            runOnUiThread {
                error.showToast()
            }
        }

        @SuppressLint("SetTextI18n")
        override fun onResults(bitmap: Bitmap, imageWidth: Int, imageHeight: Int, inferenceTime: Long, results: MutableList<Detection>?) {
            runOnUiThread {
                results?.let {
                    vdb.objectDetectionOverlay.setObjectRect(imageWidth, imageHeight, results)
                    vdb.objectDetectionTxtCount.text = "钢筋的个数为:${results.size}"
                }
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

    @SuppressLint("MissingPermission")
    @OptIn(OPermission_CAMERA::class)
    private fun initCamera() {
        vdb.objectDetectionPreview.apply {
            initCameraKX(this@ObjectDetectionActivity, CameraKXConfig(_format, ACameraKXFacing.BACK))
            setCameraXFrameListener(_cameraKXFrameListener)
            XXPermissionsRequestUtil.requestCameraPermission(this@ObjectDetectionActivity, onGranted = {
                this.restartCameraKX()
            })
        }
    }

    private val _format = ACameraKXFormat.YUV_420_888

    private var _outputBitmap: Bitmap? = null

    @OptIn(OFieldCall_Close::class)
    private val _cameraKXFrameListener: ICameraXKFrameListener by lazy {
        object : ICameraXKFrameListener {
            private val _reentrantLock = ReentrantLock()

            @SuppressLint("UnsafeOptInUsageError", "SetTextI18n")
            override fun invoke(imageProxy: ImageProxy) {
                try {
                    _reentrantLock.lock()
                    when (_format) {
                        ACameraKXFormat.RGBA_8888 -> _outputBitmap = imageProxy.imageProxyRgba88882bitmapRgba8888()
                        ACameraKXFormat.YUV_420_888 -> _outputBitmap = imageProxy.imageProxyYuv4208882bitmapJpeg()
                    }
                    if (_outputBitmap != null) {
                        _tfLiteObjectDetector.detectAsync(_outputBitmap!!, imageProxy.imageInfo.rotationDegrees)
                    }
                } finally {
                    _reentrantLock.unlock()
                }

                imageProxy.close()
            }
        }
    }
}