import 'package:cevapp/ui/constants/icons.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_button.dart';
import 'package:flutter/material.dart';

class RecordRow extends StatelessWidget {
  final String path;
  final String question;
  const RecordRow({Key? key, required this.path, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButtonAnimated(
          label: "play",
          postFixIconAsImagePath: AppPaths.playButton,
          onPressed: () {
          },
          fontSize: 48,
          iconWidth: 30,
          iconHeight: 30,
          widthRatio: AppRatios.playButtonWidthRatio,
          height: MediaQuery.of(context).size.height *
              AppRatios.playButtonHeightRatio,
          buttonColor: AppColors.playButtonColor,
          // labelColor: AppColors.black,
          // fontFamily: "Montserrat",
          filled: true,
          iconPaddingLeft: 5,
          insets: 7,
        ),
        CustomButtonAnimated(
          label: "delete",
          postFixIconAsImagePath: AppPaths.deleteButton,
          onPressed: () {
          },
          fontSize: 48,
          iconHeight: 30,
          iconWidth: 30,
          widthRatio: AppRatios.deleteButtonWidthRatio,
          height: MediaQuery.of(context).size.height *
              AppRatios.deleteButtonHeightRatio,
          buttonColor: AppColors.deleteButtonColor,
          // labelColor: AppColors.black,
          // fontFamily: "Montserrat",
          filled: true,
          iconPaddingLeft: 5,
          insets: 7,
        ),
        // CustomButtonAnimated(
        //   label: "play",
        //   postFixIconAsImagePath: AppPaths.playButton,
        //   onPressed: () {
        //   },
        //   fontSize: 48,
        //   widthRatio: AppRatios.playButtonWidthRatio,
        //   height: MediaQuery.of(context).size.height *
        //       AppRatios.playButtonHeightRatio,
        //   buttonColor: AppColors.playButtonColor,
        //   // labelColor: AppColors.black,
        //   // fontFamily: "Montserrat",
        //   filled: true,
        //   iconPaddingLeft: 5,
        //   insets: 7,
        // )
      ],
    );
  }
}
