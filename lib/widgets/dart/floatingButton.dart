import 'package:flutter/material.dart';

// composing a custom floating button
class CustomRoundButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  CustomRoundButton({@required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      child: Icon(icon),
      shape: CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
