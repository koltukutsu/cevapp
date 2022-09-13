import 'dart:io';
import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/navigation/route_page.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:cevapp/ui/widgets/molecules/buttons_during_record.dart';
import 'package:cevapp/ui/widgets/molecules/buttons_section.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_market_button.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MainScreenBody extends StatefulWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

class QuestionLevel {
  final int id;
  final String name;

  QuestionLevel({
    required this.id,
    required this.name,
  });
}

class QuestionCategory {
  final int id;
  final String name;

  QuestionCategory({
    required this.id,
    required this.name,
  });
}

class _MainScreenBodyState extends State<MainScreenBody> {
  static List<QuestionLevel> questionLevels = [
    QuestionLevel(id: 1, name: "Beginner"),
    QuestionLevel(id: 2, name: "Intermediate"),
    QuestionLevel(id: 3, name: "Upper-Intermediate"),
    QuestionLevel(id: 4, name: "Advanced"),
    QuestionLevel(id: 5, name: "Fluent"),
    QuestionLevel(id: 6, name: "Native-Like"),
  ];
  static List<QuestionCategory> questionCategories = [
    QuestionCategory(id: 1, name: "Literature"),
    QuestionCategory(id: 2, name: "Philosophy"),
    QuestionCategory(id: 3, name: "Trivial"),
    QuestionCategory(id: 4, name: "Politics"),
    QuestionCategory(id: 5, name: "Life"),
    QuestionCategory(id: 6, name: "Health"),
    QuestionCategory(id: 7, name: "Technology"),
    QuestionCategory(id: 8, name: "Books"),
    QuestionCategory(id: 9, name: "Authors"),
    QuestionCategory(id: 10, name: "History"),
  ];

  final itemsLevels = questionLevels
      .map(
          (question) => MultiSelectItem<QuestionLevel>(question, question.name))
      .toList();
  final itemsCategories = questionCategories
      .map((question) =>
          MultiSelectItem<QuestionCategory>(question, question.name))
      .toList();

  //List<Animal> _selectedAnimals = [];
  List<Object> selectedQuestionLevels = questionLevels.sublist(0);
  List<Object> selectedQuestionCategories = questionCategories.sublist(0);
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;
  final recorder = FlutterSoundRecorder();

