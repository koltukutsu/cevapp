import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/cubit/shuffle/shuffle_cubit.dart';
import 'package:cevapp/data/user_ranks.dart';
import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/navigation/navigation_names.dart';
import 'package:cevapp/ui/navigation/route_page.dart';
import 'package:cevapp/ui/screens/market/market_screen.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_avatar.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_market_button.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_text_field_general_use.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({Key? key}) : super(key: key);

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  String userAvatarImagePath = AppPaths.sternLookingOwl;
  String userRank = "Novice";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUserAvatarAndRank();
    nameController.text = context.read<AvatarCubit>().avatarName;
    surnameController.text = context.read<AvatarCubit>().avatarSurname;
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    super.dispose();
  }

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
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomNeumorphicMarketButton(
                      imagePath: AppPaths.market,
                      width: 41,
                      height: 41,
                      function: () {
                        // Navigator.of(context).pop();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const MarketScreen()));
                        Navigator.of(context).push(createPageRoute(pageRouteType:PageRouteTypes.fromProfileToMarket));
                        // Navigator.of(context).pushNamed(ROUTE_MARKET);
                      }),
                  CustomNeumorphicButton(
                      imagePath: AppPaths.homePath,
                      width: 41,
                      height: 41,
                      function: () {
                        Navigator.of(context).pop();
                      }),
                ],
              )),
          CustomText(
            text: userRank,
            fontSize: 70,
            fontWeight: FontWeight.bold,
            italicEnable: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint("CHANGING USER AVATAR IMAGE");
                  setState(() {
                    userAvatarImagePath;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CustomNeumorphicAvatar(
                      text: "STERN LOOKING OWL",
                      useImage: userAvatarImagePath,
                      neumorphicBoxShape:
                          NeumorphicBoxShape.beveled(BorderRadius.circular(50)),
                      widthRatio: 0.52,
                      heightRatio: 0.29),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  // CustomTextFieldNeumorphicForAvatarPage(
                  //     controller: nameController,
                  //     labelFontFamily: "Roboto",
                  //     labelFontWeight: FontWeight.bold,
                  //     labelColor: AppColors.black,
                  //     labelFontSize: 15,
                  //     height: 1),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.015,
                  // ),
                  // CustomTextFieldNeumorphicForAvatarPage(
                  //     controller: surnameController,
                  //     labelFontFamily: "Roboto",
                  //     labelFontWeight: FontWeight.bold,
                  //     labelColor: AppColors.black,
                  //     labelFontSize: 15,
                  //     height: 1),
                  Builder(
                    builder: (context) =>
                        CustomGeneralUseNeumorphicTextField(
                      text: context.watch<AvatarCubit>().avatarName,
                      neumorphicBoxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(5)),
                      widthRatio: 0.4,
                      heightRatio: 0.05,
                      fontWeight: FontWeight.bold,
                      italicEnable: false,
                      leftPadding: 10,
                      bottomPadding: 0,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Builder(
                    builder: (context) =>
                        CustomGeneralUseNeumorphicTextField(
                      text: context.watch<AvatarCubit>().avatarSurname,
                      neumorphicBoxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(5)),
                      widthRatio: 0.4,
                      heightRatio: 0.05,
                      fontWeight: FontWeight.bold,
                      italicEnable: false,
                      leftPadding: 10,
                      bottomPadding: 0,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.075, //0.045 // 0.075
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(width: MediaQuery.of(context).size.width * 0.2,),
                  Column(
                    children: [
                      const CustomText(
                          text: "Shuffled",
                          textColor: AppColors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          italicEnable: false),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Builder(
                        builder: (context) =>
                            CustomGeneralUseNeumorphicTextField(
                                text:
                                    "${context.watch<ShuffleCubit>().shuffledQuestions.length}",
                                neumorphicBoxShape:
                                    NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(5)),
                                widthRatio: 0.3,
                                heightRatio: 0.1,
                                italicEnable: false,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                leftPadding: 10,
                                bottomPadding: 10),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Column(
                    children: [
                      const CustomText(
                          text: "Records",
                          textColor: AppColors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          italicEnable: false),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Builder(
                        builder: (context) =>
                            CustomGeneralUseNeumorphicTextField(
                                text:
                                    "${context.watch<RecordsCubit>().currentLengthOfRecords}",
                                neumorphicBoxShape:
                                    NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(5)),
                                widthRatio: 0.3,
                                heightRatio: 0.1,
                                italicEnable: false,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                leftPadding: 10,
                                bottomPadding: 10),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const CustomText(
                          text: "Recorded",
                          textColor: AppColors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          italicEnable: false),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Builder(
                        builder: (context) =>
                            CustomGeneralUseNeumorphicTextField(
                                text:
                                    "${context.watch<ShuffleCubit>().recordedQuestions.length}",
                                neumorphicBoxShape:
                                    NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(5)),
                                widthRatio: 0.3,
                                heightRatio: 0.1,
                                italicEnable: false,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                leftPadding: 10,
                                bottomPadding: 10),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Column(
                    children: [
                      const CustomText(
                          text: "Deleted",
                          textColor: AppColors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          italicEnable: false),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Builder(
                        builder: (context) =>
                            CustomGeneralUseNeumorphicTextField(
                                text:
                                    "${context.watch<ShuffleCubit>().deletedQuestions.length}",
                                neumorphicBoxShape:
                                    NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(5)),
                                widthRatio: 0.3,
                                heightRatio: 0.1,
                                italicEnable: false,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                leftPadding: 10,
                                bottomPadding: 10),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  void setUserAvatarAndRank() {
    final int userRecordedQuestions =
        context.read<ShuffleCubit>().recordedQuestions.length;
    final String userAvatarChoice = context.read<AvatarCubit>().avatarType;
    // print("set user avatar and rank");
    // print(userAvatarChoice);
    // print(userRecordedQuestions);

    if (userRecordedQuestions >= UserRankLevels.unimagined) {
      setState(() {
        userAvatarImagePath =
            userRanksObject["unimagined$userAvatarChoice"]!.avatarPath;
        userRank = userRanksObject["unimagined$userAvatarChoice"]!.rank;
      });
    } else if (userRecordedQuestions >= UserRankLevels.master) {
      setState(() {
        userAvatarImagePath =
            userRanksObject["master$userAvatarChoice"]!.avatarPath;
        userRank = userRanksObject["master$userAvatarChoice"]!.rank;
      });
    } else if (userRecordedQuestions >= UserRankLevels.expert) {
      setState(() {
        userAvatarImagePath =
            userRanksObject["expert$userAvatarChoice"]!.avatarPath;
        userRank = userRanksObject["expert$userAvatarChoice"]!.rank;
      });
    } else if (userRecordedQuestions >= UserRankLevels.proficient) {
      setState(() {
        userAvatarImagePath =
            userRanksObject["proficient$userAvatarChoice"]!.avatarPath;
        userRank = userRanksObject["proficient$userAvatarChoice"]!.rank;
      });
    } else if (userRecordedQuestions >= UserRankLevels.competent) {
      setState(() {
        userAvatarImagePath =
            userRanksObject["competent$userAvatarChoice"]!.avatarPath;
        userRank = userRanksObject["competent$userAvatarChoice"]!.rank;
      });
    } else if (userRecordedQuestions >= UserRankLevels.beginner) {
      setState(() {
        userAvatarImagePath =
            userRanksObject["beginner$userAvatarChoice"]!.avatarPath;
        userRank = userRanksObject["beginner$userAvatarChoice"]!.rank;
      });
    } else if (userRecordedQuestions >= UserRankLevels.novice) {
      // print("state control");
      // print("novice$userAvatarChoice");
      setState(() {
        userAvatarImagePath =
            userRanksObject["novice$userAvatarChoice"]!.avatarPath;
        userRank = userRanksObject["novice$userAvatarChoice"]!.rank;
      });
    }
  }
}
