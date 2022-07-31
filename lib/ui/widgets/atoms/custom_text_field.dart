import 'package:cevapp/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  // final String? hint;
  final Color labelColor;
  final double labelFontSize;
  final String labelFontFamily;
  final FontWeight labelFontWeight;
  final double height;

  const CustomTextField({
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
    return TextField(
      enabled: false,
      controller: controller,
      // keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelStyle: TextStyle(
            height: height,
            color: labelColor,
            fontSize: labelFontSize,
            fontWeight: labelFontWeight,
            fontFamily: labelFontFamily),
        // focusedBorder:,
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
              color: AppColors.disabledBorderColor, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide:
          BorderSide(color: AppColors.enabledBorderColor, width: 2),
        ),
        // errorBorder:,
        // focusedErrorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20.0),
        //   borderSide: const BorderSide(color: AppColors.primary, width: 0),
        // ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide:
          BorderSide(color: AppColors.borderColor, width: 2),
        ),
        filled: true,
        fillColor: AppColors.white,
      ),
    );
  }
}
