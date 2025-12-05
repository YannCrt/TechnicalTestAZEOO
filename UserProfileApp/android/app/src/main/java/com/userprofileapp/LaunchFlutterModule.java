package com.userprofileapp;

import android.content.Intent;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class LaunchFlutterModule extends ReactContextBaseJavaModule {
    
    public LaunchFlutterModule(ReactApplicationContext context) {
        super(context);
    }

    @Override
    public String getName() {
        return "LaunchFlutter";
    }

    @ReactMethod
    public void openFlutterActivity() {
        Intent intent = new Intent(getCurrentActivity(), FlutterLauncherActivity.class);
        getCurrentActivity().startActivity(intent);
    }
}