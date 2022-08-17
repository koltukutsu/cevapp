import 'package:cevapp/ui/constants/icons.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_button.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:flutter/material.dart';

class RecordRow extends StatelessWidget {
  final String path;
  final String question;

  const RecordRow({Key? key, required this.path, required this.question})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * AppRatios.recordRowWidthRatio,
      height: MediaQuery.of(context).size.height * AppRatios.recordRowHeightRatio,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: CustomText(
                text: question,
                textColor: AppColors.black,
                fontSize: 18,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.normal,
                italicEnable: false),
          ),
          CustomButtonAnimated(
            label: "play",
            postFixIconAsImagePath: AppPaths.playButton,
            onPressed: () {},
            fontSize: 18,
            iconWidth: 20,
            iconHeight: 20,
            widthRatio: AppRatios.playButtonWidthRatio,
            height: MediaQuery.of(context).size.height *
                AppRatios.playButtonHeightRatio,
            buttonColor: AppColors.playButtonColor,
            labelColor: AppColors.playButtonLabelColor,

            // labelColor: AppColors.black,
            // fontFamily: "Montserrat",
            filled: true,
            iconPaddingLeft: 5,
            insets: 7,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
          CustomButtonAnimated(
            label: "delete",
            postFixIconAsImagePath: AppPaths.deleteButton,
            onPressed: () {},
            fontSize: 18,
            iconHeight: 20,
            iconWidth: 20,
            widthRatio: AppRatios.deleteButtonWidthRatio,
            height: MediaQuery.of(context).size.height *
                AppRatios.deleteButtonHeightRatio,
            buttonColor: AppColors.deleteButtonColor,
            // labelColor: AppColors.black,
            // fontFamily: "Montserrat",
            labelColor: AppColors.deleteButtonLabelColor,
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
      ),
    );
  }
}