  // late final status;
  var stateOfRecorder = 0;
  var path = "temp.aac";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // status = Permission.microphone.request();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (recorder != null) {
      recorder.closeRecorder();
      // recorder = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainBackgroundColor,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
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
                        Navigator.of(context).push(createPageRoute(
                            pageRouteType: PageRouteTypes.fromMainToMarket));
                      }),
                  CustomNeumorphicButton(
                      imagePath: AppPaths.profilePath,
                      width: 41,
                      height: 41,
                      function: () {
                        Navigator.of(context).push(createPageRoute(
                            pageRouteType: PageRouteTypes.fromMainToProfile));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const ProfileScreen()));
                      }),
                ],
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          const CustomText(
            text: "cevapp",
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            fontSize: 102,
            textColor: AppColors.white,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MultiSelectBottomSheetField(
                // reverse: true,
                initialChildSize: 0.4,
                listType: MultiSelectListType.CHIP,
                searchable: true,
                buttonText: const Text(
                  "Choose Categories",
                  style: TextStyle(color: AppColors.black),
                ),
                title: const Text("Question Categories",
                    style: TextStyle(color: AppColors.black)),
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                items: itemsCategories,
                initialValue: questionCategories,
                onConfirm: (values) {
                  print(values);
                  selectedQuestionCategories = values as List<Object>;
                  print(selectedQuestionCategories);
                },
                selectedColor: AppColors.rightSwipeDockColor,
                buttonIcon:
                    const Icon(Icons.menu_sharp, color: AppColors.black),
                selectedItemsTextStyle: const TextStyle(color: AppColors.black),
                chipDisplay: MultiSelectChipDisplay.none(),

                // chipDisplay: MultiSelectChipDisplay(
                //   onTap: (value) {
                //     setState(() {
                //       selectedQuestionCategories.remove(value);
                //     });
                //   },
                // ),
              ),
              // selectedQuestionLevels == null || selectedQuestionLevels.isEmpty
              //     ? Container(
              //         padding: EdgeInsets.all(10),
              //         alignment: Alignment.centerLeft,
              //         child: const Text(
              //           "None selected",
              //           style: TextStyle(color: Colors.black54),
              //         ))
              //     : Container(),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              MultiSelectBottomSheetField(
                initialChildSize: 0.4,

                buttonIcon:
                    const Icon(Icons.menu_sharp, color: AppColors.black),
                listType: MultiSelectListType.CHIP,
                searchable: true,
                buttonText: const Text(
                  "Choose Levels",
                  style: TextStyle(color: AppColors.black),
                ),
                title: const Text(
                  "Question Levels",
                  style: TextStyle(color: AppColors.black),
                ),
                items: itemsLevels,
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                initialValue: questionLevels,
                onConfirm: (values) {
                  selectedQuestionLevels = values as List<Object>;
                },
                selectedColor: AppColors.rightSwipeDockColor,
                selectedItemsTextStyle: const TextStyle(color: AppColors.black),
                chipDisplay: MultiSelectChipDisplay.none(),
                // chipDisplay: MultiSelectChipDisplay(
                //   onTap: (value) {
                //     setState(() {
                //       selectedQuestionLevels.remove(value);
                //     });
                //   },
                // ),
              ),
              // selectedQuestionLevels == null || selectedQuestionLevels.isEmpty
              //     ? Container(
              //     padding: EdgeInsets.all(10),
              //     alignment: Alignment.centerLeft,
              //     child: const Text(
              //       "None selected",
              //       style: TextStyle(color: Colors.black54),
              //     ))
              //     : Container(),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const CustomNeumorphicTextField(),
          // recording time live
          // TextButton(
          //     onPressed: () {
          //       final String = saveProcess(id: "12313");
          //     },
          //     child: CustomText(text: "DENEME")),
          StreamBuilder<RecordingDisposition>(
              stream: recorder.onProgress,
              builder: (contextSecond, snapshot) {
                final duration =
                    snapshot.hasData ? snapshot.data!.duration : Duration.zero;
                final int minutes = duration.inSeconds ~/ 60;
                final int seconds = duration.inSeconds % 60;
                debugPrint(duration.toString());

                context
                    .read<RecordsCubit>()
                    .setCurrentRecordingTime(time: duration.inSeconds);

                return AnimatedCrossFade(
                  crossFadeState: _crossFadeState,
                  duration: const Duration(milliseconds: 300),
                  firstCurve: Curves.easeIn,
                  secondCurve: Curves.easeOut,
                  firstChild: ButtonsSection(
                      recordFunction: onSoundProcesses,
                      crossFadeStateChangerFunction:
                          onChangedButtonChangeCrossFadeState),
                  secondChild: ButtonsDuringRecord(
                      recordFunction: onSoundProcesses,
                      crossFadeStateChangerFunction:
                          onChangedButtonChangeCrossFadeState,
                      takenTime:
                          "${minutes < 10 ? '0$minutes' : '$minutes'}:${seconds < 10 ? '0$seconds' : '$seconds'}"),
                );
              }),
        ],
      ),
    );
  }

  void onChangedButtonChangeCrossFadeState(bool isRecordPressed) {
    if (isRecordPressed) {
      setState(() {
        _crossFadeState = CrossFadeState.showSecond;
      });
    } else {
      setState(() {
        _crossFadeState = CrossFadeState.showFirst;
      });
    }
  }

  // sound related functions
  Future<void> onSoundProcesses(String mode, {String? id}) async {
    PermissionStatus status = await Permission.microphone.request();

    if (status == PermissionStatus.granted) {
      if (stateOfRecorder == 0) {
        await recorder.openRecorder();
        recorder.setSubscriptionDuration(const Duration(milliseconds: 100));
        stateOfRecorder = 1;
      }
      // start
      if (mode == "start") {
        path = id!; // TODO: control
        final String externalPath = await saveProcess(id: id);
        if (externalPath.isEmpty) {
          // _showDialogSuccess(context, , text)
        } else {
          recorder.startRecorder(
              toFile: "$externalPath.aac", codec: Codec.aacMP4);
          setState(() {
            recorder;
          });
        }
      }
      // stop succesfully
      else if (mode == "finish" && recorder.isRecording) {
        final pathFinished = await recorder.stopRecorder();
        // TODO: take it inside
        stateOfRecorder = 0;
        setState(() {});
        // final audioFile = File(pathFinished!);
      }
      // pause
      else if (mode == "pause" && recorder.isRecording) {
        // recorder.pauseRecorder();
      }
      // continue
      else if (mode == "continue" && recorder.isPaused == true) {
        // recorder.resumeRecorder();
      }
      // remove
      else if (mode == "delete" && recorder.isRecording) {
        // recorder.stopRecorder();
        stateOfRecorder = 0;
        recorder.deleteRecord(fileName: path);
        recorder.closeRecorder();
      }
    } else {
      throw 'Microphone Permission is not granted';
    }
  }

  Future<String> saveProcess({required String id}) async {
    Directory? directory = await getExternalStorageDirectory();
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
        } else {
          _showDialogSuccess(context, AppColors.magenta,
              "You didn't grant Storage Permission");
          return "";
        }
      } else {
        if (await _requestPermission(Permission.storage)) {
          directory =
              await getTemporaryDirectory(); // IOS await getApplicationSupportDirectory()
        } else {
          _showDialogSuccess(context, AppColors.magenta,
              "You didn't grant Storage Permission");
          return "";
        }
      }
      directory = Directory("${directory!.path}/recordedAudios/");
      if (!await directory.exists()) {
        print("directory exists: ${await directory.exists()}");
        await directory.create(recursive: true);
        print("created directory: ${directory.path}$id");
        final String fileName = "${directory.path}$id";
        return fileName;
      } else {
        print("${directory.path}$id");
        final String fileName = "${directory.path}$id";
        return fileName;
      }
    } catch (e) {
      print(e);
      // return false;
      _showDialogSuccess(context, AppColors.magenta,
          "The Audio file couldn't be created properly!");
      return "";
    }
  }
}

Future<bool> _requestPermission(Permission permission) async {
  if (await permission.isGranted) {
    print(await permission.status);
    print(await permission.isGranted);

    return true;
  } else {
    var result = await permission.request();
    if (result == PermissionStatus.granted) {
      return true;
    }
  }
  print(await permission.status);
  return false;
}

_showDialogSuccess(BuildContext context, Color color, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: AppColors.white,
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        Icon(
          Icons.verified,
          color: color,
        ),
        const SizedBox(
          width: 25,
        ),
        Text(text, style: const TextStyle(color: AppColors.leftSwipeDockColor)),
      ],
    ),
  ));
}
