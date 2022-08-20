import 'package:cevapp/cubit/shuffle/shuffle_cubit.dart';
import 'package:cevapp/ui/constants/icons.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonsSection extends StatefulWidget {
  final void Function(bool) crossFadeStateChangerFunction;
  final Future<void> Function(String) recordFunction;

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
          onPressed: () {
            context.read<ShuffleCubit>().getText();
            setState(() {
              isShuffleButtonClicked = true;
            });
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
              widget.crossFadeStateChangerFunction(true);
              widget.recordFunction("start");
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
}
