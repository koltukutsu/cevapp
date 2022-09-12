import 'package:cevapp/cubit/shuffle/shuffle_cubit.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNeumorphicTextField extends StatelessWidget {
  const CustomNeumorphicTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
          depth: 8,
          lightSource: LightSource.bottom,
          color: AppColors.white),
      child: SizedBox(
          height: MediaQuery.of(context).size.height *
              AppRatios.questionFieldHeightRatio,
          width: MediaQuery.of(context).size.width *
              AppRatios.questionFieldWidthRatio,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 23.0, right: 10, bottom: 15),
              child: BlocBuilder<ShuffleCubit, ShuffleState>(
                builder: (context, state) {
                  if (state is IdleState) {
                    return const CustomText(
                      text: "C'mon, Let's shuffle!",
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      textColor: AppColors.secondaryTextColor,
                      fontMaxLines: 5,
                      italicEnable: true,
                    );
                  } else if (state is GettingQuestion) {
                    return const CustomText(
                      text: "C'mon, Let's shuffle!",
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      textColor: AppColors.secondaryTextColor,
                      fontMaxLines: 5,
                      italicEnable: true,
                    );
                  } else if (state is GotQuestion || true) { // TODO: control this condition
                    return Builder(
                      builder:(context) => CustomText(
                        text: context.watch<ShuffleCubit>().shuffledQuestion["question"], // TODO: contorl
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        textColor: AppColors.secondaryTextColor,
                        fontMaxLines: 5,
                        italicEnable: true,
                      ),
                    );
                  }
                },
              ),
            ),
          )),
    );
  }
}
