import 'package:flutter/material.dart';
import 'package:talebe_app/ui/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final Color labelColor;
  final double labelFontSize;
  final String labelFontFamily;
  final FontWeight labelFontWeight;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.labelColor,
    required this.labelFontSize,
    required this.labelFontFamily,
    required this.labelFontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
          labelStyle: TextStyle(
              color: labelColor,
              fontSize: labelFontSize,
              fontWeight: labelFontWeight,
              fontFamily: labelFontFamily),
          // focusedBorder:,
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
            borderSide: BorderSide(
                color: AppColors.disabledBorderColor, width: 0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
            borderSide:
                BorderSide(color: AppColors.enabledBorderColor, width: 0),
          ),
          // errorBorder:,
          // focusedErrorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20.0),
          //   borderSide: const BorderSide(color: AppColors.primary, width: 0),
          // ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
            borderSide:
                BorderSide(color: AppColors.borderColor, width: 0),
          ),
          labelText: label,
          hintText: hint),
    );
  }
}
