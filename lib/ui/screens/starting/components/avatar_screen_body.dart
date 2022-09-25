import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/avatar_button.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AvatarScreenBody extends StatefulWidget {
  const AvatarScreenBody({Key? key}) : super(key: key);

  @override
  State<AvatarScreenBody> createState() => _AvatarScreenBodyState();
}

class _AvatarScreenBodyState extends State<AvatarScreenBody> {
  var avatarType = "unchosen";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("control");
    // print(context.read<AvatarCubit>().avatarName);
    // print(context.read<AvatarCubit>().avatarSurname);
  }

  void onChange(String type) {
    // print("Taken Avatar is : $type");
    setState(() {
      avatarType = type;
    });
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
          const Align(
              alignment: Alignment(0.0, -0.88),
              child: CustomText(
                  text: "Set Your",
                  italicEnable: false,
                  fontWeight: FontWeight.bold,
                  fontSize: 60)),
          const Align(
              alignment: Alignment(0.0, -0.78),
              child: CustomText(
                  text: "Avatar",
                  italicEnable: false,
                  fontWeight: FontWeight.bold,
                  fontSize: 120)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarButton(
                    triggerFunction: onChange,
                    imagePath: AppPaths.noviceLION,
                    type: "NOVICE_LION",
                    // giveTypeItsType: giveTypeItsType,

                    pressed: avatarType == "NOVICE_LION",
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  AvatarButton(
                    triggerFunction: onChange,
                    imagePath: AppPaths.noviceELEPHANT,
                    type: "NOVICE_ELEPHANT",
                    // giveTypeItsType: giveTypeItsType,
                    pressed: avatarType == "NOVICE_ELEPHANT",
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarButton(
                    triggerFunction: onChange,
                    imagePath: AppPaths.noviceOWL,
                    type: "NOVICE_OWL",
                    // giveTypeItsType: giveTypeItsType,
                    pressed: avatarType == "NOVICE_OWL",
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  AvatarButton(
                    triggerFunction: onChange,
                    imagePath: AppPaths.noviceBIRD,
                    type: "NOVICE_BIRD",
                    // giveTypeItsType: giveTypeItsType,
                    pressed: avatarType == "NOVICE_BIRD",
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarButton(
                    triggerFunction: onChange,
                    imagePath: AppPaths.expertDRAGON,
                    type: "NOVICE_DRAGON",
                    // giveTypeItsType: giveTypeItsType,
                    pressed: avatarType == "NOVICE_DRAGON",
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  AvatarButton(
                    triggerFunction: onChange,
                    imagePath: AppPaths.noviceDOLPHIN,
                    type: "NOVICE_DOLPHIN",
                    // giveTypeItsType: giveTypeItsType,
                    pressed: avatarType == "NOVICE_DOLPHIN",
                  ),
                ],
              ),
            ],
          ),
          // Align(
          //     alignment: const Alignment(-0.7, 0.98),
          //     child: CustomText(
          //         text: avatarType == "unchosen" ? "" : avatarType,
          //         textColor: AppColors.white,
          //         italicEnable: false,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 60)),
          Align(
            alignment: const Alignment(0.9, 0.95),
            child: avatarType == "unchosen"
                ? Neumorphic(
                    style: const NeumorphicStyle(color: Colors.transparent),
                    child: SizedBox(
                      width: 68,
                      height: 40,
                      child: Center(
                        child: CustomText(
                            text: "Next",
                            textColor: Colors.grey.shade200,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : NeumorphicButton(
                    onPressed: () {
                      if (avatarType == "unchosen") {
                        // print("no right to go");
                      } else {
                        // print("gooo!!! $avatarType");
                        context
                            .read<AvatarCubit>()
                            .setUserAvatar(type: avatarType);
                        // print(
                        //     "getted: ${context.read<AvatarCubit>().avatarType}");
                      }
                    },
                    child: const CustomText(
                        text: "Next",
                        textColor: AppColors.black,
                        fontWeight: FontWeight.bold),
                  ),
          )
        ],
      ),
    );
  }
}
