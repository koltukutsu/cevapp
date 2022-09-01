import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNeumorphicMarketButton extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final VoidCallback? function;
  final double topMargin;
  final double bottomMargin;
  final double leftMargin;
  final double rightMargin;
  final double paddingAllAsDouble;

  const CustomNeumorphicMarketButton({
    Key? key,
    required this.imagePath,
    required this.width,
    required this.height,
    this.function,
    this.topMargin = 6,
    this.bottomMargin = 0,
    this.leftMargin = 6,
    this.rightMargin = 0,
    this.paddingAllAsDouble = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NeumorphicButton(
            margin: EdgeInsets.only(
                top: topMargin,
                right: rightMargin,
                left: leftMargin,
                bottom: bottomMargin),
            onPressed: function,
            style: const NeumorphicStyle(
              shape: NeumorphicShape.convex,
              shadowLightColor: AppColors.transparent,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            padding: EdgeInsets.all(paddingAllAsDouble),
            child: Image(
              image: AssetImage(imagePath),
              width: width,
              height: height,
            )),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CustomText(
            text: context.read<AvatarCubit>().avatarMoney.toString(),
            fontWeight: FontWeight.bold,
            italicEnable: false,
            fontSize: 45,
          ),
        )
      ],
    );
  }
}
