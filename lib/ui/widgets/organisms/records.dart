import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/ui/constants/widget_ratios.dart';
import 'package:cevapp/ui/theme/colors.dart';
import 'package:cevapp/ui/widgets/atoms/custom_column_linear_gradient_filled.dart';
import 'package:cevapp/ui/widgets/atoms/custom_text.dart';
import 'package:cevapp/ui/widgets/molecules/record_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({Key? key}) : super(key: key);

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  final String path = '/data/user/0/com.example.cevapp/cache';
  var pathLists = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RecordsCubit>().GetCurrentRecords();
  }

  // Future<void> getPaths() async {
  //   var results = await Directory(path).list().toList();
  //   setState(() {
  //     pathLists = results;
  //   });
  //   print("uzunluk");
  //   print(pathLists.length);
  //   print(pathLists[0]);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.swipeDockColor,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[
              AppColors.leftSwipeDockColor,
              AppColors.rightSwipeDockColor,
            ],
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(60))),
      height: MediaQuery.of(context).size.height *
          AppRatios.swipdeDockFullHeightRatio,
      child: BlocBuilder<RecordsCubit, RecordsState>(
        builder: (context, state) {
          if (state is GetRecords) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: CustomColumnLinearGradientFilled(),
                ),
                if (state.recordPathsAsFileList.isNotEmpty)
                  ...List.generate(
                    state.recordPathsAsFileList.length,
                    (index) => RecordRow(
                      index: index.toString(),
                        path: state.recordPathsAsFileList[index],
                        question: "say something"),
                  )
                else
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2),
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomText(
                        text: "no records yet",
                        textColor: AppColors.white,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 82,
                      ),
                    ),
                  )
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: CustomColumnLinearGradientFilled(),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: "no records yet",
                    textColor: AppColors.white,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 82,
                  ),
                )
              ],
            );
          }
        },
        // child: ,
      ),
    );
  }
}
