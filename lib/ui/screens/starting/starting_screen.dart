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
    return BlocBuilder<AvatarCubit, AvatarState>(
      builder: (context, state) {
        print(state);
        if (state is NoUserName){
          return const TakeUserNameScreenBody();
        }
        else if (state is NoAvatars) {
          return const AvatarScreenBody();
        } else if (state is GotAvatars) {
          return const MainScreen();
        } else {
          return Container(
            color: AppColors.magenta,
          );
        }
      },
      // child: Container(
      //   child: ,
      // ),
    );
  }
}
