package com.userprofileapp;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.plugin.common.MethodChannel;

public class FlutterBridgeModule extends ReactContextBaseJavaModule {
    private static final String CHANNEL = "com.azeoo.userprofile/channel";
    
    public FlutterBridgeModule(ReactApplicationContext context) {
        super(context);
    }

    @Override
    public String getName() {
        return "FlutterBridge";
    }

    @ReactMethod
    public void updateUserId(int userId) {
        FlutterEngine engine = FlutterEngineCache
            .getInstance()
            .get("azeoo_flutter_engine");
            
        if (engine != null) {
            new MethodChannel(
                engine.getDartExecutor().getBinaryMessenger(), 
                CHANNEL
            ).invokeMethod("updateUserId", userId);
        }
    }
}