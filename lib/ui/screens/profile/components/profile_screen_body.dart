import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/cubit/shuffle/shuffle_cubit.dart';
import 'package:cevapp/data/user_ranks.dart';
import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text_field.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text_without_auto_sizing.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_avatar.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_text_field_general_use.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({Key? key}) : super(key: key);

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  String userAvatarImagePath = AppPaths.sternLookingOwl;
  String userRank = "Novice";
  final TextEditingController nameC = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUserAvatarAndRank();
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint("CHANGING USER AVATAR IMAGE");
                  setState(() {
                    userAvatarImagePath;
                  });
                },
                child: CustomNeumorphicAvatar(
                    text: "STERN LOOKING OWL",
                    useImage: userAvatarImagePath,
                    neumorphicBoxShape:
                        NeumorphicBoxShape.beveled(BorderRadius.circular(50)),
                    widthRatio: 0.478,
                    heightRatio: 0.29),
              ),
              Column(
                children: [
                  CustomText(
                    text: userRank,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    italicEnable: false,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  CustomGeneralUseNeumorphicTextField(
                    text: "Mehmet Semih",
                    neumorphicBoxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                    widthRatio: 0.4,
                    heightRatio: 0.05,
                    fontWeight: FontWeight.bold,
                    italicEnable: false,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  CustomGeneralUseNeumorphicTextField(
                    text: "BABACAN",
                    neumorphicBoxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                    widthRatio: 0.4,
                    heightRatio: 0.05,
                    fontWeight: FontWeight.bold,
                    italicEnable: false,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
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
                      CustomGeneralUseNeumorphicTextField(
                          text:
                              "${context.read<ShuffleCubit>().shuffledQuestions.length}",
                          neumorphicBoxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(5)),
                          widthRatio: 0.3,
                          heightRatio: 0.1,
                          italicEnable: false,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          leftPadding: 10,
                          bottomPadding: 10),
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
                      CustomGeneralUseNeumorphicTextField(
                          text:
                              "${context.read<RecordsCubit>().currentLengthOfRecords}",
                          neumorphicBoxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(5)),
                          widthRatio: 0.3,
                          heightRatio: 0.1,
                          italicEnable: false,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          leftPadding: 10,
                          bottomPadding: 10),
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
                      CustomGeneralUseNeumorphicTextField(
                          text:
                              "${context.read<ShuffleCubit>().recordedQuestions.length}",
                          neumorphicBoxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(5)),
                          widthRatio: 0.3,
                          heightRatio: 0.1,
                          italicEnable: false,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          leftPadding: 10,
                          bottomPadding: 10),
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
                      CustomGeneralUseNeumorphicTextField(
                          text:
                              "${context.read<ShuffleCubit>().deletedQuestions.length}",
                          neumorphicBoxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(5)),
                          widthRatio: 0.3,
                          heightRatio: 0.1,
                          italicEnable: false,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          leftPadding: 10,
                          bottomPadding: 10),
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

    if (userRecordedQuestions >= userRankLevels.unimagined) {
      setState(() {
        userAvatarImagePath = userRanksObject["unimagined"]!.avatarPath;
        userRank = userRanksObject["unimagined"]!.rank;
      });
    } else if (userRecordedQuestions >= userRankLevels.master) {
      setState(() {
        userAvatarImagePath = userRanksObject["master"]!.avatarPath;
        userRank = userRanksObject["master"]!.rank;
      });
    } else if (userRecordedQuestions >= userRankLevels.expert) {
      setState(() {
        userAvatarImagePath = userRanksObject["expert"]!.avatarPath;
        userRank = userRanksObject["expert"]!.rank;
      });
    } else if (userRecordedQuestions >= userRankLevels.proficient) {
      setState(() {
        userAvatarImagePath = userRanksObject["proficient"]!.avatarPath;
        userRank = userRanksObject["proficient"]!.rank;
      });
    } else if (userRecordedQuestions >= userRankLevels.competent) {
      setState(() {
        userAvatarImagePath = userRanksObject["competent"]!.avatarPath;
        userRank = userRanksObject["competent"]!.rank;
      });
    } else if (userRecordedQuestions >= userRankLevels.beginner) {
      setState(() {
        userAvatarImagePath = userRanksObject["beginner"]!.avatarPath;
        userRank = userRanksObject["beginner"]!.rank;
      });
    } else if (userRecordedQuestions >= userRankLevels.novice) {
      setState(() {
        userAvatarImagePath = userRanksObject["novice"]!.avatarPath;
        userRank = userRanksObject["novice"]!.rank;
      });
    }
  }
}
