import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/ui/constants/icons.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonsDuringRecord extends StatefulWidget {
  final void Function(bool) crossFadeStateChangerFunction;
  final Future<void> Function(String) recordFunction;
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
                    widget.crossFadeStateChangerFunction(false);
                    onChangePauseAndContinueButton(false);
                    widget.recordFunction("finish");
                    context.read<RecordsCubit>().GetCurrentRecords();
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
                      widget.recordFunction("continue");

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
