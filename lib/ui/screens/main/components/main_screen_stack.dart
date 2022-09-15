import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/screens/main/components/main_screen_body.dart';
import 'package:cevapp/ui/widgets/molecules/custom_swipe_dock.dart';
import 'package:cevapp/ui/widgets/organisms/records.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainScreenStack extends StatefulWidget {
  const MainScreenStack({Key? key}) : super(key: key);

  @override
  State<MainScreenStack> createState() => _MainScreenStackState();
}

class _MainScreenStackState extends State<MainScreenStack> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      maxHeight: MediaQuery.of(context).size.height *
          AppRatios.swipdeDockFullHeightRatio,
      renderPanelSheet: false,
      backdropEnabled: true,
      // backdropColor: AppColors.mainBackgroundColor,
      parallaxEnabled: true,

      backdropOpacity: 0.6,
      body: const MainScreenBody(),
      collapsed: const SwipeDock(),
      panel: const RecordsScreen(),
    );
  }
}
