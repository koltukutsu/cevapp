import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/ui/navigation/navigation_names.dart';
import 'package:cevapp/ui/screens/avatar/components/avatar_screen_body.dart';
import 'package:cevapp/ui/screens/main/main_screen.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvatarCubit, AvatarState>(
      builder: (context, state) {
        print(state);
        if (state is NoAvatars) {
          return const AvatarScreenBody();
        } else if (state is GotAvatars) {
          return const MainScreen();
        } else {
          // context.read<AvatarCubit>().emit(NoAvatars());
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
