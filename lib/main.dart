import 'package:cevapp/ui/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MainApp());
}