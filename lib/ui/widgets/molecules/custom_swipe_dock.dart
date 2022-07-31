import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_column_linear_gradient_filled.dart';
import 'package:flutter/material.dart';

class SwipeDock extends StatelessWidget {
  const SwipeDock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height * AppRatios.swipeDockHeightRatio,
      decoration: const BoxDecoration(
          color: AppColors.swipeDockColor,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[
              AppColors.leftSwipeDockColor,
              AppColors.rightSwipeDockColor,
            ],
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(60))),
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [CustomColumnLinearGradientFilled()],
        ),
      ),
    );
  }
}
