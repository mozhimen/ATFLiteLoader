package com.mozhimen.tfloader.imageclassifier.test

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
import com.mozhimen.kotlin.utilk.android.content.UtilKAssetManager
import com.mozhimen.kotlin.utilk.android.graphics.applyBitmapAnyRotate
import com.mozhimen.manifestk.xxpermissions.XXPermissionsRequestUtil
import com.mozhimen.mvvmk.bases.activity.viewbinding.BaseActivityVB
import com.mozhimen.tfloader.imageclassifier.test.databinding.ActivityImageClassifierBinding
import com.mozhimen.tfloader.imageclassifier.tf.TFImageClassifier
import java.util.concurrent.locks.ReentrantLock

/**
 * @ClassName TFImageClassifierActivity
 * @Description TODO
 * @Author Mozhimen / Kolin Zhao
 * @Date 2024/3/13 21:22
 * @Version 1.0
 */
class TFImageClassifierActivity : BaseActivityVB<ActivityImageClassifierBinding>() {
    private lateinit var _tFImageClassifier: TFImageClassifier

    override fun initView(savedInstanceState: Bundle?) {
        initLiteLoader()
        initCamera()
    }

    private fun initLiteLoader() {
        _tFImageClassifier = TFImageClassifier.create("saved_model.pb", "labels.txt", UtilKAssetManager.get_ofContext(this), "input", 299, "output", 128f, 128f, 0.1f, 1)
    }

    @SuppressLint("MissingPermission")
    @OptIn(OPermission_CAMERA::class)
    private fun initCamera() {
        vb.imageClassifierPreview.apply {
            initCameraKX(this@TFImageClassifierActivity, CameraKXConfig(_format, ACameraKXFacing.BACK))
            setCameraXFrameListener(_cameraKXFrameListener)
            XXPermissionsRequestUtil.requestCameraPermission(this@TFImageClassifierActivity, onGranted = {
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

                        val objList = _tFImageClassifier.classify(rotateBitmap)
                        Log.d(TAG, "invoke: $objList")

                        runOnUiThread {
                            if (objList.isEmpty()) return@runOnUiThread
                            objList.forEachIndexed { index, _ ->
                                _stringBuilder.append("${objList[index].title}: ${objList[index].confidence}").append("\n")
                            }
                            vb.imageClassifierRes.text = _stringBuilder.toString()
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