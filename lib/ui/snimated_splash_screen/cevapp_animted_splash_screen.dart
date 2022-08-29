import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/screens/main/main_screen.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:flutter/material.dart';


class CevappAnimatedSplashScreen extends StatelessWidget {
  const CevappAnimatedSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: AppPaths.splashScreen,
      // TODO: splash ekrani ozel animasyon yada resim
      nextScreen: const MainScreen(),
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType!.fade,
      // pageTransitionType: PageTransitionType.scale,
      backgroundColor: AppColors.mainBackgroundColor,
    );
  }
}
