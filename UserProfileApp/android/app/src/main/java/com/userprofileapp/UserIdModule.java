package com.userprofileapp;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.plugin.common.MethodChannel;

public class UserIdModule extends ReactContextBaseJavaModule {
    private static final String CHANNEL = "com.userprofileapp/userId";

    public UserIdModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "UserIdModule";
    }

    @ReactMethod
    public void setUserId(int userId) {
        FlutterEngine engine = FlutterEngineCache
            .getInstance()
            .get("azeoo_flutter_engine");
            
        if (engine != null) {
            new MethodChannel(engine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .invokeMethod("setUserId", userId);
        }
    }
}