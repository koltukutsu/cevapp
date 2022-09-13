import 'package:cevapp/cubit/records/record_cubit.dart';
import 'package:cevapp/cubit/shuffle/shuffle_cubit.dart';
import 'package:cevapp/ui/screens/main/components/main_screen_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

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
    _requestPermission(Permission.storage);
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      // print(await permission.status);
      // print(await permission.isGranted);
      context.read<RecordsCubit>().GetCurrentRecords();
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        context.read<RecordsCubit>().GetCurrentRecords();
        return true;
      }
    }
    print(await permission.status);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: MainScreenStack(),
    );
  }
}
