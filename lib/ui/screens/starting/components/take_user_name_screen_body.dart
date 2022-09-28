import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text_field.dart';

// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TakeUserNameScreenBody extends StatefulWidget {
  const TakeUserNameScreenBody({Key? key}) : super(key: key);

  @override
  State<TakeUserNameScreenBody> createState() => _TakeUserNameScreenBodyState();
}

class _TakeUserNameScreenBodyState extends State<TakeUserNameScreenBody> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userSurnameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    userNameController.dispose();
    userSurnameController.dispose();
    super.dispose();
  }

  onChangeDo() {
    setState(() {
      userNameController;
      userSurnameController;
    });
  }

  changeAvatarNamesOnCubit() {
    context.read<AvatarCubit>().setUserNames(
        userName: userNameController.text,
        userSurname: userSurnameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.mainBackgroundColor,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Align(
                  alignment: Alignment(0.0, -0.8),
                  child: CustomText(
                      text: "Set Your",
                      italicEnable: false,
                      fontWeight: FontWeight.bold,
                      fontSize: 60)),
              const Align(
                  alignment: Alignment(0.0, -0.6),
                  child: CustomText(
                      text: "Names",
                      italicEnable: false,
                      fontWeight: FontWeight.bold,
                      fontSize: 120)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: CustomTextField(
                      hintText: "Your Name",
                        onChangeFunction: onChangeDo,
                        height: 1,
                        controller: userNameController,
                        labelColor: AppColors.black,
                        labelFontSize: 30,
                        labelFontFamily: "Roboto",
                        labelFontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: CustomTextField(
                      hintText: "Your Nickname",
                        onChangeFunction: onChangeDo,
                        height: 1,
                        controller: userSurnameController,
                        labelColor: AppColors.black,
                        labelFontSize: 30,
                        labelFontFamily: "Roboto",
                        labelFontWeight: FontWeight.w400),
                  ),
                ],
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.bounceOut,
                child: Align(
                  alignment: const Alignment(0.9, 0.95),
                  child: userNameController.text.isEmpty ||
                          userSurnameController.text.isEmpty
                      ? Neumorphic(
                          style:
                              const NeumorphicStyle(color: Colors.transparent),
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
                            changeAvatarNamesOnCubit();
                          },
                          child: const CustomText(
                              text: "Next",
                              textColor: AppColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              )
            ],
          )),
    );
  }
}
