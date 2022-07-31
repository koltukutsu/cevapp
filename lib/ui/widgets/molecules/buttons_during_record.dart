import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:flutter/material.dart';

class ButtonsDuringRecord extends StatelessWidget {
  const ButtonsDuringRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomNeumorphicButton(
            imagePath: "assets/images/accept.png",
            width: 93,
            height: 93,
            function: () {}),
        CustomNeumorphicButton(
            imagePath: "assets/images/pause.png",
            width: 93,
            height: 93,
            function: () {}),
        CustomNeumorphicButton(
            imagePath: "assets/images/cross.png",
            width: 93,
            height: 93,
            function: () {})
      ],
    );
  }
}
