import 'dart:io';

import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/cubit/shuffle/shuffle_cubit.dart';
import 'package:cevapp/ui/constants/icons.dart';
import 'package:cevapp/ui/navigation/navigation_names.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:cevapp/ui/widgets/molecules/buttons_during_record.dart';
import 'package:cevapp/ui/widgets/molecules/buttons_section.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class MainScreenBody extends StatefulWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;
  final recorder = FlutterSoundRecorder();

  // late final status;
  var stateOfRecorder = 0;
  var path = "temp.aac";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RecordsCubit>().GetCurrentRecords();
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
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.1,
          // ),
          Align(
              alignment: Alignment.topRight,
              child: CustomNeumorphicButton(
                  imagePath: AppPaths.userPath,
                  width: 41,
                  height: 41,
                  function: () {
                    Navigator.of(context).pushNamed(ROUTE_PROFILE_SCREEN);
                  })),
          const CustomText(
            text: "cevapp",
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            fontSize: 82,
            textColor: AppColors.white,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          const CustomNeumorphicTextField(),
          // recording time live
          StreamBuilder<RecordingDisposition>(
              stream: recorder.onProgress,
              builder: (context, snapshot) {
                final duration =
                    snapshot.hasData ? snapshot.data!.duration : Duration.zero;
                final int minutes = duration.inSeconds ~/ 60;
                final int seconds = duration.inSeconds % 60;
                debugPrint(duration.toString());
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
  Future<void> onSoundProcesses(String mode) async {
    PermissionStatus status = await Permission.microphone.request();

    if (status == PermissionStatus.granted) {
      if (stateOfRecorder == 0) {
        await recorder.openRecorder();
        recorder.setSubscriptionDuration(const Duration(milliseconds: 100));
        stateOfRecorder = 1;
      }
      // start
      if (mode == "start") {
        var now = DateTime.now();
        final DateTime nowCurrentDate = DateTime.parse(now.toString());
        final String formattedDate =
            nowCurrentDate.toString(); // TODO: can be changed
        context.read<ShuffleCubit>().recordedQuestions.addAll({
          formattedDate: await context.read<ShuffleCubit>().shuffledQuestion
        });
        path = formattedDate;
        // record start & create file
        recorder.startRecorder(toFile: "$path.aac", codec: Codec.aacMP4);
        setState(() {
          recorder;
        });
      }
      // stop succesfully
      else if (mode == "finish" && recorder.isRecording) {
        final pathFinished = await recorder.stopRecorder();
        stateOfRecorder = 0;
        print("it's finished");
        final audioFile = File(pathFinished!);
        print("Recorder audio: $audioFile");
        print(pathFinished
            .split("/")
            .sublist(0, pathFinished.split("/").length - 1)
            .join("/"));
        // final dir = Directory(pathFinished
        //     .split("/")
        //     .sublist(0, pathFinished.split("/").length - 1)
        //     .join("/"));
        // final List<FileSystemEntity> entities = await dir.list().toList();
        // print(entities);
        // recorder.closeRecorder();
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
}


_showDialogSuccess(BuildContext context, Color color, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Container(
          child: Row(
            children: [
              Icon(
                Icons.verified,
                color: color,
              ),
              SizedBox(
                width: 25,
              ),
              Text(text),
            ],
          ))));
}