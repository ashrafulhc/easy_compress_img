import 'dart:typed_data';

import 'package:flutter/material.dart';

class FinalScreen extends StatelessWidget {
  final Uint8List imageBytes;

  FinalScreen({this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compressed Image'),
      ),
      body: Center(
        child: Image.memory(imageBytes),
      ),
    );
  }
}
