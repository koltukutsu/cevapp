import 'dart:ui';

import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AvatarCategoryButtonMarket extends StatelessWidget {
  final String imagePath;
  final String type;
  final Function(String type) triggerFunction;
  final double heightRatio;
  final double widthRatio;

  // final double depth;
  final bool pressed;
  final bool enabled;

  // final Function(String type) giveTypeItsType;

  const AvatarCategoryButtonMarket(
      {Key? key,
        required this.triggerFunction,
        required this.imagePath,
        required this.type,
        // required this.giveTypeItsType,
        this.enabled = true,
        this.pressed = true,
        this.widthRatio = 0.35,
        this.heightRatio = 0.35})
      : super(key: key);

  void chosenAvatarType(BuildContext context, {required String type}) {
    context.read<AvatarCubit>().getUserAvatar(type: type);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: enabled
          ? () {
        if (pressed) {
          triggerFunction("unchosen");
        } else {
          triggerFunction(type);
        }
      }
          : null,
      // margin: EdgeInsets.all(0),
      child: Neumorphic(
        style: NeumorphicStyle(
            depth: !pressed ? 0 : 10,
            border: NeumorphicBorder(
                color: !pressed ? AppColors.black : AppColors.white, width: 3)),
        child: Stack(
          children: [
            Image(
              image: AssetImage(imagePath),
              width: MediaQuery.of(context).size.width * widthRatio,
              height: MediaQuery.of(context).size.width * widthRatio,
            ),
            if (!enabled)
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * widthRatio,
                    height: MediaQuery.of(context).size.width * widthRatio,
                    decoration:
                    BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}