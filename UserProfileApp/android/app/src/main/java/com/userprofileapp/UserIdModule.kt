package com.userprofileapp

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugin.common.MethodChannel

class UserIdModule(reactContext: ReactApplicationContext) : 
    ReactContextBaseJavaModule(reactContext) {
    
    companion object {
        private const val CHANNEL = "com.userprofileapp/userId"
    }

    override fun getName(): String = "UserIdModule"

    @ReactMethod
    fun setUserId(userId: Int) {
        val engine = FlutterEngineCache
            .getInstance()
            .get("azeoo_flutter_engine")
            
        engine?.let {
            MethodChannel(it.dartExecutor.binaryMessenger, CHANNEL)
                .invokeMethod("setUserId", userId)
        }
    }
}