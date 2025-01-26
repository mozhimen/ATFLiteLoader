package com.mozhimen.imagek.correction.test

import android.annotation.SuppressLint
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Rect
import android.os.Bundle
import android.util.Log
import com.mozhimen.bindk.bases.viewbinding.activity.BaseActivityVB
import com.mozhimen.kotlin.elemk.commons.I_Listener
import com.mozhimen.kotlin.utilk.android.content.UtilKIntentWrapper
import com.mozhimen.kotlin.utilk.android.content.isIntentAvailable
import com.mozhimen.kotlin.utilk.android.graphics.bitmapAny2file
import com.mozhimen.kotlin.utilk.android.widget.showToast
import com.mozhimen.imagek.correction.test.databinding.ActivityCropBinding
import com.mozhimen.kotlin.lintk.optins.permission.OPermission_CAMERA
import com.mozhimen.kotlin.lintk.optins.permission.OPermission_MANAGE_EXTERNAL_STORAGE
import com.mozhimen.kotlin.lintk.optins.permission.OPermission_QUERY_ALL_PACKAGES
import com.mozhimen.kotlin.lintk.optins.permission.OPermission_READ_EXTERNAL_STORAGE
import com.mozhimen.kotlin.lintk.optins.permission.OPermission_WRITE_EXTERNAL_STORAGE
import com.mozhimen.manifestk.xxpermissions.XXPermissionsCheckUtil
import com.mozhimen.manifestk.xxpermissions.XXPermissionsRequestUtil
import java.io.File
import java.io.FileNotFoundException

class CropActivity : BaseActivityVB<ActivityCropBinding>() {

    companion object {
        const val REQUEST_CODE_TAKE_PHOTO = 100
        const val REQUEST_CODE_SELECT_ALBUM = 200
    }

    private var _isFromAlbum = false
    private var _fileImageOrigin: File? = null
    private val _fileImageTemp by lazy { File(getExternalFilesDir("img"), "temp.jpg") }


    @SuppressLint("MissingPermission")
    override fun initData(savedInstanceState: Bundle?) {
        requestPermissions(onGranted = {
            super.initData(savedInstanceState)
        }, onDenied = {})
    }

    private fun requestPermissions(onGranted: I_Listener, onDenied: I_Listener) {
        requestCameraPermission(onGranted = {
            requestReadWritePermission(onGranted = {
                onGranted.invoke()
            }, onDenied = {})
        }, onDenied = {})
    }

    @OptIn(OPermission_CAMERA::class)
    @SuppressLint("MissingPermission")
    private fun requestCameraPermission(onGranted: I_Listener, onDenied: I_Listener) {
        if (XXPermissionsCheckUtil.hasCameraPermission(this)) {
            onGranted.invoke()
        } else {
            XXPermissionsRequestUtil.requestCameraPermission(this, onGranted = {
                onGranted.invoke()
            }, onDenied = {
                onDenied.invoke()
            })
        }
    }

    @OptIn(OPermission_READ_EXTERNAL_STORAGE::class, OPermission_WRITE_EXTERNAL_STORAGE::class, OPermission_MANAGE_EXTERNAL_STORAGE::class)
    @SuppressLint("MissingPermission")
    private fun requestReadWritePermission(onGranted: I_Listener, onDenied: I_Listener) {
        if (XXPermissionsCheckUtil.hasReadWritePermission(this)) {
            onGranted.invoke()
        } else {
            XXPermissionsRequestUtil.requestReadWritePermission(this, onGranted = {
                onGranted.invoke()
            }, onDenied = {
                onDenied.invoke()
            })
        }
    }

    override fun initView(savedInstanceState: Bundle?) {
        vb.btnCancel.setOnClickListener {
            setResult(RESULT_CANCELED)
            finish()
        }
        vb.btnOk.setOnClickListener {
            if (vb.ivCrop.canRightCrop()) {
                val crop: Bitmap? = vb.ivCrop.crop()
                if (crop != null) {
                    crop.bitmapAny2file(_fileImageOrigin!!)
                    setResult(RESULT_OK)
                } else {
                    setResult(RESULT_CANCELED)
                }
                finish()
            } else {
                "cannot crop correctly".showToast()
            }
        }
        _isFromAlbum = intent.getBooleanExtra(MainActivity.EXTRA_FROM_ALBUM, true)
        _fileImageOrigin = intent.getSerializableExtra(MainActivity.EXTRA_CROPPED_FILE) as File?
        if (_fileImageOrigin == null) {
            setResult(RESULT_CANCELED)
            finish()
            return
        }
        selectPhoto()
    }

    @OptIn(OPermission_QUERY_ALL_PACKAGES::class)
    private fun selectPhoto() {
        if (_isFromAlbum) {
            val intent = UtilKIntentWrapper.getPickImage()
            if (intent.isIntentAvailable(this)) {
                startActivityForResult(intent, REQUEST_CODE_SELECT_ALBUM)
            }
        } else {
            val intent = UtilKIntentWrapper.getMediaStoreImageCaptureOutput(_fileImageTemp)
            if (intent?.isIntentAvailable(this) == true) {
                startActivityForResult(intent, REQUEST_CODE_TAKE_PHOTO)
            }
        }
    }

//    override fun onTouchEvent(event: MotionEvent?): Boolean {
//        return super.onTouchEvent(event)
//    }


    @Deprecated("Deprecated in Java")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode != RESULT_OK) {
            setResult(RESULT_CANCELED)
            finish()
            return
        }
        var selectedBitmap: Bitmap? = null
        if (requestCode == REQUEST_CODE_TAKE_PHOTO && _fileImageTemp.exists()) {
            val options = BitmapFactory.Options()
            options.inJustDecodeBounds = true
            BitmapFactory.decodeFile(_fileImageTemp.path, options)
            options.inJustDecodeBounds = false
            options.inSampleSize = calculateSampleSize(options)
            selectedBitmap = BitmapFactory.decodeFile(_fileImageTemp.path, options)
        } else if (requestCode == REQUEST_CODE_SELECT_ALBUM && data != null && data.data != null) {
            val cr = contentResolver
            val bmpUri = data.data
            try {
                val options = BitmapFactory.Options()
                options.inJustDecodeBounds = true
                BitmapFactory.decodeStream(cr.openInputStream(bmpUri!!), Rect(), options)
                options.inJustDecodeBounds = false
                options.inSampleSize = calculateSampleSize(options)
                selectedBitmap = BitmapFactory.decodeStream(cr.openInputStream(bmpUri), Rect(), options)
            } catch (e: FileNotFoundException) {
                e.printStackTrace()
            }
        }
        if (selectedBitmap != null) {
            vb.ivCrop.setImageToCrop(selectedBitmap)
        }
    }

    private fun calculateSampleSize(options: BitmapFactory.Options): Int {
        val outHeight = options.outHeight
        val outWidth = options.outWidth
        var sampleSize = 1
        val destHeight = 1000
        val destWidth = 1000
        if (outHeight > destHeight || outWidth > destHeight) {
            sampleSize = if (outHeight > outWidth) {
                outHeight / destHeight
            } else {
                outWidth / destWidth
            }
        }
        if (sampleSize < 1) {
            sampleSize = 1
        }
        return sampleSize
    }
}