import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AvatarButton extends StatelessWidget {
  final String imagePath;
  final String type;
  final Function(String type) giveTypeItsType;

  const AvatarButton({Key? key, required this.imagePath, required this.type, required this.giveTypeItsType})
      : super(key: key);

  void chosenAvatarType(BuildContext context, {required String type}) {
    context.read<AvatarCubit>().getUserAvatar(type: type);
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        // chosenAvatarType(context, type: type);
        print(type);
        giveTypeItsType(type);
      },
      child: Image(
        image: AssetImage(imagePath),
        height: 108,
        width: 108,
      ),
    );
  }
}
