import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_column_linear_gradient_filled.dart';
import 'package:flutter/material.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({Key? key}) : super(key: key);

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: MediaQuery.of(context).size.height *
          AppRatios.swipdeDockFullHeightRatio,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 28.0),
            child: CustomColumnLinearGradientFilled(),
          )
        ],
      ),
    );
  }
}
