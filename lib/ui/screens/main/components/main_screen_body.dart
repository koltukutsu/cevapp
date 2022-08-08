import 'package:cevapp/ui/constants/icons.dart';
import 'package:cevapp/ui/navigation/navigation_names.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/atoms/neumorphic_button.dart';
import 'package:cevapp/ui/widgets/molecules/buttons_during_record.dart';
import 'package:cevapp/ui/widgets/molecules/buttons_section.dart';
import 'package:cevapp/ui/widgets/molecules/custom_neumorphic_text_field.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MainScreenBody extends StatefulWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  void onChangedButtonChangeCrossFadeState(bool isRecordPressed) {
    if (isRecordPressed) {
      print(1);
      setState(() {
        _crossFadeState = CrossFadeState.showSecond;
      });
    } else {
      print(2);
      setState(() {
        _crossFadeState = CrossFadeState.showFirst;
      });
    }
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
          AnimatedCrossFade(
            crossFadeState: _crossFadeState,
            duration: const Duration(milliseconds: 300),
            firstCurve: Curves.easeIn,
            secondCurve: Curves.easeOut,
            firstChild: ButtonsSection(
                crossFadeStateChangerFunction:
                    onChangedButtonChangeCrossFadeState),
            secondChild: ButtonsDuringRecord(
                crossFadeStateChangerFunction:
                    onChangedButtonChangeCrossFadeState),
          ),
        ],
      ),
    );
  }
}
