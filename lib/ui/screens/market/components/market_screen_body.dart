import 'package:cevapp/data/avatar_prices_per_level.dart';
import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/avatar_button_market.dart';
import 'package:cevapp/ui/widgets/atoms/avatar_button_market_place_holder.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_market_button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MarketScreenBody extends StatefulWidget {
  const MarketScreenBody({Key? key}) : super(key: key);

  @override
  State<MarketScreenBody> createState() => _MarketScreenBodyState();
}

class _MarketScreenBodyState extends State<MarketScreenBody> {
  var avatarType = "unchosen";
  var marketAvatarType = "unchosen";

  var placeHolderType = "unchosen";

  var onPressedWidthRatio = 0.27;
  var smallWidthRatio = 0.25;

  var onPressedMarketWidthRatio = 0.35;
  var smallMarketWidthRatio = 0.25;

  void onChange(String type) {
    setState(() {
      avatarType = type;
    });
    if (type != "unchosen") {
      setState(() {
        smallWidthRatio = 0.25;
      });
    } else {
      setState(() {
        smallWidthRatio = 0.25;
      });
    }
  }

  void onChangeMarket(String type) {
    setState(() {
      marketAvatarType = type;
    });

    if (type != "unchosen") {
      setState(() {
        smallMarketWidthRatio = 0.15;
      });
    } else {
      setState(() {
        smallMarketWidthRatio = 0.25;
      });
    }
  }

