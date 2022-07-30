import 'package:flutter/material.dart';
import 'package:talebe_app/ui/widgets/molecules/custom_date_card.dart';
import 'package:talebe_app/ui/widgets/molecules/custom_name_surname.dart';

class CustomNamesAndDateCard extends StatelessWidget {
  const CustomNamesAndDateCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: CustomNameSurname(),
        ),
        CustomDateCard()
      ],
    );
  }
}
