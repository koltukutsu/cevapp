import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:cevapp/cubit/audio_player/audio_player_cubit.dart';
import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/cubit/shuffle/shuffle_cubit.dart';
import 'package:cevapp/models/questionObject.dart';
import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_button.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordRow extends StatefulWidget {
  final String index;
  final File path;
  final QuestionObject question;
  final Function updateTheParent;

  const RecordRow(
      {Key? key,
      required this.updateTheParent,
      required this.index,
      required this.path,
      required this.question})
      : super(key: key);

  @override
  State<RecordRow> createState() => _RecordRowState();
}

class _RecordRowState extends State<RecordRow> {
  final audioPlayer = AudioPlayer();
  final int limitQuestion = 23;

  // final int limitQuestionSubString = 5;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  late var _tapPosition;
  var isMine = false;

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setAudio();
  }

  // Future<void> setAudio() async {
  //   // repeat the song when completed
  //   audioPlayer.setReleaseMode(ReleaseMode.loop);
  //   debugPrint("what is this: ${widget.path}");
  //   audioPlayer.setSourceDeviceFile(widget.path.path);
  // }

  @override
  Widget build(BuildContext context) {
    isMine = int.parse(widget.index) ==
        context.read<AudioPlayerCubit>().playingIndex;

    return SizedBox(
      width: MediaQuery.of(context).size.width * AppRatios.recordRowWidthRatio,
      height:
          MediaQuery.of(context).size.height * AppRatios.recordRowHeightRatio,
      child: Stack(
        alignment: Alignment.centerRight,
        // mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
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
                GestureDetector(
                  onTapDown: _storePosition,
                  onTap: () async {
                    final RenderBox overlay = Overlay.of(context)!
                        .context
                        .findRenderObject() as RenderBox;

                    await showMenu(
                      context: context,
                      position: RelativeRect.fromRect(
                          _tapPosition & const Size(40, 40),
                          // smaller rect, the touch area
                          Offset.zero &
                              overlay.size // Bigger rect, the entire screen
                          ),
                      items: [
                        PopupMenuItem<String>(
                          child: Text(widget.question.question),
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                text: "Question: ${widget.question.question}"));

                            _showDialogSuccess(
                                context,
                                icon: Icons.info,
                                AppColors.rightSwipeDockColor,
                                "The question is coppied",
                                textColor: AppColors.rightSwipeDockColor);
                          },
                        ),
                      ],
                      elevation: 8.0,
                    );

                    // widget.onItemSelected(value);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: CustomText(
                        text: giveMeText(),
                        textColor: AppColors.white,
                        fontMaxLines: 3,
                        fontSize: 16,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.normal,
                        italicEnable: false),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonAnimated(
                label: isPlaying && isMine ? "stop" : "play",
                postFixIconAsImagePath: isPlaying && isMine
                    ? AppPaths.pauseIconPath
                    : AppPaths.playButton,
                onPressed: () {
                  if (int.parse(widget.index) !=
                      context.read<AudioPlayerCubit>().playingIndex) {
                    context.read<AudioPlayerCubit>().setAudioAndPlay(
                        path: widget.path.path, index: int.parse(widget.index));
                    widget.updateTheParent();
                  }

                  if (isPlaying) {
                    setState(() {
                      isMine = int.parse(widget.index) ==
                          context.read<AudioPlayerCubit>().playingIndex;
                      isPlaying = false;
                    });
                    context.read<AudioPlayerCubit>().stopAudio();
                  } else {
                    setState(() {
                      isMine = int.parse(widget.index) ==
                          context.read<AudioPlayerCubit>().playingIndex;
                      isPlaying = true;
                    });
                    context.read<AudioPlayerCubit>().resumeAudio();
                  }
                },

                fontSize: 18,
                iconWidth: 20,
                iconHeight: 20,
                widthRatio: AppRatios.playButtonWidthRatio,
                height: MediaQuery.of(context).size.height *
                    AppRatios.playButtonHeightRatio,
                buttonColor: AppColors.playButtonColor,
                labelColor: isPlaying && isMine
                    ? AppColors.pauseColor
                    : AppColors.playButtonLabelColor,
                // fontFamily: "Montserrat",
                filled: true,
                iconPaddingLeft: 5,
                insets: 7,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: CustomButtonAnimated(
                  label: "delete",
                  postFixIconAsImagePath: AppPaths.deleteButton,
                  onPressed: () {
                    context.read<AudioPlayerCubit>().stopAudio();
                    // audioPlayer.dispose();
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  String giveMeText() {
    if (widget.question.question.length > limitQuestion) {
      return "${widget.question.question.substring(0, limitQuestion)}...";
    } else {
      return widget.question.question;
    }
  }
}

// Clipboard.setData(
// ClipboardData(text: widget.question));
// _showDialogSuccess(
// context,
// AppColors.swipeDockColor,
// "${widget.index}. question is copied");

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
