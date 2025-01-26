package com.mozhimen.imagek.correction;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Point;

import androidx.annotation.OptIn;

import com.mozhimen.kotlin.lintk.optins.OApiInit_ByLazy;
import com.mozhimen.kotlin.utilk.android.graphics.UtilKPoint;
import com.mozhimen.scank.tflite.normalize.TFLiteNormalizeDetector;

import java.io.IOException;

public class ImageKCorrection {

    private static TFLiteNormalizeDetector _tfLiteEdgeDetection = null;

    ///////////////////////////////////////////////////////////////////////////

    public static void initTfLiteEdgeDetector(Context context) {
        ImageKCorrection.initTfLiteEdgeDetector(context, null);
    }

    @OptIn(markerClass = OApiInit_ByLazy.class)
    public static void initTfLiteEdgeDetector(Context context, String modelFile) {
        try {
            _tfLiteEdgeDetection = new TFLiteNormalizeDetector(context, modelFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 输入图片扫描边框顶点
     *
     * @param srcBmp 扫描图片
     * @return 返回顶点数组，以 左上，右上，右下，左下排序
     */
    @OptIn(markerClass = OApiInit_ByLazy.class)
    public static Point[] getEdgePoints(Bitmap srcBmp) {
        if (srcBmp == null) {
            throw new IllegalArgumentException("srcBmp cannot be null");
        }
        if (_tfLiteEdgeDetection != null) {
            Bitmap bitmap = _tfLiteEdgeDetection.normalize(srcBmp);
            if (bitmap != null) {
                srcBmp = Bitmap.createScaledBitmap(bitmap, srcBmp.getWidth(), srcBmp.getHeight(), false);
            }
        }
        Point[] outPoints = new Point[4];
        nativeScan(srcBmp, outPoints, _tfLiteEdgeDetection == null);
        return outPoints;
    }

    /**
     * 裁剪图片
     *
     * @param srcBmp     待裁剪图片
     * @param cropPoints 裁剪区域顶点，顶点坐标以图片大小为准
     * @return 返回裁剪后的图片
     */
    public static Bitmap cropBitmapForEdgePoints(Bitmap srcBmp, Point[] cropPoints) {
        if (srcBmp == null || cropPoints == null) {
            throw new IllegalArgumentException("srcBmp and cropPoints cannot be null");
        }
        if (cropPoints.length != 4) {
            throw new IllegalArgumentException("The length of cropPoints must be 4 , and sort by leftTop, rightTop, rightBottom, leftBottom");
        }
        Point leftTop = cropPoints[0];
        Point rightTop = cropPoints[1];
        Point rightBottom = cropPoints[2];
        Point leftBottom = cropPoints[3];

        int cropWidth = (int) ((UtilKPoint.getDistance(leftTop, rightTop)
                + UtilKPoint.getDistance(leftBottom, rightBottom)) / 2);
        int cropHeight = (int) ((UtilKPoint.getDistance(leftTop, leftBottom)
                + UtilKPoint.getDistance(rightTop, rightBottom)) / 2);

        Bitmap cropBitmap = Bitmap.createBitmap(cropWidth, cropHeight, Bitmap.Config.ARGB_8888);
        ImageKCorrection.nativeCrop(srcBmp, cropPoints, cropBitmap);
        return cropBitmap;
    }

    ///////////////////////////////////////////////////////////////////////////

    private static native void nativeScan(Bitmap srcBitmap, Point[] outPoints, boolean canny);

    private static native void nativeCrop(Bitmap srcBitmap, Point[] points, Bitmap outBitmap);

    ///////////////////////////////////////////////////////////////////////////

    static {
        System.loadLibrary("imagek_correction");
    }
}
