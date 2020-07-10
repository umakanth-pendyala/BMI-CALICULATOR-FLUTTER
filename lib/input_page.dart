import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/card_widget.dart';
import 'components/icon_column_widget.dart';
import 'constants.dart';
import 'results_page.dart';
import 'caliculator_barin.dart';

const double bottomHeight = 70.0;
const Color activeCardColor = Color(0xff1d1e33);
const inActiveCardColor = Color(0xff111328);


enum Gender {male, female}
int height = 150;
int weight = 80;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

  Color maleCardColor = inActiveCardColor;
  Color femaleCardColor = inActiveCardColor;


void updateCardColors(Gender gender) {
    maleCardColor =  gender == Gender.male ? (maleCardColor == inActiveCardColor ? activeCardColor : inActiveCardColor) : inActiveCardColor;
    femaleCardColor = gender == Gender.female ? (femaleCardColor == inActiveCardColor ? activeCardColor : inActiveCardColor) : inActiveCardColor;
  }


class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI caliculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateCardColors(Gender.male);
                      });
                    },
                    child: MyCard(
                      backgroundCol: maleCardColor,
                      childWidget: IconColumnWidget(
                        fontAwsomeIcon: FontAwesomeIcons.mars,
                        title: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                          updateCardColors(Gender.female);
//                        maleCardColor = inActiveCardColor;
                      });
                    },
                    child: MyCard(
                      backgroundCol: femaleCardColor,
                      childWidget: IconColumnWidget(
                        fontAwsomeIcon: FontAwesomeIcons.venus,
                        title: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    backgroundCol: inActiveCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Height',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: KDisplayNumberStyle,
                            ),
                            Text(
                              'cm',
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                            overlayColor: Color(0x1ffb1555),
                          ),
                          child: Slider(
                            min: 120.0,
                            max: 220.0,
                            value: height.toDouble(),
                            activeColor: Color(0xffeb1555),
                            inactiveColor: Color(0xff8d8e98),
                            onChanged: (double changedValue) {
                              setState(() {
                                height = changedValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    backgroundCol: inActiveCardColor,
                    childWidget: Column(
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          weight.toString(),
                          style: KDisplayNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'btn3',
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              heroTag: 'btn4',
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    backgroundCol: inActiveCardColor,
                    childWidget: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          age.toString(),
                          style: KDisplayNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'btn1',
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              heroTag: 'btn2',
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              print('on tap working');
              CaliculatorBrain calcu = new CaliculatorBrain(height, weight);
              calcu.caliculateBMI();
//              Navigator.pushNamed(context, '/results');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Results(results: calcu.getResult(), bmi: calcu.caliculateBMI(), interpretation: calcu.getInterpretation(),);
              }));
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  'CALICULATE',
                  style: KBottomButtonStyle,
                ),
              ),
              color: Color(0xffeb1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomHeight,
            ),
          ),
        ],
      ),

    );
  }
}

