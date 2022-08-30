import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/navigation/navigation_names.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_market_button.dart';
import 'package:flutter/material.dart';

class MarketScreenBody extends StatelessWidget {
  const MarketScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.mainBackgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomNeumorphicMarketButton(
                          imagePath: AppPaths.market,
                          width: 41,
                          height: 41,
                          function: () {
                            // Navigator.of(context).pushNamed(ROUTE_MARKET);
                          }),
                      CustomNeumorphicButton(
                          imagePath: AppPaths.profilePath,
                          width: 41,
                          height: 41,
                          function: () {
                            // Navigator.of(context).popUntil((ModalRoute.withName(ROUTE_MAIN)));
                            Navigator.of(context).pop();
                          }),
                    ],
                  ))
            ]));
  }
}
