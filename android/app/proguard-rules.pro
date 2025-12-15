# === ZOOM SDK & Related Dependencies ===
-keep class us.zoom.** { *; }
-keep class com.zipow.** { *; }
-keep class us.zipow.** { *; }
-keep class org.webrtc.** { *; }
-keep class us.google.protobuf.** { *; }
-keep class org.apache.** { *; }
-keep class org.igniterealtime.** { *; }
-keep class com.amazonaws.** { *; }
-keep class com.aldiferdiyan.** { *; }
-keep class org.jivesoftware.** { *; }
-dontwarn us.zoom.**
-dontwarn com.zipow.**

# === Google & Firebase ===
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**
-dontwarn com.google.firebase.**

# === Firebase Plugins (detailed) ===
-keep class com.google.firebase.messaging.** { *; }
-dontwarn com.google.firebase.messaging.**

-keep class com.google.firebase.iid.** { *; }
-dontwarn com.google.firebase.iid.**

-keep class com.google.firebase.auth.** { *; }
-dontwarn com.google.firebase.auth.**

-keep class com.google.firebase.firestore.** { *; }
-dontwarn com.google.firebase.firestore.**

-keep class com.google.firebase.database.** { *; }
-dontwarn com.google.firebase.database.**

-keep class com.google.firebase.storage.** { *; }
-dontwarn com.google.firebase.storage.**

-keep class com.google.firebase.functions.** { *; }
-dontwarn com.google.firebase.functions.**

-keep class com.google.firebase.remoteconfig.** { *; }
-dontwarn com.google.firebase.remoteconfig.**

-keep class com.google.firebase.perf.** { *; }
-dontwarn com.google.firebase.perf.**

-keep class com.google.firebase.analytics.** { *; }
-dontwarn com.google.firebase.analytics.**

-keep class com.google.firebase.crashlytics.** { *; }
-dontwarn com.google.firebase.crashlytics.**

# === Flutter Framework ===
-keep class io.flutter.** { *; }
-dontwarn io.flutter.embedding.**

# === Gson Parser ===
-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**

# === Local Notifications ===
-keep class com.dexterous.flutterlocalnotifications.** { *; }
-dontwarn com.dexterous.flutterlocalnotifications.**

# === Firebase Messaging Plugin ===
-keep class io.flutter.plugins.firebasemessaging.** { *; }
-dontwarn io.flutter.plugins.firebasemessaging.**

# === General Android Plugin Classes (Safe Defaults) ===
-keep class androidx.lifecycle.** { *; }
-dontwarn androidx.lifecycle.**

-keep class androidx.core.** { *; }
-dontwarn androidx.core.**

# === Google Play Core (for Play Integrity / App Updates etc.) ===
-keep class com.google.android.play.** { *; }
-dontwarn com.google.android.play.**

# === SharedPreferences Plugin (Flutter) ===
-keep class io.flutter.plugins.sharedpreferences.** { *; }
-dontwarn io.flutter.plugins.sharedpreferences.**

# === Remove all Log calls in release build ===
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
    public static *** w(...);
    public static *** e(...);
}

# === Prevent Obfuscation of MainActivity / FlutterEngine etc. ===
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugins.** { *; }

# === Prevent R8 from breaking reflection-based code ===
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod

# === Avoid stripping Flutter plugin registrant (in some rare edge cases) ===
-keep class GeneratedPluginRegistrant { *; }

# === Facebook Audience Network ===
-dontwarn com.facebook.infer.annotation.**
-keep class com.facebook.infer.annotation.** { *; }

-keep class com.facebook.** { *; }
-keep class com.google.ads.mediation.facebook.** { *; }

