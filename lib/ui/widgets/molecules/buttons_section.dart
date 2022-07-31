import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_button.dart';
import 'package:flutter/material.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButtonAnimated(
          label: "shuffle",
          postFixIconAsImagePath: "assets/images/shuffle_second.png",
          onPressed: () {},
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
        CustomButtonAnimated(
          label: "record",
          postFixIconAsImagePath: "assets/images/record.png",
          onPressed: () {},
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
