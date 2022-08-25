import 'package:cevapp/ui/constants/icons.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_text_field.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_text_field_general_use.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({Key? key}) : super(key: key);

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
              alignment: Alignment.topRight,
              child: CustomNeumorphicButton(
                  imagePath: AppPaths.homePath,
                  width: 41,
                  height: 41,
                  function: () {
                    Navigator.of(context).pop();
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomGeneralUseNeumorphicTextField(
                  text: "First",
                  useImage: AppPaths.sternLookingOwl,
                  neumorphicBoxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
                  widthRatio: 0.55,
                  heightRatio: 0.3),
              Column(
                children: [
                  CustomGeneralUseNeumorphicTextField(
                      text: "Mehmet Semih",
                      neumorphicBoxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(5)),
                      widthRatio: 0.4,
                      heightRatio: 0.05),
                  CustomGeneralUseNeumorphicTextField(
                      text: "BABACAN",
                      neumorphicBoxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(5)),
                      widthRatio: 0.4,
                      heightRatio: 0.05),
                ],
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CustomText(text: "Shuffled"),
                  CustomGeneralUseNeumorphicTextField(
                      text: "100",
                      neumorphicBoxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(5)),
                      widthRatio: 0.3,
                      heightRatio: 0.1),
                ],
              ),

              CustomGeneralUseNeumorphicTextField(
                  text: "BABACAN",
                  neumorphicBoxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(5)),
                  widthRatio: 0.3,
                  heightRatio: 0.1),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomGeneralUseNeumorphicTextField(
                  text: "BABACAN",
                  neumorphicBoxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(5)),
                  widthRatio: 0.3,
                  heightRatio: 0.1),
              CustomGeneralUseNeumorphicTextField(
                  text: "BABACAN",
                  neumorphicBoxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(5)),
                  widthRatio: 0.3,
                  heightRatio: 0.1),

            ],
          )
        ],
      ),
    );
  }
}
