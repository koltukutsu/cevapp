import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/cubit/shuffle/shuffle_cubit.dart';
import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_button.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordRowNew extends StatefulWidget {
  final String index;
  final File path;
  final String question;

  const RecordRowNew(
      {Key? key,
      required this.index,
      required this.path,
      required this.question})
      : super(key: key);

  @override
  State<RecordRowNew> createState() => _RecordRowNewState();
}

class _RecordRowNewState extends State<RecordRowNew> {
  final audioPlayer = AudioPlayer();
  final int limitQuestion = 50;
  final int limitQuestionSubString = 53;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  late var _tapPosition;

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onDurationChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future<void> setAudio() async {
    // repeat the song when completed
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    debugPrint("what is this: ${widget.path}");
    audioPlayer.setSourceDeviceFile(widget.path.path);
    // audioPlayer.setSourceAsset(widget.path.path);
    // audioPlayer.setSource(widget.path.path);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * AppRatios.recordRowWidthRatio,
      height:
          MediaQuery.of(context).size.height * AppRatios.recordRowHeightRatio,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
              text: "${widget.index}. ",
              textColor: AppColors.white,
              fontSize: 30,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              italicEnable: false),
          CustomText(
              text: widget.question.length > limitQuestion
                  ? "${widget.question.substring(0, limitQuestionSubString)}..."
                  : widget.question,
              textColor: AppColors.white,
              fontMaxLines: 3,
              fontSize: 16,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.normal,
              italicEnable: false),
          // GestureDetector(
          //   onTapDown: _storePosition,
          //   onTap: () async {
          //     final RenderBox overlay =
          //         Overlay.of(context)!.context.findRenderObject() as RenderBox;
          //
          //     await showMenu(
          //       context: context,
          //       position: RelativeRect.fromRect(
          //           _tapPosition & const Size(40, 40),
          //           // smaller rect, the touch area
          //           Offset.zero & overlay.size // Bigger rect, the entire screen
          //           ),
          //       items: [
          //         PopupMenuItem<String>(
          //           child: Text(widget.question),
          //         ),
          //       ],
          //       elevation: 8.0,
          //     );
          //
          //     // widget.onItemSelected(value);
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 0.0),
          //     child: SizedBox(
          //       width: AppRatios.recordRowQuestionWidthRatio,
          //       child: CustomText(
          //           text: widget.question.length > limitQuestion
          //               ? "${widget.question.substring(0, limitQuestionSubString)}..."
          //               : widget.question,
          //           textColor: AppColors.white,
          //           fontMaxLines: 3,
          //           fontSize: 16,
          //           fontFamily: "Montserrat",
          //           fontWeight: FontWeight.normal,
          //           italicEnable: false),
          //     ),
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Slider(
              //   min: 0,
              //   max: duration.inSeconds.toDouble(),
              //   value: position.inSeconds.toDouble(),
              //   onChanged: (value) async {
              //     final position = Duration(seconds: value.toInt());
              //     await audioPlayer.seek(position);
              //     // can be changed to not resume
              //     await audioPlayer.resume();
              //   },
              // ),
              // CustomText(text: position.toString()),
              // CustomText(text: (duration - position).toString()),
              CustomButtonAnimated(
                label: !isPlaying ? "play" : "stop",
                postFixIconAsImagePath:
                    !isPlaying ? AppPaths.playButton : AppPaths.pauseIconPath,
                onPressed: () async {
                  if (isPlaying) {
                    audioPlayer.stop();
                  } else {
                    // await audioPlayer.play(widget.path.path);
                    audioPlayer.resume();
                  }
                },
                fontSize: 18,
                iconWidth: 20,
                iconHeight: 20,
                widthRatio: AppRatios.playButtonWidthRatio,
                height: MediaQuery.of(context).size.height *
                    AppRatios.playButtonHeightRatio,
                buttonColor: AppColors.playButtonColor,
                labelColor: !isPlaying
                    ? AppColors.playButtonLabelColor
                    : AppColors.pauseColor,
                // fontFamily: "Montserrat",
                filled: true,
                iconPaddingLeft: 5,
                insets: 7,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              CustomButtonAnimated(
                label: "delete",
                postFixIconAsImagePath: AppPaths.deleteButton,
                onPressed: () {
                  audioPlayer.stop();
                  audioPlayer.dispose();
                  widget.path.delete();
                  context.read<RecordsCubit>().GetCurrentRecords();
                  context.read<ShuffleCubit>().updateDeletedQuestionsObject();
                },
                fontSize: 18,
                iconHeight: 20,
                iconWidth: 20,
                widthRatio: AppRatios.deleteButtonWidthRatio,
                height: MediaQuery.of(context).size.height *
                    AppRatios.deleteButtonHeightRatio,
                buttonColor: AppColors.deleteButtonColor,
                // labelColor: AppColors.black,
                // fontFamily: "Montserrat",
                labelColor: AppColors.deleteButtonLabelColor,
                filled: true,
                iconPaddingLeft: 5,
                insets: 7,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Clipboard.setData(
// ClipboardData(text: widget.question));
// _showDialogSuccess(
// context,
// AppColors.swipeDockColor,
// "${widget.index}. question is copied");
