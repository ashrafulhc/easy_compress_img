import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class EasyCompressImg {
  static const MethodChannel _channel =
      const MethodChannel('easy_compress_img');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Uint8List> getCompressedImage(File imageFile) async{
    Uint8List sourceBytes = imageFile.readAsBytesSync();
    Uint8List resultedBytes;
    try{
      resultedBytes = await _channel.invokeMethod('getCompressedImage', {"sourceBytes": sourceBytes});
    }catch(e){
      print(e);
      resultedBytes = null;
    }
    return resultedBytes;
  }
}
