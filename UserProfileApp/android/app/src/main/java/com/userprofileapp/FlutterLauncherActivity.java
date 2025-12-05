package com.userprofileapp;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;
import androidx.annotation.NonNull;

public class FlutterLauncherActivity extends FlutterActivity {
    
    private static final String ENGINE_ID = "azeoo_flutter_engine";

    @Override
    public String getCachedEngineId() {
        return ENGINE_ID;
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
    }
}