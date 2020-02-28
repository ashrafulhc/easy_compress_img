import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_compress_img/easy_compress_img.dart';
import 'final_screen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  Uint8List _compressedImage;
  File _image;

  _getCompressedImage() async {
    Uint8List compressedImage =
    await EasyCompressImg.getCompressedImage(_image);
    if (mounted) {
      setState(() {
        _compressedImage = compressedImage;
      });
    }
    if (_compressedImage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FinalScreen(imageBytes: _compressedImage),
        ),
      );
    }
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              _getCompressedImage();
            },
          ),
        ],
      ),
      body: Center(
        child: _image == null ? Text('No image selected.') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
