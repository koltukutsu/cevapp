import 'package:cevapp/cubit/audio_player/audio_player_cubit.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/screens/main/components/main_screen_body.dart';
import 'package:cevapp/ui/widgets/molecules/custom_swipe_dock.dart';
import 'package:cevapp/ui/widgets/organisms/records.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainScreenStack extends StatelessWidget {
  const MainScreenStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      maxHeight: MediaQuery.of(context).size.height *
          AppRatios.swipdeDockFullHeightRatio,
      renderPanelSheet: false,
      backdropEnabled: true,
      parallaxEnabled: true,
      backdropOpacity: 0.6,
      body: const MainScreenBody(),
      collapsed: const SwipeDock(),
      panel: const RecordsScreen(),
      onPanelClosed: () => context.read<AudioPlayerCubit>().resetAudioPlayer(),
    );
  }
}
