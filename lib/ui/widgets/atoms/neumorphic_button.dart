import 'package:cevapp/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNeumorphicButton extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final VoidCallback? function;
  final double topMargin;
  final double bottomMargin;
  final double leftMargin;
  final double rightMargin;
  final double paddingAllAsDouble;

  const CustomNeumorphicButton({
    Key? key,
    required this.imagePath,
    required this.width,
    required this.height,
    this.function,
    this.topMargin = 6,
    this.bottomMargin = 0,
    this.leftMargin = 0,
    this.rightMargin = 6,
    this.paddingAllAsDouble = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        margin: EdgeInsets.only(
            top: topMargin,
            right: rightMargin,
            left: leftMargin,
            bottom: bottomMargin),
        onPressed: function,
        style: const NeumorphicStyle(
          shape: NeumorphicShape.convex,
          shadowLightColor: AppColors.transparent,
          boxShape: NeumorphicBoxShape.circle(),
        ),
        padding: EdgeInsets.all(paddingAllAsDouble),
        child: Image(
          image: AssetImage(imagePath),
          width: width,
          height: height,
        ));
  }
}
