import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/ui/screens/main/main_screen.dart';
import 'package:cevapp/ui/screens/starting/components/take_user_name_screen_body.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/avatar_screen_body.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: BlocBuilder<AvatarCubit, AvatarState>(
        builder: (context, state) {
          // print(state);
          if (state is NoUserName) {
            return AnimatedSwitcher(
                duration: const Duration(milliseconds: 280),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: const Offset(0.0, 0))
                        .animate(animation),
                    child: child,
                  );
                },
                switchInCurve: Curves.ease,
                switchOutCurve: Curves.ease,
                child: const TakeUserNameScreenBody());
          } else if (state is NoAvatars) {
            return AnimatedSwitcher(
                switchInCurve: Curves.ease,
                switchOutCurve: Curves.ease,
                duration: const Duration(milliseconds: 280),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: const Offset(0.0, 0))
                        .animate(animation),
                    child: child,
                  );
                },
                child: const AvatarScreenBody());
          } else if ((state is GotAvatars) || (state is DecreaseMoney) || (state is IncreaseMoney)) {
            return AnimatedSwitcher(
                switchInCurve: Curves.ease,
                switchOutCurve: Curves.ease,
                duration: const Duration(milliseconds: 280),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: const Offset(0.0, 0))
                        .animate(animation),
                    child: child,
                  );
                },
                child: const MainScreen());
          } else {
            return AnimatedSwitcher(
                switchInCurve: Curves.ease,
                switchOutCurve: Curves.ease,
                duration: const Duration(milliseconds: 280),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: const Offset(0.0, 0))
                        .animate(animation),
                    child: child,
                  );
                },
                child: Container(
                  color: AppColors.magenta,
                ));
          }
        },
        // child: Container(
        //   child: ,
        // ),
      ),
    );
  }
}
