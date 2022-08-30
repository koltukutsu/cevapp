import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AvatarButton extends StatelessWidget {
  final String imagePath;
  final String type;
  final Function(String type) triggerFunction;
  final double heightRatio;
  final double widthRatio;
  // final double depth;
  final bool pressed;
  // final Function(String type) giveTypeItsType;

  const AvatarButton(
      {Key? key,
        required this.triggerFunction,
      required this.imagePath,
      required this.type,
      // required this.giveTypeItsType,
      this.pressed = true,
      this.widthRatio = 0.35,
      this.heightRatio = 0.35})
      : super(key: key);

  void chosenAvatarType(BuildContext context, {required String type}) {
    context.read<AvatarCubit>().getUserAvatar(type: type);
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        if (pressed){
          // context.read<AvatarCubit>().getUserAvatar(type: "unchosen");
          triggerFunction("unchosen");
        } else {
          triggerFunction(type);
          // context.read<AvatarCubit>().getUserAvatar(type: type);
        }
        // chosenAvatarType(context, type: type);
        // giveTypeItsType(type);
      },
      margin: EdgeInsets.all(0),

      style: NeumorphicStyle(

          depth: pressed ? -15 : 5, color: pressed ? AppColors.mainBackgroundColor : null),
      child: Image(
        image: AssetImage(imagePath),
        height: MediaQuery.of(context).size.width * widthRatio,
        // width: 128,
      ),
    );
  }
}
