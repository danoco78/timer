import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:timer/model/count.dart';

class Indicator extends StatelessWidget {

  final Count count;

  const Indicator({@required this.count}) : super();

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 250.0,
      //animation: true,
      animationDuration: 36000,
      lineWidth: 15.0,
      percent: count.percent,
      center: new Text(
        "${count.tag}",
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Color(0xFF757575),
      progressColor: Color(0xFFFF9800),
    );
  }
}
