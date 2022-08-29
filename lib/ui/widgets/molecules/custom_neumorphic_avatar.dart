import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNeumorphicAvatar extends StatelessWidget {
  final String? text;
  final Color textColor;
  final double widthRatio;
  final double heightRatio;
  final double fontSize;
  final String fontFamily;
  final bool italicEnable;
  final Color neumorphicBackgroundColor;
  final NeumorphicShape neumorphicShape;
  final NeumorphicBoxShape neumorphicBoxShape;
  final String useImage;
  // final EdgeInsetsGeometry paddingEdgeInsets;
  // final bool isPaddingGiven;
  const CustomNeumorphicAvatar({
    Key? key,
    this.text = " ",
    this.textColor = AppColors.secondaryTextColor,
    this.widthRatio = AppRatios.questionFieldWidthRatio,
    this.heightRatio = AppRatios.questionFieldHeightRatio,
    this.fontSize = 20,
    this.italicEnable = true,
    this.fontFamily = "Roboto",
    this.neumorphicBackgroundColor = AppColors.white,
    this.neumorphicShape = NeumorphicShape.concave,
    required this.neumorphicBoxShape,
    this.useImage = " ",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          shape: neumorphicShape,
          boxShape: neumorphicBoxShape,
          depth: 8,
          lightSource: LightSource.bottom,
          color: neumorphicBackgroundColor),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * heightRatio,
          width: MediaQuery.of(context).size.width * widthRatio,
          child: Center(
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage(useImage),
            )
          )),
    );
  }
}
