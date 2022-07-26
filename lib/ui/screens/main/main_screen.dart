import 'package:cevapp/ui/screens/main/components/main_screen_stack.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainScreenStack(),
    );
  }
}
