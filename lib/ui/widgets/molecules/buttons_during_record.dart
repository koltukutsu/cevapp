import 'package:cevapp/ui/constants/icons.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:flutter/material.dart';

class ButtonsDuringRecord extends StatelessWidget {
  final void Function(bool) crossFadeStateChangerFunction;
  const ButtonsDuringRecord({Key? key, required this.crossFadeStateChangerFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomNeumorphicButton(
            imagePath: AppPaths.acceptIconPath,
            width: 93,
            height: 93,
            paddingAllAsDouble: 0,
            function: () {
              crossFadeStateChangerFunction(false);
            }),
        CustomNeumorphicButton(
            imagePath: AppPaths.pauseIconPath,
            width: 93,
            height: 93,
            paddingAllAsDouble: 0,
            function: () {}),
        CustomNeumorphicButton(
            imagePath: AppPaths.removetIconPath,
            width: 93,
            height: 93,
            paddingAllAsDouble: 0,
            function: () {
              crossFadeStateChangerFunction(false);
            })
      ],
    );
  }
}
