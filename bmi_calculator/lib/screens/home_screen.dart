import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: kInactiveCardColour,
                    cardChild: IconContentWidget(),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kInactiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: kInactiveCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: kInactiveCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kInactiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: kBottomContainerHeight,
            color: kAppSecondaryAccentColor,
            child: FlatButton(
              child: Text(
                'CALCULATE',
                style: kBottomCalculateButtonTextStyle,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class IconContentWidget extends StatelessWidget {
  IconContentWidget({this.icon, this.title});
  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.mars,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          'Male',
          style: kBottomCalculateButtonTextStyle,
        ),
      ],
    );
  }
}
