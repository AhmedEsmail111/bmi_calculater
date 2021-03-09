import 'package:bmi_calculater/constants.dart';
import 'package:bmi_calculater/widgets/dart/buttom_button.dart';
import 'package:bmi_calculater/widgets/dart/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATER'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Your Result',
                  style: kNumberStyle.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ReusableCard(
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.green[400],
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: kNumberStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                color: kActiveColor,
              ),
            ),
            Expanded(
              flex: 1,
              child: BottomButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                buttonTitle: kReCalculateString,
              ),
            ),
          ],
        ));
  }
}
