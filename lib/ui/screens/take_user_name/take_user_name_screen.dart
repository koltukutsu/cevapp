import 'package:cevapp/ui/screens/take_user_name/components/take_user_name_screen_body.dart';
import 'package:flutter/material.dart';

class TakeUserNameScreen extends StatelessWidget {
  const TakeUserNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TakeUserNameScreenBody(),
    );
  }
}
