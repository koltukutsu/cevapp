import 'dart:ui';
import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AvatarButtonMarket extends StatelessWidget {
  final String imagePath;
  final String type;
  final Function(String type) triggerFunction;
  final Function() updateParentWidget;
  final double heightRatio;
  final double widthRatio;
  final int? price;
  final String avatarType;
  final bool alreadyBought;

  // final double depth;
  final bool pressed;
  final bool enabled;

  // final Function(String type) giveTypeItsType;

  const AvatarButtonMarket(
      {Key? key,
      required this.triggerFunction,
      required this.imagePath,
      required this.type,
      // required this.giveTypeItsType,
      required this.avatarType,
      required this.alreadyBought,
      required this.updateParentWidget,
      this.enabled = true,
      this.pressed = true,
      this.widthRatio = 0.35,
      this.heightRatio = 0.35,
      this.price})
      : super(key: key);

  // void chosenAvatarType({required String type}) {
  //   context.read<AvatarCubit>().getUserAvatar(type: type);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: MediaQuery.of(context).size.width * widthRatio,
      onPressed: enabled
          ? () {
              if (pressed) {
                triggerFunction("unchosen");
              } else {
                triggerFunction(type);
              }
            }
          : null,
      child: Neumorphic(
        style: NeumorphicStyle(
            depth: !pressed ? 0 : 10,
            border: NeumorphicBorder(
                color: !pressed ? AppColors.black : AppColors.white, width: 3)),
        child: Stack(
          // fit: StackFit.expand,
          alignment: Alignment.bottomLeft,
          children: [
            Image(
              image: AssetImage(imagePath),
              width: MediaQuery.of(context).size.width * widthRatio,
              height: MediaQuery.of(context).size.width * widthRatio,
              // height: MediaQuery.of(context).size.height * heightRatio ,
            ),
            if (pressed)
              SizedBox(
                width: MediaQuery.of(context).size.width * widthRatio,
                height: MediaQuery.of(context).size.width * widthRatio,
                // decoration:
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width:
                            MediaQuery.of(context).size.width * widthRatio / 2,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage(AppPaths.market),
                              width: 24,
                              height: 24,
                            ),
                            CustomText(
                              text: price != null ? price.toString() : "10",
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!alreadyBought)
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: MediaQuery.of(context).size.width * widthRatio,
                          height: MediaQuery.of(context).size.width *
                              widthRatio /
                              3,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            onPressed: () {
                              int avatarMoney =
                                  context.read<AvatarCubit>().avatarMoney;
                              avatarMoney = avatarMoney - price!;
                              if (avatarMoney < 0) {
                                _showDialogSuccess(context, AppColors.magenta,
                                    "You don't have enough money to buy the avatar!",
                                    icon: Icons.report_problem);
                              } else {
                                context
                                    .read<AvatarCubit>()
                                    .buyUserAvatar(type: "${type}_$avatarType");
                                context
                                    .read<AvatarCubit>()
                                    .decreaseMoney(amount: price!);
                                _showDialogSuccess(
                                    context,
                                    AppColors.acceptFinishColor,
                                    "You bought the avatar!",
                                    textColor: AppColors.acceptFinishColor);
                                triggerFunction(type);
                                // setState(() {});
                              }
                            },
                            child: const CustomText(
                              text: "Buy",
                              fontWeight: FontWeight.w900,
                              // textColor:
                              fontSize: 24,
                              italicEnable: false,
                            ),
                          ),
                        ),
                      )
                    else
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: MediaQuery.of(context).size.width * widthRatio,
                          height: MediaQuery.of(context).size.width *
                              widthRatio /
                              3,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            onPressed: () {
                              print(context.read<AvatarCubit>().avatarType);
                              if (context.read<AvatarCubit>().avatarType !=
                                  "${type}_$avatarType") {
                                context.read<AvatarCubit>().setUserAvatarMarket(
                                    type: "${type}_$avatarType");

                                _showDialogSuccess(
                                    context,
                                    AppColors.acceptFinishColor,
                                    "You chose your new avatar!",
                                    textColor: AppColors.acceptFinishColor);
                                updateParentWidget();
                              }
                            },
                            child: CustomText(
                              text: context.read<AvatarCubit>().avatarType ==
                                      "${type}_$avatarType"
                                  ? "Selected"
                                  : "Use",
                              textColor:
                                  context.read<AvatarCubit>().avatarType ==
                                          "${type}_$avatarType"
                                      ? AppColors.acceptFinishColor
                                      : AppColors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                              italicEnable: false,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            if (!enabled)
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * widthRatio,
                    height: MediaQuery.of(context).size.width * widthRatio,
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  _showDialogSuccess(BuildContext context, Color color, String text,
      {Color textColor = AppColors.leftSwipeDockColor,
      IconData icon = Icons.verified}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.white,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 25,
          ),
          Text(text, style: TextStyle(color: textColor)),
        ],
      ),
    ));
  }
}
