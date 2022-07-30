import 'package:flutter/material.dart';
import 'package:talebe_app/ui/theme/colors.dart';

class CustomLinearGradient extends StatelessWidget {
  final Widget child;

  const CustomLinearGradient({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowBlueDarker,
            spreadRadius: 0.2,
            blurRadius: 0.7,
            offset: Offset(0.8, 2),
          )
        ],
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            AppColors.textFieldGradientLeft,
            AppColors.textFieldGradientRight,
          ],
          // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: child,
    );
  }
}
