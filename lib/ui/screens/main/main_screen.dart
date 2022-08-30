import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/cubit/shuffle/shuffle_cubit.dart';
import 'package:cevapp/ui/screens/main/components/main_screen_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ShuffleCubit>().setQuestionObjectsState();
    context.read<RecordsCubit>().GetCurrentRecords();
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainScreenStack(),
    );
  }
}
