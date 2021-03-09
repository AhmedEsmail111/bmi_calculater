import 'package:bmi_calculater/screens/dart/results_page.dart';
import 'package:flutter/material.dart';
import 'screens/dart/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0D21),
        scaffoldBackgroundColor: Color(0xff0A0D21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}
