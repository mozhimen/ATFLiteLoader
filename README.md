# TFLiteLoader
专为Android设计的TensorFlowLite加载库
```
  ______________    _ __       __                    __         
 /_  __/ ____/ /   (_) /____  / /   ____  ____ _____/ /__  _____
  / / / /_  / /   / / __/ _ \/ /   / __ \/ __ `/ __  / _ \/ ___/
 / / / __/ / /___/ / /_/  __/ /___/ /_/ / /_/ / /_/ /  __/ /    
/_/ /_/   /_____/_/\__/\___/_____/\____/\__,_/\__,_/\___/_/     
```
***
@[Toc](深度学习.Tensorflow.TFLite.移动设备集成深度学习轻模型TFlite.图像分类篇)
>Why i create it?

`为了创建一个易用且易于集成的TFlite加载库, 所以TFLiteLoader应运而生`
- **开源Github项目地址 [TFLiteLoader](https://github.com/mozhimen/TFLiteLoader)** 

>集成 ImageClassifier

`依赖`
```
allprojects {
	repositories {
		...
		maven { url 'https://jitpack.io' }
	}
}
```
```
dependencies {
	implementation 'com.github.mozhimen.TFLiteLoader:imageclassifier:1.0.2'
}
```
`接入`
1. 全局声明
```
private lateinit var _tFLiteImageClassifier: TFLiteImageClassifier
```
2. 在onCreate中进行初始化
```
_tFLiteImageClassifier = TFLiteImageClassifier.create("health_model.tflite", resultSize = 3)
```
3. 分类图片
```
val objList = _tFLiteImageClassifier.classify([你的bitmap], 0)
```
- 对返回数据的处理示例, 可以pull代码参考demo
```
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
```
>对于返回值的说明
- List{Recognition}
```
data class Recognition(
    /**
     * 已识别事物的唯一标识符。特定于类，而不是实例
     * A unique identifier for what has been recognized. Specific to the class, not the instance of
     * the object.
     */
    val id: String?,
    /**
     * 显示名称以进行识别
     * Display name for the recognition.
     */
    val title: String?,
    /**
     * 这是一个相对于其他识别程度的可分类分数。越高越好
     * A sortable score for how good the recognition is relative to others. Higher should be better.
     */
    val confidence: Float?,
    /**
     * 源图像中可选的位置，用于识别对象的位置, 图像分类中不返回obj的位置
     * Optional location within the source image for the location of the recognized object.
     */
    private var location: RectF?
) {

    fun getLocation(): RectF {
        return RectF(location)
    }

    fun setLocation(location: RectF?) {
        this.location = location
    }

    override fun toString(): String {
        var resultString = ""
        if (id != null) {
            resultString += "[$id] "
        }
        if (title != null) {
            resultString += "$title "
        }
        if (confidence != null) {
            resultString += String.format("(%.1f%%) ", confidence * 100.0f)
        }
        if (location != null) {
            resultString += location.toString() + " "
        }
        return resultString.trim { it <= ' ' }
    }
}
```
`完整demo代码`
```
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
```
关于这里的框架代码, 可以参考我另一个开源框架库: **[SwiftKit](https://github.com/mozhimen/SwiftKit)** ,不过因为还未完成, 没有完整的wiki, 过段时间推出
- 本示例代码所持引用:
```
implementation 'com.github.mozhimen.SwiftKit:basick:1.1.1'
implementation('com.github.mozhimen.SwiftKit:abilityk:1.1.1') {
	exclude group: 'com.mozhimen.abilityk.scank'
    exclude group: 'com.huawei.hms'
}
implementation 'com.github.mozhimen.SwiftKit:componentk:1.1.1'
```
**综上所述: 集成是不是很简单, 那赶快试试吧**

- 本地引入
```groovy
//TFLiteLoader
include ':TFLiteLoader'
project(':TFLiteLoader').projectDir = new File("D:\\WorkSpace\\GitHub\\TFLiteLoader")
include ':TFLiteLoader:tfloader'
```
