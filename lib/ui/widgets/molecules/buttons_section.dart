import 'package:audioplayers/audioplayers.dart';
import 'package:cevapp/cubit/audio_player/audio_player_cubit.dart';
import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/cubit/shuffle/shuffle_cubit.dart';
import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/constants/app_sounds.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonsSection extends StatefulWidget {
  final void Function(bool) crossFadeStateChangerFunction;
  final Future<void> Function(String mode, {String? id}) recordFunction;

  const ButtonsSection(
      {Key? key,
      required this.crossFadeStateChangerFunction,
      required this.recordFunction})
      : super(key: key);

  @override
  State<ButtonsSection> createState() => _ButtonsSectionState();
}

class _ButtonsSectionState extends State<ButtonsSection> {
  var isShuffleButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButtonAnimated(
          label: "shuffle",
          postFixIconAsImagePath: AppPaths.shuffleIconPath,
          onPressed: () async {
            if (context.read<ShuffleCubit>().chosenCategories.isNotEmpty) {
              if (context.read<ShuffleCubit>().chosenLevels.isNotEmpty) {
                AudioPlayer().play(AssetSource(AppSounds.recordSoundPath));
                context.read<ShuffleCubit>().getQuestion();
                setState(() {
                  isShuffleButtonClicked = true;
                });
              } else {
                _showDialogSuccess(context, AppColors.magenta,
                    "You need to chose at least one Level!",
                    icon: Icons.report_problem);
              }
            } else {
              _showDialogSuccess(context, AppColors.magenta,
                  "You need to chose at least one Category!",
                  icon: Icons.report_problem);
            }
          },
          fontSize: 48,
          widthRatio: AppRatios.shuffleButtonWidthRatio,
          height: MediaQuery.of(context).size.height *
              AppRatios.shuffleButtonHeightRatio,
          buttonColor: AppColors.shuffleButtonColor,
          labelColor: AppColors.black,
          fontFamily: "Montserrat",
          filled: true,
          iconHeight: 70,
          iconWidth: 70,
          iconPaddingLeft: 10,
          insets: 30,
        ),
        if (isShuffleButtonClicked)
          CustomButtonAnimated(
            label: "record",
            postFixIconAsImagePath: AppPaths.recordIconPath,
            onPressed: () {
              context.read<RecordsCubit>().changeActionAllowance();
              widget.crossFadeStateChangerFunction(true);
              context.read<AudioPlayerCubit>().resetAudioPlayer();
              widget.recordFunction("start",
                  id: context.read<ShuffleCubit>().shuffledQuestion["id"]);
            },
            fontSize: 48,
            widthRatio: AppRatios.shuffleButtonWidthRatio,
            height: MediaQuery.of(context).size.height *
                AppRatios.shuffleButtonHeightRatio,
            buttonColor: AppColors.recordButtonColor,
            labelColor: AppColors.black,
            fontFamily: "Montserrat",
            filled: true,
            iconPaddingLeft: 5,
            insets: 7,
          )
      ],
    );
  }

  _showDialogSuccess(BuildContext context, Color color, String text,
      {Color textColor = AppColors.leftSwipeDockColor,
      IconData icon = Icons.verified}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.white,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 25,
          ),
          Text(text, style: TextStyle(color: textColor), maxLines: 3),
        ],
      ),
    ));
  }
}
