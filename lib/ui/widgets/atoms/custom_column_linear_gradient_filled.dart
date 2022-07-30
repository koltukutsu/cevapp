import 'package:flutter/material.dart';
import 'package:talebe_app/ui/theme/colors.dart';

class CustomColumnLinearGradientFilled extends StatelessWidget {
  final double height;
  final double width;
  const CustomColumnLinearGradientFilled({Key? key, this.height = 30, this.width = 4}) : super(key: key);

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
              spreadRadius: 0.2,
              blurRadius: 0.7,
              offset: Offset(0.8, 2),
            )
          ],
          borderRadius: BorderRadius.circular(3.0),
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[
              AppColors.leftMarkGradientLeft,
              AppColors.leftMarkGradientRight,
            ],
            tileMode: TileMode.mirror,
          ),
        ),
      ),
    );
  }
}
