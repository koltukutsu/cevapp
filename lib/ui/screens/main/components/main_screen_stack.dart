import 'package:cevapp/ui/screens/main/components/main_screen_body.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class MainScreenStack extends StatefulWidget {
  const MainScreenStack({Key? key}) : super(key: key);

  @override
  State<MainScreenStack> createState() => _MainScreenStackState();
}

class _MainScreenStackState extends State<MainScreenStack> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        showModalBottomSheet(
            isScrollControlled: true,
            // TODO; test this feature
            elevation: 8,
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            backgroundColor: AppColors.swipeDockColor,
            // <-- SEE HERE
            builder: (context) {
              // bottom swipe drawer
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // CustomButtonAnimated(
                    //     label: "Günlük Yapılacaklar",
                    //     onPressed: () {
                    //       context
                    //           .read<ChangingBodyCubit>()
                    //           .onChangedButton(0);
                    //     },
                    //     widthRatio: 0.9),
                    // CustomButtonAnimated(
                    //     label: "İstatistikler",
                    //     onPressed: () {
                    //       context
                    //           .read<ChangingBodyCubit>()
                    //           .onChangedButton(1);
                    //     },
                    //     widthRatio: 0.9),
                  ],
                ),
              );
            });
      },
      child: Stack(children: [
        const MainScreenBody(),
        if (MediaQuery.of(context).viewInsets.bottom == 0)
          Align(
            alignment: Alignment.bottomCenter,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Material(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          // borderRadius:
                          //     BorderRadius.vertical(top: Radius.circular(25)
                        )),
                  ),
                )
              ],
            ),
          )
      ]),
    );
  }
}
