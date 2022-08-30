import 'package:cevapp/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomTextFieldNeumorphicForAvatarPage extends StatelessWidget {
  final TextEditingController controller;

  // final String? hint;
  final Color labelColor;
  final double labelFontSize;
  final String labelFontFamily;
  final FontWeight labelFontWeight;
  final double height;

  const CustomTextFieldNeumorphicForAvatarPage({
    Key? key,
    required this.height,
    required this.controller,
    // required this.hint,
    required this.labelColor,
    required this.labelFontSize,
    required this.labelFontFamily,
    required this.labelFontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
          depth: 8,
          lightSource: LightSource.bottom,
          color: AppColors.white),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: TextField(
          textAlign: TextAlign.center,
          enabled: true,
          controller: controller,
          // keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelStyle: TextStyle(
                height: height,
                color: labelColor,
                fontSize: 60,
                fontWeight: labelFontWeight,
                fontFamily: labelFontFamily),
            // focusedBorder:,
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide:
                  BorderSide(color: AppColors.disabledBorderColor, width: 2),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide:
                  BorderSide(color: AppColors.disabledBorderColor, width: 2),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: AppColors.borderColor, width: 2),
            ),
            filled: true,
            fillColor: AppColors.white,
          ),
        ),
      ),
    );
  }
}