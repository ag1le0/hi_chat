package com.foxconn.fii.app.htngu.hi_chat;

import android.os.Bundle;
import android.util.Log;

import androidx.annotation.Nullable;

import java.io.File;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {

    private static final String TAG = "MainActivity";

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        //HttpsTrustManager.allowAllSSL();

        try {
            flutterEngine.getPlugins().add(new UpdatePlugin());
        } catch(Exception e) {
            Log.e(TAG, "Error registering plugin update, com.foxconn.fii.app.htngu.pea_chat.UpdatePlugin()", e);
        }

    }

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }
}
