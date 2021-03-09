import 'package:flutter/material.dart';
import 'package:bmi_calculater/constants.dart';

class ReusableContent extends StatelessWidget {
  final IconData cardIcon;
  final String label;
  ReusableContent({@required this.cardIcon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelStyle,
        ),
      ],
    );
  }
}
