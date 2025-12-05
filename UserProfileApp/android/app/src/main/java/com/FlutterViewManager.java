package com.userprofileapp;

import androidx.annotation.NonNull;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import io.flutter.embedding.android.FlutterView;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;

public class FlutterViewManager extends SimpleViewManager<FlutterView> {

    @NonNull
    @Override
    public String getName() {
        return "FlutterView";
    }

    @NonNull
    @Override
    protected FlutterView createViewInstance(@NonNull ThemedReactContext context) {
        FlutterEngine flutterEngine = FlutterEngineCache
            .getInstance()
            .get("azeoo_flutter_engine");
            
        if (flutterEngine == null) {
            flutterEngine = new FlutterEngine(context);
            flutterEngine.getDartExecutor()
                .executeDartEntrypoint(
                    DartExecutor.DartEntrypoint.createDefault()
                );
            FlutterEngineCache
                .getInstance()
                .put("azeoo_flutter_engine", flutterEngine);
        }

        FlutterView flutterView = new FlutterView(context);
        flutterView.attachToFlutterEngine(flutterEngine);
        
        // ✅ AJOUTE CETTE LIGNE CRUCIALE
        flutterView.setFocusable(true);
        flutterView.setFocusableInTouchMode(true);
        
        return flutterView;
    }
}