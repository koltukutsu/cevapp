import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text_field.dart';
import 'package:cevapp/ui/widgets/molecules/buttons_section.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_text_field.dart';
import 'package:flutter/material.dart';

class MainScreenBody extends StatefulWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
  final _controller = TextEditingController(text: "Give a response to cevapp");

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainBackgroundColor,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const CustomText(
            text: "cevapp",
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            fontSize: 82,
            textColor: AppColors.white,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          const CustomNeumorphicTextField(),
          // SizedBox(
          //   // height: ,
          //   width: MediaQuery.of(context).size.width *
          //       AppRatios.questionFieldWidthRatio,
          //   child: CustomTextField(
          //       controller: _controller,
          //       labelColor: AppColors.black,
          //       labelFontSize: 20,
          //       height: MediaQuery.of(context).size.height *
          //           AppRatios.questionFieldHeightRatio,
          //       labelFontFamily: "Roboto",
          //       labelFontWeight: FontWeight.normal),
          // ),
          const ButtonsSection()
        ],
      ),
    );
  }
}