  void onChangePlaceHolder(String type) {
    setState(() {
      placeHolderType = type;
    });

    if (type != "unchosen") {
      setState(() {
        smallMarketWidthRatio = 0.15;
      });
    } else {
      setState(() {
        smallMarketWidthRatio = 0.25;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainBackgroundColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          clipBehavior: Clip.none,
          children: [
            Align(
                alignment: const Alignment(0.0, -0.86),
                child: CustomText(
                    text: avatarType == "unchosen" ? "Choose" : avatarType,
                    italicEnable: false,
                    fontWeight: FontWeight.bold,
                    fontSize: 55)),
            Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomNeumorphicMarketButton(
                        imagePath: AppPaths.market,
                        width: 41,
                        height: 41,
                        function: () {
                          // Navigator.of(context).pushNamed(ROUTE_MARKET);
                        }),
                    CustomNeumorphicButton(
                        imagePath: AppPaths.profilePath,
                        width: 41,
                        height: 41,
                        function: () {
                          // Navigator.of(context).popUntil((ModalRoute.withName(ROUTE_MAIN)));
                          Navigator.of(context).pop();
                        }),
                  ],
                )),
            // Align(
            //   alignment: const Alignment(0, -0.65),
            //   child: Container(
            //     color: AppColors.mainBackgroundColor,
            //     height: MediaQuery.of(context).size.height * 0.3,
            //     width: MediaQuery.of(context).size.width * 0.98,
            //   ),
            // ),

            Align(
              alignment: const Alignment(-0.9, -0.7),
              child: AvatarButtonMarket(
                triggerFunction: onChange,
                imagePath: AppPaths.noviceLION,
                type: "LION",
                // giveTypeItsType: giveTypeItsType,
                pressed: avatarType == "LION",
                widthRatio: avatarType == "LION"
                    ? onPressedWidthRatio
                    : smallWidthRatio,
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.7),
              child: AvatarButtonMarket(
                triggerFunction: onChange,
                imagePath: AppPaths.noviceELEPHANT,
                type: "ELEPHANT",
                // giveTypeItsType: giveTypeItsType,
                pressed: avatarType == "ELEPHANT",
                widthRatio: avatarType == "ELEPHANT"
                    ? onPressedWidthRatio
                    : smallWidthRatio,
              ),
            ),
            Align(
              alignment: const Alignment(0.9, -0.7),
              child: AvatarButtonMarket(
                triggerFunction: onChange,
                imagePath: AppPaths.noviceOWL,
                type: "OWL",
                // giveTypeItsType: giveTypeItsType,
                pressed: avatarType == "OWL",
                widthRatio:
                    avatarType == "OWL" ? onPressedWidthRatio : smallWidthRatio,
              ),
            ),
            Align(
              alignment: const Alignment(-0.9, -0.4),
              child: AvatarButtonMarket(
                triggerFunction: onChange,
                imagePath: AppPaths.noviceBIRD,
                type: "BIRD",
                // giveTypeItsType: giveTypeItsType,
                pressed: avatarType == "BIRD",
                widthRatio: avatarType == "BIRD"
                    ? onPressedWidthRatio
                    : smallWidthRatio,
              ),
            ),
            Align(
              alignment: const Alignment(0.0, -0.4),
              child: AvatarButtonMarket(
                triggerFunction: onChange,
                imagePath: AppPaths.expertDRAGON,
                type: "DRAGON",
                // giveTypeItsType: giveTypeItsType,
                pressed: avatarType == "DRAGON",
                widthRatio: avatarType == "DRAGON"
                    ? onPressedWidthRatio
                    : smallWidthRatio,
              ),
            ),
            Align(
              alignment: const Alignment(0.9, -0.4),
              child: AvatarButtonMarket(
                triggerFunction: onChange,
                imagePath: AppPaths.noviceDOLPHIN,
                type: "DOLPHIN",
                // giveTypeItsType: giveTypeItsType,
                pressed: avatarType == "DOLPHIN",
                widthRatio: avatarType == "DOLPHIN"
                    ? onPressedWidthRatio
                    : smallWidthRatio,
              ),
            ),
            Align(
              alignment: const Alignment(0.0, -0.185),
              child: Neumorphic(
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.95,
                    color: AppColors.marketMiddleSeparatorColumnColor
                    // color: AppColors.white,
                    ),
              ),
            ),
            Align(
                alignment: const Alignment(0.0, -0.185),
                child: CustomText(
                    text: marketAvatarType == "unchosen"
                        ? "Rank"
                        : marketAvatarType,
                    italicEnable: false,
                    fontWeight: FontWeight.bold,
                    fontSize: 40)),
            //
            // second which is 7 of chosen things
            //
            AnimatedOpacity(
              opacity: avatarType != "unchosen" ? 1 : 0,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.bounceOut,
              child: Visibility(
                visible: avatarType != "unchosen",
                child: Stack(
                  children: [
                    Align(
                      alignment: const Alignment(-0.93, 0.05),
                      child: AvatarButtonMarket(
                        triggerFunction: onChangeMarket,
                        imagePath: getNoviceAvatarPath(type: avatarType),
                        type: "NOVICE",

                        // giveTypeItsType: giveTypeItsType,
                        pressed: marketAvatarType == "NOVICE",
                        widthRatio: marketAvatarType == "NOVICE"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                        price: AvatarPrices.novice,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, 0.05),
                      child: AvatarButtonMarket(
                        triggerFunction: onChangeMarket,
                        imagePath: getBeginnerAvatarPath(type: avatarType),
                        type: "BEGINNER",
                        // giveTypeItsType: giveTypeItsType,
                        pressed: marketAvatarType == "BEGINNER",
                        widthRatio: marketAvatarType == "BEGINNER"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                        price: AvatarPrices.beginner,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.93, 0.05),
                      child: AvatarButtonMarket(
                        triggerFunction: onChangeMarket,
                        imagePath: getCompetentAvatarPath(type: avatarType),
                        type: "COMPETENT",
                        // giveTypeItsType: giveTypeItsType,
                        pressed: marketAvatarType == "COMPETENT",
                        widthRatio: marketAvatarType == "COMPETENT"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                        price: AvatarPrices.competent,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(-0.93, 0.4),
                      child: AvatarButtonMarket(
                        triggerFunction: onChangeMarket,
                        imagePath: getProficientAvatarPath(type: avatarType),
                        type: "PROFICIENT",
                        // giveTypeItsType: giveTypeItsType,
                        pressed: marketAvatarType == "PROFICIENT",
                        widthRatio: marketAvatarType == "PROFICIENT"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                        price: AvatarPrices.proficient,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, 0.4),
                      child: AvatarButtonMarket(
                        triggerFunction: onChangeMarket,
                        imagePath: getExpertAvatarPath(type: avatarType),
                        type: "EXPERT",
                        // giveTypeItsType: giveTypeItsType,
                        pressed: marketAvatarType == "EXPERT",
                        widthRatio: marketAvatarType == "EXPERT"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                        price: AvatarPrices.expert,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.93, 0.4),
                      child: AvatarButtonMarket(
                        triggerFunction: onChangeMarket,
                        imagePath: getMasterAvatarPath(type: avatarType),
                        type: "MASTER",
                        // giveTypeItsType: giveTypeItsType,
                        pressed: marketAvatarType == "MASTER",
                        widthRatio: marketAvatarType == "MASTER"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                        price: AvatarPrices.master,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, 0.8),
                      child: AvatarButtonMarket(
                        triggerFunction: onChangeMarket,
                        imagePath: getUnimaginedAvatarPath(type: avatarType),
                        type: "UNIMAGINED",
                        // giveTypeItsType: giveTypeItsType,
                        pressed: marketAvatarType == "UNIMAGINED",
                        widthRatio: marketAvatarType == "UNIMAGINED"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                        price: AvatarPrices.unimagined,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: avatarType == "unchosen" ? 1 : 0,
              duration: const Duration(milliseconds: 1000),
              // curve: Curves.bounceOut,
              child: Visibility(
                visible: avatarType == "unchosen",
                child: Stack(
                  children: [
                    Align(
                      alignment: const Alignment(-0.9, 0),
                      child: AvatarButtonMarketPlaceHolder(
                        triggerFunction: onChangePlaceHolder,
                        imagePath: AppPaths.questionMark,
                        type: "unchosen_1",
                        // giveTypeItsType: giveTypeItsType,
                        pressed: placeHolderType == "unchosen_1",
                        widthRatio: placeHolderType == "unchosen_1"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, 0),
                      child: AvatarButtonMarketPlaceHolder(
                        triggerFunction: onChangePlaceHolder,
                        imagePath: AppPaths.questionMark,
                        type: "unchosen_2",
                        // giveTypeItsType: giveTypeItsType,
                        pressed: placeHolderType == "unchosen_2",
                        widthRatio: placeHolderType == "unchosen_2"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.9, 0),
                      child: AvatarButtonMarketPlaceHolder(
                        triggerFunction: onChangePlaceHolder,
                        imagePath: AppPaths.questionMark,
                        type: "unchosen_3",
                        // giveTypeItsType: giveTypeItsType,
                        pressed: placeHolderType == "unchosen_3",
                        widthRatio: placeHolderType == "unchosen_3"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(-0.9, 0.4),
                      child: AvatarButtonMarketPlaceHolder(
                        triggerFunction: onChangePlaceHolder,
                        imagePath: AppPaths.questionMark,
                        type: "unchosen_7",
                        // giveTypeItsType: giveTypeItsType,
                        pressed: placeHolderType == "unchosen_7",
                        widthRatio: placeHolderType == "unchosen_7"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, 0.4),
                      child: AvatarButtonMarketPlaceHolder(
                        triggerFunction: onChangePlaceHolder,
                        imagePath: AppPaths.questionMark,
                        type: "unchosen_4",
                        // giveTypeItsType: giveTypeItsType,
                        pressed: placeHolderType == "unchosen_4",
                        widthRatio: placeHolderType == "unchosen_4"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.9, 0.4),
                      child: AvatarButtonMarketPlaceHolder(
                        triggerFunction: onChangePlaceHolder,
                        imagePath: AppPaths.questionMark,
                        type: "unchosen_5",
                        // giveTypeItsType: giveTypeItsType,
                        pressed: placeHolderType == "unchosen_5",
                        widthRatio: placeHolderType == "unchosen_5"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, 0.8),
                      child: AvatarButtonMarketPlaceHolder(
                        triggerFunction: onChangePlaceHolder,
                        imagePath: AppPaths.questionMark,
                        type: "unchosen_6",
                        // giveTypeItsType: giveTypeItsType,
                        pressed: placeHolderType == "unchosen_6",
                        widthRatio: placeHolderType == "unchosen_6"
                            ? onPressedMarketWidthRatio
                            : smallMarketWidthRatio,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
    );
  }

  String getNoviceAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.noviceLION;
    } else if (type == "OWL") {
      return AppPaths.noviceOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.noviceDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.noviceDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.noviceBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.noviceELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }

  String getBeginnerAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.beginnerLION;
    } else if (type == "OWL") {
      return AppPaths.beginnerOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.beginnerDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.beginnerDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.beginnerBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.beginnerELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }

  String getCompetentAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.competentLION;
    } else if (type == "OWL") {
      return AppPaths.competentOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.competentDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.competentDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.competentBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.competentELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }

  String getProficientAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.proficientLION;
    } else if (type == "OWL") {
      return AppPaths.proficientOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.proficientDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.proficientDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.proficientBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.proficientELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }

  String getExpertAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.expertLION;
    } else if (type == "OWL") {
      return AppPaths.expertOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.expertDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.expertDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.expertBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.expertELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }

  String getMasterAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.masterLION;
    } else if (type == "OWL") {
      return AppPaths.masterOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.masterDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.masterDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.masterBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.masterELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }

  String getUnimaginedAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.unimaginedLION;
    } else if (type == "OWL") {
      return AppPaths.unimaginedOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.unimaginedDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.unimaginedDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.unimaginedBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.unimaginedELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }
}
