import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/screens/main/components/main_screen_body.dart';
import 'package:cevapp/ui/widgets/molecules/custom_swipe_dock.dart';
import 'package:cevapp/ui/widgets/organisms/records.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainScreenStack extends StatefulWidget {
  const MainScreenStack({Key? key}) : super(key: key);

  @override
  State<MainScreenStack> createState() => _MainScreenStackState();
}

class _MainScreenStackState extends State<MainScreenStack> {

  @override
  Widget build(BuildContext context) {
    // return Stack(children: [
    //   const MainScreenBody(),
    //   if (MediaQuery.of(context).viewInsets.bottom == 0)
    //     GestureDetector(
    //         onHorizontalDragUpdate: (details) {
    //           showModalBottomSheet(
    //               isScrollControlled: true,
    //               elevation: 8,
    //               context: context,
    //               shape: const RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.vertical(
    //                   top: Radius.circular(60.0),
    //                 ),
    //               ),
    //               builder: (context) {
    //                 return const Expanded(child: RecordsScreen());
    //               });
    //         },
    //         child: Align(
    //           alignment: Alignment.bottomCenter,
    //           child: Flex(
    //             direction: Axis.horizontal,
    //             children: const [Expanded(child: SwipeDock())],
    //           ),
    //         ))
    // ]);
    return SlidingUpPanel(
      maxHeight: MediaQuery.of(context).size.height *
              AppRatios.swipdeDockFullHeightRatio,
      renderPanelSheet: false,
      body: const MainScreenBody(),
      collapsed: const SwipeDock(),
      panel: const RecordsScreen(),
    );
  }
}

// Widget _floatingCollapsed(){
//   return Container(
//     decoration: BoxDecoration(
//       color: Colors.blueGrey,
//       borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
//     ),
//     margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
//     child: Center(
//       child: Text(
//         "This is the collapsed Widget",
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//   );
// }
//
// Widget _floatingPanel(){
//   return Container(
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(24.0)),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 20.0,
//             color: Colors.grey,
//           ),
//         ]
//     ),
//     margin: const EdgeInsets.all(24.0),
//     child: Center(
//       child: Text("This is the SlidingUpPanel when open"),
//     ),
//   );
// }
