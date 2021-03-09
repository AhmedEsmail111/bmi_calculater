import 'package:bmi_calculater/screens/dart/results_page.dart';
import 'package:bmi_calculater/widgets/dart/buttom_button.dart';
import 'package:bmi_calculater/widgets/dart/floatingButton.dart';
import 'package:bmi_calculater/widgets/dart/icon_content.dart';
import 'package:bmi_calculater/widgets/dart/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculater/constants.dart';

import '../../calculater_brain.dart';

// an enum class to represent the tow types of the card
enum HumanType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // a variable to decide which card got pressed
  HumanType gender;
  // a variable for the height given by thr user to be displayed as the value of the slider
  int height = 180;
  // a variable for the weight given by the user to be displayed on the screen
  int weight = 75;
  // a variable for the Age given by the user to be displayed on the screen
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      detector: () {
                        setState(() {
                          gender = HumanType.male;
                        });
                      },
                      cardChild: ReusableContent(
                        cardIcon: FontAwesomeIcons.mars,
                        label: kMaleGender,
                      ),
                      color: gender == HumanType.male
                          ? kActiveColor
                          : kInActiveColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      detector: () {
                        setState(() {
                          gender = HumanType.female;
                        });
                      },
                      cardChild: ReusableContent(
                        cardIcon: FontAwesomeIcons.venus,
                        label: kFemaleGender,
                      ),
                      color: gender == HumanType.female
                          ? kActiveColor
                          : kInActiveColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelStyle,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kSliderActiveColor,
                        inactiveTrackColor: kSliderInActiveColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: kSliderThumbColor,
                        overlayColor: kSliderOverlayColor,
                      ),
                      child: Slider(
                        min: kSliderMinValue,
                        max: kSliderMaxValue,
                        value: height.toDouble(),
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                color: kActiveColor,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelStyle,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomRoundButton(
                                onTap: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 18.0,
                              ),
                              CustomRoundButton(
                                onTap: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              )
                            ],
                          )
                        ],
                      ),
                      color: kActiveColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelStyle,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomRoundButton(
                                onTap: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 18.0,
                              ),
                              CustomRoundButton(
                                onTap: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              )
                            ],
                          )
                        ],
                      ),
                      color: kActiveColor,
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onPressed: () {
                CalculatorBrain _calculatorBrain =
                    CalculatorBrain(weight: weight, height: height);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: _calculatorBrain.calculateBMI(),
                            resultText: _calculatorBrain.getResult(),
                            interpretation:
                                _calculatorBrain.getInterpretation(),
                          )),
                );
              },
              buttonTitle: kCalculateString,
            ),
          ],
        ));
  }
}
