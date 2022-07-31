import 'dart:io';

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
  var status;
  var isRecorderAvailable = false;

  @override
  Future<void> initState() async {
    // TODO: implement initState
    super.initState();
    // status = await Permission.microphone.request();
    // if (status != PermissionStatus.granted) {
    //   throw 'Microphone permission is not granted!'; // TODO: need to use something like something
    // } else {
    //   await recorder.openRecorder();
    //   recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
    //   isRecorderAvailable = true;
    // }
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

  Future<void> onSoundProcesses(String mode) async {
    if (isRecorderAvailable) {
      if (mode == "start_record") {
        recorder.startRecorder(toFile: "audio");
      } else if (mode == "stop_record_successfully" && recorder.isRecording) {
        final path = await recorder.stopRecorder();
        final audioFile = File(path!);
        print("Recorder audio: $audioFile");
      } else if (mode == "pause_record" && recorder.isRecording) {
        recorder.pauseRecorder();
      } else if (mode == "continue_record" && recorder.isPaused == true) {
        recorder.resumeRecorder();
      } else if (mode == "give_up_record" && recorder.isRecording) {
        recorder.closeRecorder();
      }
    } else {}
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
                  imagePath: "assets/images/user.png",
                  width: 41,
                  height: 41,
                  function: () {})),
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
          AnimatedCrossFade(
            crossFadeState: _crossFadeState,
            duration: const Duration(milliseconds: 250),
            firstCurve: Curves.easeOut,
            secondCurve: Curves.easeIn,
            firstChild: ButtonsSection(
                onSoundProcesses: onSoundProcesses,
                crossFadeStateChangerFunction:
                    onChangedButtonChangeCrossFadeState),
            secondChild: Column(
              children: [
                // recorder duration
                StreamBuilder<RecordingDisposition>(
                    stream: recorder.onProgress,
                    builder: (context, snapshot) {
                      final duration = snapshot.hasData
                          ? snapshot.data!.duration
                          : Duration.zero;
                      // String twoDigits(int n) => n.toString().padLeft(twoDigitMinutes =
                      // twoDigits(duration.inMinutes.remainder(60)));

                      return CustomText(text: "${duration.inSeconds} s");
                    }),
                ButtonsDuringRecord(
                    onSoundProcesses: onSoundProcesses,
                    crossFadeStateChangerFunction:
                        onChangedButtonChangeCrossFadeState),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
