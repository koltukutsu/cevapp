import 'package:cevapp/ui/screens/market/components/market_screen_body.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: MarketScreenBody(),
    );
  }
}
