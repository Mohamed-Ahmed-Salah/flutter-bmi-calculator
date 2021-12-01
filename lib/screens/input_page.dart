import 'package:bmi_calculator/components/round_button.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reused_card.dart';
import '../components/icon_content.dart';
import '../consts.dart';
import 'package:bmi_calculator/calculator.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color male = kinactiv;
  Color female = kinactiv;
  int height = 180;
  int weight = 60;
  int age = 18;

  void chooseColor(int gender) {
    setState(() {
      if (gender == 1) {
        if (male == kinactiv) {
          male = kactiveCardColor;
        } else {
          male = kinactiv;
        }
        female = kinactiv;
      } else {
        if (female == kinactiv) {
          female = kactiveCardColor;
        } else
          female = kinactiv;
        male = kinactiv;
      }
    });
  }

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
                  child: GestureDetector(
                    onTap: () {
                      chooseColor(1);
                    },
                    child: ReusableCard(
                      colour: male,
                      cardChild: IconContent(
                          usedIcon: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      chooseColor(2);
                    },
                    child: ReusableCard(
                      colour: female,
                      cardChild: IconContent(
                        usedIcon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: klabelTextSTyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("$height", style: kNumberText),
                            Text(
                              'cm',
                              style: klabelTextSTyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25),
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0x29EB1555),
                            inactiveTickMarkColor: Color(0xFF8D8E98),
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              max: 220,
                              min: 120,
                              onChanged: (double newHeight) {
                                setState(() {
                                  height = newHeight.toInt();
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelTextSTyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              child: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      ReusableCard(
                        colour: kactiveCardColor,
                        cardChild: Column(
                          children: [
                            Text(
                              'AGE',
                              style: klabelTextSTyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberText,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  child: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),

                                /*FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),*/
                                SizedBox(
                                  width: 15,
                                ),
                                RoundIconButton(
                                  child: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (male == kinactiv && female == kinactiv) {
                /*
                AlertDialog(
                  title: Text('Choose Gender'),
                  actions: [
                    DialogAction(
                      child: Text('Okay bro'),
                    ),
                  ],
                );*/
                showDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                          title: new Text("Choose you gender"),
                          //content: new Text("This is my content"),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              onPressed: () {
                                chooseColor(1);
                                Navigator.pop(context);
                              },
                              isDefaultAction: true,
                              child: Text('Male'),
                            ),
                            CupertinoDialogAction(
                              onPressed: () {
                                chooseColor(2);
                                Navigator.pop(context);
                              },
                              child: Text("Female"),
                            )
                          ],
                        ));
              } else {
                Calculator calc = Calculator(height: height, weight: weight);
                /* Navigator.pushNamed(context, '/last');*/
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPaged(
                      bmiResult: calc.BMIcalculator(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              }
            },
            child: Container(
              width: double.infinity,
              height: 80,
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
