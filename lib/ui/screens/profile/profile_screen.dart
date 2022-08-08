import 'package:cevapp/ui/constants/icons.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
        ],
      ),
    );
  }
}
