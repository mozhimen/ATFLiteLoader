-keep class org.tensorflow.lite.annotations.UsedByReflection
-keep @org.tensorflow.lite.annotations.UsedByReflection class *
-keepclassmembers class * {
    @org.tensorflow.lite.annotations.UsedByReflection *;
}