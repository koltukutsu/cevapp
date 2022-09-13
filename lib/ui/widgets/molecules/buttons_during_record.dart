import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/cubit/shuffle/shuffle_cubit.dart';
import 'package:cevapp/ui/constants/app_paths.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonsDuringRecord extends StatefulWidget {
  final void Function(bool) crossFadeStateChangerFunction;
  final Future<void> Function(String mode, {String? id}) recordFunction;
  final String takenTime;

  const ButtonsDuringRecord(
      {Key? key,
      required this.crossFadeStateChangerFunction,
      required this.takenTime,
      required this.recordFunction})
      : super(key: key);

  @override
  State<ButtonsDuringRecord> createState() => _ButtonsDuringRecordState();
}

class _ButtonsDuringRecordState extends State<ButtonsDuringRecord> {
  final int recordingThreshold =
      30; // to be able to finish the recording process, the recording time must be larger than 30 seconds
  CrossFadeState _crossFadeStateSecond = CrossFadeState.showFirst;

  void onChangePauseAndContinueButton(bool isPaused) {
    if (isPaused) {
      setState(() {
        _crossFadeStateSecond = CrossFadeState.showSecond;
      });
    } else {
      setState(() {
        _crossFadeStateSecond = CrossFadeState.showFirst;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.025,
          top: MediaQuery.of(context).size.height * 0.025),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomNeumorphicButton(
                  imagePath: AppPaths.acceptIconPath,
                  width: 93,
                  height: 93,
                  paddingAllAsDouble: 0,
                  function: () {
                    // TODO: solve the problem
                    if (context.read<RecordsCubit>().getCurrentRecordingTime >=
                        recordingThreshold) {
                      widget.crossFadeStateChangerFunction(false);
                      onChangePauseAndContinueButton(false);
                      widget.recordFunction("finish");

                      context.read<ShuffleCubit>().printQuestion();
                      context
                          .read<ShuffleCubit>()
                          .updateRecordedQuestionsObject();
                      context.read<RecordsCubit>().GetCurrentRecords();
                      context.read<AvatarCubit>().increaseMoney();
                      context.read<ShuffleCubit>().getQuestion();
                    } else {
                      _showDialogSuccess(context, AppColors.magenta,
                          "To finish, must be more than $recordingThreshold seconds!");
                    }
                  }),
              AnimatedCrossFade(
                crossFadeState: _crossFadeStateSecond,
                duration: const Duration(milliseconds: 250),
                firstCurve: Curves.easeOut,
                secondCurve: Curves.easeIn,
                firstChild: CustomNeumorphicButton(
                    imagePath: AppPaths.pauseIconPath,
                    width: 93,
                    height: 93,
                    paddingAllAsDouble: 0,
                    function: () {
                      onChangePauseAndContinueButton(true);
                      widget.recordFunction("pause");
                      // widget.onSoundProcesses("pause_record");
                    }),
                secondChild: CustomNeumorphicButton(
                    imagePath: AppPaths.continueIconPath,
                    width: 93,
                    height: 93,
                    paddingAllAsDouble: 0,
                    function: () {
                      onChangePauseAndContinueButton(false);
                      // widget.recordFunction("continue");

                      // widget.onSoundProcesses("continue_record");
                    }),
              ),
              CustomNeumorphicButton(
                  imagePath: AppPaths.removetIconPath,
                  width: 93,
                  height: 93,
                  paddingAllAsDouble: 0,
                  function: () {
                    widget.crossFadeStateChangerFunction(false);
                    onChangePauseAndContinueButton(false);
                    widget.recordFunction("delete");
                    context.read<RecordsCubit>().GetCurrentRecords();
                  })
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.025),
            child: CustomText(
              text: widget.takenTime,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat",
              fontSize: 82,
              italicEnable: false,
            ),
          )
        ],
      ),
    );
  }
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
