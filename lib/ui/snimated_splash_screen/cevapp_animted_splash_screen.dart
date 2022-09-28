import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/screens/starting/starting_screen.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CevappAnimatedSplashScreen extends StatefulWidget {
  const CevappAnimatedSplashScreen({Key? key}) : super(key: key);

  @override
  State<CevappAnimatedSplashScreen> createState() =>
      _CevappAnimatedSplashScreenState();
}

class _CevappAnimatedSplashScreenState
    extends State<CevappAnimatedSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AvatarCubit>().getUserCondition();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: AppPaths.splashScreen,
      // TODO: splash ekrani ozel animasyon yada resim
      nextScreen: const StartingScreen(),
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType!.fade,
      // pageTransitionType: PageTransitionType.scale,
      backgroundColor: AppColors.mainBackgroundColor,
    );
  }
}
