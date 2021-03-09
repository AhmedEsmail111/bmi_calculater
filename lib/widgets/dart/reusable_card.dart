import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function detector;
  ReusableCard({@required this.color, this.cardChild, this.detector});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: detector,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
