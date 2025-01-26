package com.mozhimen.tfloader.objectdetection.test

import android.annotation.SuppressLint
import android.graphics.Bitmap
import android.os.Bundle
import android.util.Log
import androidx.camera.core.ImageProxy
import com.mozhimen.bindk.bases.viewdatabinding.activity.BaseActivityVDB
import com.mozhimen.kotlin.utilk.android.graphics.applyBitmapAnyCrop
import com.mozhimen.kotlin.utilk.java.util.safeUnlock
import com.mozhimen.camerak.camerax.annors.ACameraKXFacing
import com.mozhimen.camerak.camerax.annors.ACameraKXFormat
import com.mozhimen.camerak.camerax.commons.ICameraXKFrameListener
import com.mozhimen.camerak.camerax.mos.CameraKXConfig
import com.mozhimen.camerak.camerax.utils.imageProxyRgba88882bitmapRgba8888
import com.mozhimen.camerak.camerax.utils.imageProxyYuv4208882bitmapJpeg
import com.mozhimen.kotlin.elemk.android.cons.CPermission
import com.mozhimen.kotlin.lintk.optins.OFieldCall_Close
import com.mozhimen.kotlin.lintk.optins.permission.OPermission_CAMERA
import com.mozhimen.manifestk.permission.annors.APermissionCheck
import com.mozhimen.manifestk.xxpermissions.XXPermissionsRequestUtil
import com.mozhimen.tfloader.mos.ChipType
import com.mozhimen.tfloader.objectdetection.test.databinding.ActivityObjectDetectionBinding
import com.mozhimen.tfloader.objectdetector.TFLiteObjectDetector
import com.mozhimen.tfloader.objectdetector.mos.DetectionResult
import java.util.concurrent.locks.ReentrantLock

@APermissionCheck(CPermission.CAMERA)
class ObjectDetectionActivity :
    BaseActivityVDB<ActivityObjectDetectionBinding>() {

    private lateinit var _tfLiteObjectDetector: TFLiteObjectDetector
//    private val _objectDetectorListener: IObjectDetectorListener = object : IObjectDetectorListener {
//        override fun onError(error: String) {
//            runOnUiThread {
//                error.showToast()
//
//            }
//        }
//
//        @SuppressLint("SetTextI18n")
//        override fun onResults(bitmap: Bitmap, imageWidth: Int, imageHeight: Int, inferenceTime: Long, results: MutableList<Detection>?) {
//            runOnUiThread {
//                if (results?.isNotEmpty() == true) {
//                    vdb.objectDetectionOverlay.setObjectRect(imageWidth, imageHeight, results)
//                    vdb.objectDetectionImg.setImageBitmap(bitmap.applyBitmapAnyCrop(results[0].boundingBox))
//                    vdb.objectDetectionTxt.text = "识别个数:${results.size} 识别results[0]:${results[0].categories}"
//                }
//
//            }
//        }
//    }

    override fun initView(savedInstanceState: Bundle?) {
        initLiteLoader()
        initCamera()
    }

    private fun initLiteLoader() {
        _tfLiteObjectDetector =
            TFLiteObjectDetector.create(
                "model1.tflite",
                listener = null,
                resultSize = 1,
                threshold = 0.4f,
                chipType = ChipType.GPU
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
    private var _detectionRes: DetectionResult? = null

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
                        val time = System.currentTimeMillis()
                        _detectionRes = _tfLiteObjectDetector.detect(_outputBitmap!!, imageProxy.imageInfo.rotationDegrees)
                        Log.d(TAG, "invoke: _detectionRes $_detectionRes ")
                        if (_detectionRes!!.results?.isNotEmpty() == true) {
                            vdb.objectDetectionOverlay.setObjectRect(_detectionRes!!.imageWidth, _detectionRes!!.imageHeight, _detectionRes!!.results!!)
                            runOnUiThread {
                                Log.d(TAG, "invoke: ${_detectionRes!!.bitmap.width}x${_detectionRes!!.bitmap.height} _detectionRes $_detectionRes")
                                vdb.objectDetectionImg.setImageBitmap(_detectionRes!!.bitmap.applyBitmapAnyCrop(_detectionRes!!.results!![0].boundingBox))
                                vdb.objectDetectionTxt.text = "识别个数:${_detectionRes!!.results!!.size} 识别results[0]:${_detectionRes!!.results!![0].categories}"
                            }
                        } else
                            runOnUiThread {
                                vdb.objectDetectionTxt.text = ""
                            }
                    }
                } finally {
                    _reentrantLock.safeUnlock()
                }

                imageProxy.close()
            }
        }
    }
}