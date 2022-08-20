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
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';

class RecordRow extends StatefulWidget {
  final String index;
  final File path;
  final String question;

  const RecordRow(
      {Key? key,
      required this.index,
      required this.path,
      required this.question})
      : super(key: key);

  @override
  State<RecordRow> createState() => _RecordRowState();
}

class _RecordRowState extends State<RecordRow> {
  final audioPlayer = AudioPlayer();

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
          Row(
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
                onLongPress: (){
                  // showMenu(context: context, position: position, items: items);
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: CustomText(
                      text: widget.question,
                      textColor: AppColors.black,
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.normal,
                      italicEnable: false),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonAnimated(
                label: "play",
                postFixIconAsImagePath: AppPaths.playButton,
                onPressed: () async {
                  // TODO; solve that
                  FlutterSoundPlayer? myPlayer = FlutterSoundPlayer();
                  myPlayer = await FlutterSoundPlayer().openPlayer();
                  if (myPlayer != null) {
                    Duration? d = await myPlayer.startPlayer(
                      fromURI:
                          "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_700KB.mp3",
                      codec: Codec.mp3,
                      whenFinished: () {
                        print('I hope you enjoyed listening to this song');
                      },
                    );
                  } else {
                    print("probleeeeeemsss");
                  }

                  // print("the recording is being played now: ${widget.path.path}");
                  // await audioPlayer.play(DeviceFileSource(widget.path.path));
                },
                fontSize: 18,
                iconWidth: 20,
                iconHeight: 20,
                widthRatio: AppRatios.playButtonWidthRatio,
                height: MediaQuery.of(context).size.height *
                    AppRatios.playButtonHeightRatio,
                buttonColor: AppColors.playButtonColor,
                labelColor: AppColors.playButtonLabelColor,

                // labelColor: AppColors.black,
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
          // CustomButtonAnimated(
          //   label: "play",
          //   postFixIconAsImagePath: AppPaths.playButton,
          //   onPressed: () {
          //   },
          //   fontSize: 48,
          //   widthRatio: AppRatios.playButtonWidthRatio,
          //   height: MediaQuery.of(context).size.height *
          //       AppRatios.playButtonHeightRatio,
          //   buttonColor: AppColors.playButtonColor,
          //   // labelColor: AppColors.black,
          //   // fontFamily: "Montserrat",
          //   filled: true,
          //   iconPaddingLeft: 5,
          //   insets: 7,
          // )
        ],
      ),
    );
  }
}
