import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/avatar_button.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AvatarScreenBody extends StatefulWidget {
  const AvatarScreenBody({Key? key}) : super(key: key);

  @override
  State<AvatarScreenBody> createState() => _AvatarScreenBodyState();
}

class _AvatarScreenBodyState extends State<AvatarScreenBody> {
  var type = null;

  // context.read<AvatarCubit>().getUserAvatar();

  void giveTypeItsType(String type) {
    print(type);
    setState(() {
      type = type;
    });
    print(type);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: AppColors.mainBackgroundColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
              alignment: Alignment(0.0, -0.8),
              child: CustomText(
                  text: "Choose Your Avatar",
                  italicEnable: false,
                  fontWeight: FontWeight.bold,
                  fontSize: 45)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarButton(
                      imagePath: AppPaths.noviceLION,
                      type: "LION",
                      giveTypeItsType: giveTypeItsType),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  AvatarButton(
                    imagePath: AppPaths.noviceELEPHANT,
                    type: "ELEPHANT",
                    giveTypeItsType: giveTypeItsType,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarButton(
                      imagePath: AppPaths.noviceOWL,
                      type: "OWL",
                      giveTypeItsType: giveTypeItsType),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  AvatarButton(
                      imagePath: AppPaths.noviceBIRD,
                      type: "BIRD",
                      giveTypeItsType: giveTypeItsType),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarButton(
                    imagePath: AppPaths.expertDRAGON,
                    type: "DRAGON",
                    giveTypeItsType: giveTypeItsType,
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: const Alignment(0.9, 0.95),
            child: NeumorphicButton(
              style: type == null
                  ? NeumorphicStyle(
                      color: Colors.grey,
                      border: NeumorphicBorder(isEnabled: type != null))
                  : NeumorphicStyle(
                  color: AppColors.white,
                  border: NeumorphicBorder(isEnabled: type != null)),
              onPressed: type == null
                  ? () {
                      if (type == null) {
                        print("no right to go");
                      } else {
                        print("gooo!!!");
                      }
                    }
                  : null,
              child: const CustomText(
                  text: "Skip",
                  textColor: AppColors.black,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
