import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AvatarButton extends StatelessWidget {
  final String imagePath;
  final String type;
  final VoidCallback triggerFunction;
  // final double depth;
  final bool pressed;
  // final Function(String type) giveTypeItsType;

  const AvatarButton(
      {Key? key,
        required this.triggerFunction,
      required this.imagePath,
      required this.type,
      // required this.giveTypeItsType,
      this.pressed = false})
      : super(key: key);

  void chosenAvatarType(BuildContext context, {required String type}) {
    context.read<AvatarCubit>().getUserAvatar(type: type);
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        if (context.read<AvatarCubit>().avatarType == type){
          context.read<AvatarCubit>().getUserAvatar(type: "unchosen");
        } else {
          context.read<AvatarCubit>().getUserAvatar(type: type);

        }
        // chosenAvatarType(context, type: type);
        // giveTypeItsType(type);
        triggerFunction();
      },
      style: NeumorphicStyle(
          depth: pressed ? -15 : 5, color: pressed ? AppColors.black : null),
      child: Image(
        image: AssetImage(imagePath),
        height: 108,
        width: 108,
      ),
    );
  }
}
