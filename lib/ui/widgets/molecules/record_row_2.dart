import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/ui/constants/icons.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_button.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordRowSecond extends StatefulWidget {
  final String index;
  final File path;
  final String question;

  const RecordRowSecond(
      {Key? key,
      required this.index,
      required this.path,
      required this.question})
      : super(key: key);

  @override
  State<RecordRowSecond> createState() => _RecordRowSecondState();
}

class _RecordRowSecondState extends State<RecordRowSecond> {
  final audioPlayer = AudioPlayer();
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

    audioPlayer.setSourceDeviceFile(widget.path.path);
    // audioPlayer.setSourceAsset(widget.path.path);
    // audioPlayer.setSource(widget.path.path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * AppRatios.recordRowWidthRatio,
      height:
          MediaQuery.of(context).size.height * AppRatios.recordRowHeightRatio,
      child: Stack(
        alignment: Alignment.centerRight,
        // mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                    text: "${widget.index}. ",
                    textColor: AppColors.white,
                    fontSize: 30,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    italicEnable: false),
              ),
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
                        child: Text(widget.question),
                      ),
                    ],
                    elevation: 8.0,
                  );

                  // widget.onItemSelected(value);
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: CustomText(
                      text: widget.question.length > 23
                          ? "${widget.question.substring(0, 23)}..."
                          : widget.question,
                      textColor: AppColors.white,
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.normal,
                      italicEnable: false),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isPlaying
                      ? CustomButtonAnimated(
                          label: "play",
                          postFixIconAsImagePath: AppPaths.playButton,
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
                          labelColor: AppColors.playButtonLabelColor,
                          // fontFamily: "Montserrat",
                          filled: true,
                          iconPaddingLeft: 5,
                          insets: 7,
                        )
                      : Column(
                          children: [
                            Slider(
                              min: 0,
                              max: duration.inSeconds.toDouble(),
                              value: position.inSeconds.toDouble(),
                              onChanged: (value) async {
                                final position =
                                    Duration(seconds: value.toInt());
                                await audioPlayer.seek(position);
                                // can be changed to not resume
                                await audioPlayer.resume();
                              },
                            ),
                            Row(
                              children: [
                                CustomText(text: position.toString()),
                                CustomText(
                                    text: (duration - position).toString()),
                              ],
                            ),
                          ],
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
