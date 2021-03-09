import 'package:flutter/material.dart';
import '../../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onPressed;
  final String buttonTitle;
  BottomButton({@required this.onPressed, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(buttonTitle, style: kButtonStyle),
        ),
        padding: EdgeInsets.only(bottom: 8.0),
        width: double.infinity,
        height: kButtonHeight,
        color: kButtonColor,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
