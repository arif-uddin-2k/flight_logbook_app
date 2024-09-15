import 'package:bottom_picker/bottom_picker.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const App(),
  ));
}
