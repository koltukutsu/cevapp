import 'package:cevapp/ui/screens/market/components/market_screen_body.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key, this.comingFromMain = false}) : super(key: key);
  final bool comingFromMain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MarketScreenBody(comingFromMain: comingFromMain!),
    );
  }
}
