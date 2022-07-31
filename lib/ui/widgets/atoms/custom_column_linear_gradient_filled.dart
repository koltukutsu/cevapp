import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomColumnLinearGradientFilled extends StatelessWidget {
  final double height;
  final double width;

  const CustomColumnLinearGradientFilled(
      {Key? key,
      this.height = AppRatios.columnHeight,
      this.width = AppRatios.columnWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowBlueDarker,
              spreadRadius: 0.4,
              blurRadius: 0.7,
              offset: Offset(0.8, 2),
            )
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(22.0),
        ),
      ),
    );
  }
}
