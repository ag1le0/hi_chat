package com.foxconn.fii.app.htngu.hi_chat;
import android.content.Context;
import android.content.Intent;
import android.net.SSLCertificateSocketFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.PowerManager;
import android.util.Log;

import androidx.core.content.FileProvider;

import org.apache.http.conn.ssl.AllowAllHostnameVerifier;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import javax.net.ssl.HttpsURLConnection;
import io.flutter.plugin.common.EventChannel;


public class DownloadTask extends AsyncTask<String, Integer, String> {
    /**const*/
    private static final String FILE_NAME = "update.apk";
    private static final String TAG = "DownloadTask";
    private static int currentProgress = 0;

    private EventChannel.EventSink progressSink;
    private Context context;
    private PowerManager.WakeLock mWakeLock;

    private File file;

    public DownloadTask(Context context, EventChannel.EventSink progressSink) {
        this.context = context;
        this.progressSink = progressSink;
        currentProgress = 0;
    }

    @Override
    protected String doInBackground(String... sUrl) {
        InputStream input = null;
        OutputStream output = null;
        HttpsURLConnection connection = null;


        try {
            file = new File(context.getFilesDir(), FILE_NAME);
            if (file.exists()) {
                if (!file.delete()) {
                    Log.e(TAG, "ERROR: unable to delete old apk file before starting OTA");
                }
            }
            file.createNewFile();
            Log.d(TAG, "DOWNLOAD STARTING");

            URL url = new URL(sUrl[0]);
            connection = (HttpsURLConnection) url.openConnection();
            connection.setSSLSocketFactory(SSLCertificateSocketFactory.getInsecure(0, null));
            connection.setHostnameVerifier(new AllowAllHostnameVerifier());
            connection.setRequestProperty("Accept-Charset", "UTF-8");
            connection.setConnectTimeout(10);
            connection.connect();

            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                return "Server returned HTTP " + connection.getResponseCode()
                        + " " + connection.getResponseMessage();
            }
            int fileLength = connection.getContentLength();

            input = connection.getInputStream();
            output = new FileOutputStream(file.toString());

            byte data[] = new byte[4096];
            long total = 0;
            int count;
            while ((count = input.read(data)) != -1) {
                // allow canceling with back button
                if (isCancelled()) {
                    input.close();
                    return null;
                }
                total += count;
                // publishing the progress....
                if (fileLength > 0){
                    int progress = (int) (total * 100 / fileLength);
                    if (progress!=currentProgress){
                        currentProgress = progress;
                        publishProgress(progress);
                    }
                }
                output.write(data, 0, count);
            }
            Log.e(TAG, "DOWNLOAD SUCCESS: " + file.toString());
        } catch (Exception e) {
            Log.d(TAG, "DOWNLOAD FAIL: " + e.toString());
            return e.toString();
        } finally {
            try {
                if (output != null)
                    output.close();
                if (input != null)
                    input.close();
            } catch (IOException ignored) {
            }

            if (connection != null)
                connection.disconnect();
        }
        return null;
    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
        PowerManager pm = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        mWakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK,
                getClass().getName());
        mWakeLock.acquire();
    }

    @Override
    protected void onProgressUpdate(Integer... progress) {
        super.onProgressUpdate(progress);
        progressSink.success(Arrays.asList("" + UpdatePlugin.Status.DOWNLOADING.ordinal(), "" + progress[0]));

    }

    @Override
    protected void onPostExecute(String result) {
        mWakeLock.release();

        if (result==null){
            if (!file.exists()) {
                if (progressSink != null) {
                    progressSink.error("" + UpdatePlugin.Status.DOWNLOAD_ERROR.ordinal(), "File was not downloaded", null);
                    progressSink.endOfStream();
                    progressSink = null;
                }
                return;
            }
            executeInstallation(file);
        }
    }


    private void executeInstallation(File downloadedFile) {
        Intent intent;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            Uri apkUri = FileProvider.getUriForFile(context, context.getPackageName() + ".ota_update_provider", downloadedFile);
            intent = new Intent(Intent.ACTION_INSTALL_PACKAGE);
            intent.setData(apkUri);
            intent.setFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        } else {
            intent = new Intent(Intent.ACTION_VIEW);
            intent.setDataAndType(Uri.fromFile(file), "application/vnd.android.package-archive");
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }
        //SEND INSTALLING EVENT
        if (progressSink != null) {
            context.startActivity(intent);
            progressSink.success(Arrays.asList("" + UpdatePlugin.Status.INSTALLING.ordinal(), ""));
            progressSink.endOfStream();
            progressSink = null;
        }
    }

}