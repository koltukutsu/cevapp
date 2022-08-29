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
  void onChange(){
    setState((){
      context.read<AvatarCubit>().avatarType;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvatarCubit, AvatarState>(builder: (context, state) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.mainBackgroundColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Align(
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
                      triggerFunction: onChange,
                      imagePath: AppPaths.noviceLION,
                      type: "LION",
                      // giveTypeItsType: giveTypeItsType,

                      pressed: context.read<AvatarCubit>().avatarType == "LION",
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    AvatarButton(
                      triggerFunction: onChange,
                      imagePath: AppPaths.noviceELEPHANT,
                      type: "ELEPHANT",
                      // giveTypeItsType: giveTypeItsType,
                      pressed:
                          context.read<AvatarCubit>().avatarType == "ELEPHANT",
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
                      triggerFunction: onChange,
                      imagePath: AppPaths.noviceOWL,
                      type: "OWL",
                      // giveTypeItsType: giveTypeItsType,
                      pressed: context.read<AvatarCubit>().avatarType == "OWL",
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    AvatarButton(
                      triggerFunction: onChange,
                      imagePath: AppPaths.noviceBIRD,
                      type: "BIRD",
                      // giveTypeItsType: giveTypeItsType,
                      pressed: context.read<AvatarCubit>().avatarType == "BIRD",
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
                      triggerFunction: onChange,
                      imagePath: AppPaths.expertDRAGON,
                      type: "DRAGON",
                      // giveTypeItsType: giveTypeItsType,
                      pressed:
                          context.read<AvatarCubit>().avatarType == "DRAGON",
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: const Alignment(0.9, 0.95),
              child: context.read<AvatarCubit> == "unchosen"
                  ? CustomText(
                      text: "Skip",
                      textColor: Colors.grey.shade200,
                      fontWeight: FontWeight.bold)
                  : NeumorphicButton(
                      onPressed: () {
                        if (context.read<AvatarCubit> == "unchosen") {
                          print("no right to go");
                        } else {
                          print("gooo!!!");
                          context.read<AvatarCubit>().setUserAvatar();
                        }
                      },
                      child: const CustomText(
                          text: "Skip",
                          textColor: AppColors.black,
                          fontWeight: FontWeight.bold),
                    ),
            )
          ],
        ),
      );
    });
  }
}
