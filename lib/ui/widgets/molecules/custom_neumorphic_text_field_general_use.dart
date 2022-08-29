import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomGeneralUseNeumorphicTextField extends StatelessWidget {
  final String text;
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
  final FontWeight fontWeight;
  final double leftPadding;
  final double bottomPadding;

  const CustomGeneralUseNeumorphicTextField({
    Key? key,
    required this.text,
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
    this.fontWeight = FontWeight.normal,
    this.leftPadding = 23,
    this.bottomPadding = 15,
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
            child: Padding(
              padding:
                  EdgeInsets.only(left: leftPadding, right: 10, bottom: bottomPadding),
              child: useImage != " "
                  ? Image(
                      image: AssetImage(useImage),
                    )
                  : CustomText(
                      text: text,
                      fontFamily: fontFamily,
                      fontWeight: fontWeight,
                      fontSize: fontSize,
                      textColor: textColor,
                      fontMaxLines: 5,
                      italicEnable: italicEnable,
                    ),
            ),
          )),
    );
  }
}
