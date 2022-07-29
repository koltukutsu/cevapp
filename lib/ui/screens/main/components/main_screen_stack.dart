import 'package:cevapp/ui/screens/main/components/main_screen_body.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/organisms/records.dart';
import 'package:flutter/material.dart';

class MainScreenStack extends StatefulWidget {
  const MainScreenStack({Key? key}) : super(key: key);

  @override
  State<MainScreenStack> createState() => _MainScreenStackState();
}

class _MainScreenStackState extends State<MainScreenStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const MainScreenBody(),
      if (MediaQuery.of(context).viewInsets.bottom == 0)
        GestureDetector(
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
                  backgroundColor: AppColors.white,
                  // <-- SEE HERE
                  builder: (context) {
                    // bottom swipe drawer
                    return const RecordsScreen();
                  });
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                  ))
                ],
              ),
            ))
    ]);
  }
}
