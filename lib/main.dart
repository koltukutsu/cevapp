import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cevapp/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// enum PageTransitionType {
//   fade,
//   rightToLeft,
//   leftToRight,
//   upToDown,
//   downToUp,
//   scale,
//   rotate,
//   size,
//   rightToLeftWithFade,
//   leftToRightWithFade,
// }


void main() {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  //

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(const MainApp());
}