package com.ashraful.easy_compress_img;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;

import androidx.annotation.NonNull;

import java.io.ByteArrayOutputStream;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** EasyCompressImgPlugin */
public class EasyCompressImgPlugin implements FlutterPlugin, MethodCallHandler {
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    final MethodChannel channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "easy_compress_img");
    channel.setMethodCallHandler(new EasyCompressImgPlugin());
  }

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "easy_compress_img");
    channel.setMethodCallHandler(new EasyCompressImgPlugin());
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("getCompressedImage")) {
      //result.success("Android " + android.os.Build.VERSION.RELEASE);
      byte[] bytes = call.argument("sourceBytes");
      Log.d("Ashraful", "onMethodCall bytes: sourceBytes");
      byte[] resultedBytes = compressImage(bytes);
      result.success(resultedBytes);

    } else {
      result.notImplemented();
    }
  }

  private byte[] compressImage(byte[] bytes) {
    Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);

    // Initialize a new ByteArrayStream
    ByteArrayOutputStream stream = new ByteArrayOutputStream();


    // Compress the bitmap with JPEG format and quality 50%
    bitmap.compress(Bitmap.CompressFormat.JPEG,50,stream);

    byte[] byteArray = stream.toByteArray();

    return byteArray;
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
  }
}
