import 'package:flutter/material.dart';
import 'package:talebe_app/ui/theme/colors.dart';
import 'package:talebe_app/ui/widgets/atoms/custom_linear_gradient.dart';
import 'package:talebe_app/ui/widgets/atoms/custom_text_field.dart';

class CustomTextFieldWithLinearGradient extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final Color labelColor;
  final double labelFontSize;
  final String labelFontFamily;
  final FontWeight labelFontWeight;
  final double? takenControllerValue;

  const CustomTextFieldWithLinearGradient({
    Key? key,
    this.takenControllerValue,
    required this.controller,
    required this.label,
    this.hint = "",
    this.labelColor = AppColors.white,
    this.labelFontSize = 18,
    this.labelFontFamily = "Inter",
    this.labelFontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomLinearGradient(
        child: CustomTextField(
      controller: controller,
      label: label,
      hint: hint,
      labelColor: labelColor,
      labelFontFamily: labelFontFamily,
      labelFontSize: labelFontSize,
      labelFontWeight: labelFontWeight,
    ));
  }
}
