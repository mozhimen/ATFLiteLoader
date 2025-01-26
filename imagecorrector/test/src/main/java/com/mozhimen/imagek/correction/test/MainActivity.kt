package com.mozhimen.imagek.correction.test

import android.content.Context
import android.content.Intent
import android.graphics.BitmapFactory
import android.os.Bundle
import com.mozhimen.bindk.bases.viewbinding.activity.BaseActivityVB
import com.mozhimen.imagek.correction.test.databinding.ActivityMainBinding
import java.io.File

class MainActivity : BaseActivityVB<ActivityMainBinding>() {

    companion object {
        const val REQUEST_CODE_FOR_RES = 100
        const val EXTRA_FROM_ALBUM = "extra_from_album"
        const val EXTRA_CROPPED_FILE = "extra_cropped_file"
    }

    private val _fileImage: File by lazy { File(getExternalFilesDir("img"), "scan.jpg") }

    override fun initView(savedInstanceState: Bundle?) {
        vb.btnTake.setOnClickListener {
            startActivityForResult(getIntentOfCrop(this, false, _fileImage), REQUEST_CODE_FOR_RES)
        }
        vb.btnSelect.setOnClickListener {
            startActivityForResult(getIntentOfCrop(this, true, _fileImage), REQUEST_CODE_FOR_RES)
        }
    }

    private fun getIntentOfCrop(context: Context, fromAlbum: Boolean, croppedFile: File): Intent {
        val intent = Intent(context, CropActivity::class.java)
        intent.putExtra(EXTRA_FROM_ALBUM, fromAlbum)
        intent.putExtra(EXTRA_CROPPED_FILE, croppedFile)
        return intent
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode != RESULT_OK || requestCode != REQUEST_CODE_FOR_RES) return
        if (_fileImage.exists()) {
            vb.ivShow.setImageBitmap(BitmapFactory.decodeFile(_fileImage.absolutePath))
        }
    }
}