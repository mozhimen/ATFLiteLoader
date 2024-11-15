package com.mozhimen.tfloader.exam.imageclassifier

import android.annotation.SuppressLint
import android.graphics.Bitmap
import android.os.Bundle
import android.util.Log
import androidx.camera.core.ImageProxy
import com.mozhimen.camerak.camerax.annors.ACameraKXFacing
import com.mozhimen.camerak.camerax.annors.ACameraKXFormat
import com.mozhimen.camerak.camerax.commons.ICameraXKFrameListener
import com.mozhimen.camerak.camerax.mos.CameraKXConfig
import com.mozhimen.camerak.camerax.utils.imageProxyRgba88882bitmapRgba8888
import com.mozhimen.camerak.camerax.utils.imageProxyYuv4208882bitmapJpeg
import com.mozhimen.kotlin.lintk.optins.permission.OPermission_CAMERA
import com.mozhimen.kotlin.utilk.android.graphics.applyBitmapAnyRotate
import com.mozhimen.tfloader.imageclassifier.tflite.TFLiteImageClassifier
import com.mozhimen.manifestk.xxpermissions.XXPermissionsRequestUtil
import com.mozhimen.mvvmk.bases.activity.databinding.BaseActivityVDB
import com.mozhimen.tfloader.exam.databinding.ActivityImageClassifierBinding
import java.util.concurrent.locks.ReentrantLock

class ImageClassifierActivity : BaseActivityVDB<ActivityImageClassifierBinding>() {
    private lateinit var _tFLiteImageClassifier: TFLiteImageClassifier
//    private lateinit var _tFLiteLabelImageClassifier: TFLiteLabelImageClassifier
//    private lateinit var _tFImageClassifier: TFImageClassifier

    override fun initView(savedInstanceState: Bundle?) {
        initLiteLoader()
        initCamera()
    }

    private fun initLiteLoader() {
        _tFLiteImageClassifier = TFLiteImageClassifier.create("beefmodel.tflite", resultSize = 2)
//        _tFLiteLabelImageClassifier = TFLiteLabelImageClassifier.create("?", "labels.txt", modelType = ModelType.QUANTIZED_EFFICIENTNET)
//        _tFImageClassifier = TFImageClassifier.create("output_graph.pb", "output_labels.txt", "input", 299, "output", 128f, 128f, 0.1f, 1)
    }

    @SuppressLint("MissingPermission")
    @OptIn(OPermission_CAMERA::class)
    private fun initCamera() {
        vdb.imageClassifierPreview.apply {
            initCameraKX(this@ImageClassifierActivity, CameraKXConfig(_format, ACameraKXFacing.BACK))
            setCameraXFrameListener(_cameraKXFrameListener)
            XXPermissionsRequestUtil.requestCameraPermission(this@ImageClassifierActivity, onGranted = {
                this.restartCameraKX()
            })
        }
    }

    private var _outputBitmap: Bitmap? = null

    private val _format = ACameraKXFormat.YUV_420_888

    private val _cameraKXFrameListener: ICameraXKFrameListener by lazy {
        object : ICameraXKFrameListener {
            private val _reentrantLock = ReentrantLock()
            private val _stringBuilder = StringBuilder()

            @SuppressLint("UnsafeOptInUsageError", "SetTextI18n")
            override fun invoke(imageProxy: ImageProxy) {
                _reentrantLock.lock()
                try {
                    when (_format) {
                        ACameraKXFormat.RGBA_8888 -> _outputBitmap = imageProxy.imageProxyRgba88882bitmapRgba8888()
                        ACameraKXFormat.YUV_420_888 -> _outputBitmap = imageProxy.imageProxyYuv4208882bitmapJpeg()
                    }
                    if (_outputBitmap != null) {
                        val rotateBitmap = _outputBitmap!!.applyBitmapAnyRotate(90f)

                        val objList = _tFLiteImageClassifier.classify(rotateBitmap, 0)
                        Log.d(TAG, "invoke: $objList")

                        runOnUiThread {
                            if (objList.isEmpty()) return@runOnUiThread
                            objList.forEachIndexed { index, _ ->
                                _stringBuilder.append("${objList[index].title}: ${objList[index].confidence}").append("\n")
                            }
                            vdb.imageClassifierRes.text = _stringBuilder.toString()
                            _stringBuilder.clear()
                        }
                    }
                } finally {
                    _reentrantLock.unlock()
                }

                imageProxy.close()
            }
        }
    }
}