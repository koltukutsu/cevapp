import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/navigation/navigation_names.dart';
import 'package:cevapp/ui/screens/profile/profile_screen.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:cevapp/ui/widgets/molecules/buttons_during_record.dart';
import 'package:cevapp/ui/widgets/molecules/buttons_section.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_text_field.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_sound/flutter_sound.dart';
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
                  imagePath: AppPaths.profilePath,
                  width: 41,
                  height: 41,
                  function: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const ProfileScreen()));
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

        recorder.startRecorder(toFile: "$path.aac", codec: Codec.aacMP4);
        setState(() {
          recorder;
        });
      }
      // stop succesfully
      else if (mode == "finish" && recorder.isRecording) {
        final pathFinished = await recorder.stopRecorder();
        // TODO: take it inside
        stateOfRecorder = 0;
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
}

_showDialogSuccess(BuildContext context, Color color, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
    children: [
      Icon(
        Icons.verified,
        color: color,
      ),
      const SizedBox(
        width: 25,
      ),
      Text(text),
    ],
  )));
}
