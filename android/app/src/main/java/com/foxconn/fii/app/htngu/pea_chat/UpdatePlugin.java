package com.foxconn.fii.app.htngu.hi_chat;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.util.Log;

import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import java.util.Calendar;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.PluginRegistry;

public class UpdatePlugin implements FlutterPlugin, EventChannel.StreamHandler {
    //CONSTANTS
    private static final String ARG_URL = "url";
    public static final String TAG = "UpdatePlugin";
    //BASIC PLUGIN STATE
    private Context context;
    private Activity activity;
    private EventChannel.EventSink progressSink;
    private static String url = "";


    private void initialize(Context context, BinaryMessenger messanger) {
        final EventChannel progressChannel = new EventChannel(messanger, "foxconn.fii.app.update");
        progressChannel.setStreamHandler(this);
        this.context = context;
    }


    public static void registerWith(PluginRegistry.Registrar registrar) {
        Log.d(TAG, "registerWith");
        UpdatePlugin plugin = new UpdatePlugin();
        plugin.initialize(registrar.context(), registrar.messenger());
        plugin.activity = registrar.activity();
    }


    @Override
    public void onAttachedToEngine(FlutterPluginBinding binding) {
        Log.d(TAG, "onAttachedToEngine");
        initialize(binding.getApplicationContext(), binding.getBinaryMessenger());
    }

    @Override
    public void onDetachedFromEngine(FlutterPluginBinding binding) {
        Log.d(TAG, "onDetachedFromEngine");
    }

    //STREAM LISTENER
    @Override
    public void onListen(Object arguments, EventChannel.EventSink events) {
        if (progressSink != null) {
            progressSink.error("" + Status.ALREADY_RUNNING_ERROR.ordinal(), "Method call was cancelled. One method call is already running!", null);
        }
        Log.d(TAG, "STREAM OPENED");
        progressSink = events;
        //READ URL FROM CALL
        Map argumentsMap = ((Map) arguments);
        url = argumentsMap.get(ARG_URL).toString();

        executeDownload();
    }


    @Override
    public void onCancel(Object o) {
        Log.d(TAG, "STREAM CLOSED");
        progressSink = null;
    }

    private void executeDownload() {
        //PREPARE URLS
        new DownloadTask(context, progressSink).execute(url);
    }


    public enum Status {
        DOWNLOADING,
        DOWNLOAD_ERROR,
        INSTALLING,
        INSTALL_ERROR,
        ALREADY_RUNNING_ERROR,
    }
}
