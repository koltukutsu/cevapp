import 'package:cevapp/ui/constants/icons.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:flutter/material.dart';

class ButtonsDuringRecord extends StatefulWidget {
  final void Function(bool) crossFadeStateChangerFunction;

  const ButtonsDuringRecord(
      {Key? key, required this.crossFadeStateChangerFunction})
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
    return Row(
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
                // widget.onSoundProcesses("pause_record");
              }),
          secondChild: CustomNeumorphicButton(
              imagePath: AppPaths.continueIconPath,
              width: 93,
              height: 93,
              paddingAllAsDouble: 0,
              function: () {
                onChangePauseAndContinueButton(false);
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
            })
      ],
    );
  }
}
