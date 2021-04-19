import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:timer/widget/my_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //theme: ThemeData(
      //primarySwatch: Colors.teal,
      //),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF5722),
          title: Text("Timer app"),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: MyButton(
                    color: Color(0xFFFF9800),
                    onPressed: () {},
                    text: "30 Seg",
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: MyButton(
                    color: Color(0xFFFF9800),
                    onPressed: () {},
                    text: "1 Min",
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: MyButton(
                    color: Color(0xFFFF9800),
                    onPressed: () {},
                    text: "5 Min",
                  ),
                ),
              ],
            ),
            Expanded(
              child: CircularPercentIndicator(
                radius: 200.0,
                animation: true,
                animationDuration: 36000,
                lineWidth: 15.0,
                percent: 0.4,
                center: new Text(
                  "60 Seg.",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.yellow,
                progressColor: Colors.red,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MyButton(
                    color: Color(0xFFFF5722),
                    onPressed: () {},
                    text: "Iniciar",
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: MyButton(
                    color: Color(0xFF757575),
                    onPressed: () {},
                    text: "Parar",
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
