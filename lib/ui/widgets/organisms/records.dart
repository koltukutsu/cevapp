import 'dart:io';

import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/cubit/shuffle/shuffle_cubit.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_column_linear_gradient_filled.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/molecules/record_row.dart';
import 'package:cevapp/ui/widgets/molecules/record_row_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({Key? key}) : super(key: key);

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(right: 2, left: 2),
      decoration: const BoxDecoration(
          // color: AppColors.swipeDockColor,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: <Color>[
              AppColors.leftSwipeDockColor,
              AppColors.rightSwipeDockColor,
            ],
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(60))),
      // height: MediaQuery.of(context).size.height *
      //     AppRatios.swipdeDockFullHeightRatio,
      child: BlocBuilder<RecordsCubit, RecordsState>(
        builder: (context, state) {
          if (state is GetRecords) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: CustomColumnLinearGradientFilled(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      (AppRatios
                          .swipeDockHeightRatioBetweenListOfQuestionsAndHorizontalBar),
                ),
                if (state.recordPathsAsFileList.isNotEmpty &&
                    context.read<ShuffleCubit>().recordedQuestions.isNotEmpty)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.625,
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        itemCount: state.recordPathsAsFileList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => RecordRow(
                            index: index.toString(),
                            path: state.recordPathsAsFileList[index],
                            question: context
                                .read<ShuffleCubit>()
                                .recordedQuestions
                                .firstWhere((element) {
                              // debugPrint("\nCONTROL - $index");
                              // debugPrint(
                              //     "coming from recordedQuestions: ${element.toString()}");
                              // debugPrint("state: ${state.recordPathsAsFileList}");

                              final File indexFile =
                                  state.recordPathsAsFileList[index];
                              final String indexFilePath = indexFile.path;

                              // debugPrint("state path indexed: $indexFile");
                              // debugPrint("index file Path: $indexFilePath");

                              final List<String> splittedIndexFilePath =
                                  indexFilePath.split("/");

                              // debugPrint(
                              //     "splitted Index File Path: $splittedIndexFilePath");

                              final String lastOfIt =
                                  splittedIndexFilePath.last;

                              // debugPrint("last of the splitted list: $lastOfIt");

                              final String replacedAndFinalUUid =
                                  lastOfIt.replaceFirst(".aac", "");

                              // debugPrint(
                              //     "final UUid from file directory: $replacedAndFinalUUid");
                              // debugPrint(
                              //     "uuid from the questionsRecord: ${element['id']}");
                              //
                              final bool theCondition =
                                  element["id"] == replacedAndFinalUUid;

                              debugPrint(
                                  "and finally the RESULT: $theCondition");
                              return theCondition;
                            })["question"]),
                      ),
                    ),
                  )
                else
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            AppRatios.swipeDockMiddleTextPosition),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CustomText(
                          text: "nothing",
                          textColor: AppColors.white,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 52,
                        ),
                        CustomText(
                          text: "said",
                          textColor: AppColors.white,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 152,
                        ),
                        CustomText(
                          text: "yet",
                          textColor: AppColors.white,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 82,
                        ),
                      ],
                    ),
                  )
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: CustomColumnLinearGradientFilled(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomText(
                      text: "no",
                      textColor: AppColors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 82,
                    ),
                    CustomText(
                      text: "record",
                      textColor: AppColors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 82,
                    ),
                  ],
                )
              ],
            );
          }
        },
        // child: ,
      ),
    );
  }
}
