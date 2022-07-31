import 'package:auto_size_text/auto_size_text.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final int fontMaxLines;

  const CustomText(
      {Key? key,
      required this.text,
      this.textColor = AppColors.white,
      this.fontSize = 19,
        this.fontMaxLines = 1,
      this.fontWeight = FontWeight.normal,
      this.fontFamily = "Inter"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: fontMaxLines,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
      fontStyle: FontStyle.italic),
    );
  }
}
