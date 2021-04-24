import 'package:flutter/material.dart';
import 'dart:async';
import 'package:timer/model/count.dart';
import 'package:timer/widget/indicator.dart';
import 'package:timer/widget/my_button.dart';

import 'widget/indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Count count = Count('0', 1.0);
  Timer timer;
  int stop;
  int countTime;

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
                    onPressed: () {
                      countTime = 0;
                      stop = 30;
                      start();
                    },
                    text: "30 Seg",
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: MyButton(
                    color: Color(0xFFFF9800),
                    onPressed: () {
                      countTime = 0;
                      stop = 60;
                      start();
                    },
                    text: "1 Min",
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: MyButton(
                    color: Color(0xFFFF9800),
                    onPressed: () {
                      countTime = 0;
                      stop = 300;
                      start();
                    },
                    text: "5 Min",
                  ),
                ),
              ],
            ),
            Expanded(
                child: Indicator(
              count: count,
            )),
            Row(
              children: [
                Expanded(
                  child: MyButton(
                    color: Color(0xFFFF5722),
                    // ignore: unnecessary_statements
                    onPressed: timer == null ? null : startStop,
                    text: "Iniciar/Parar",
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: MyButton(
                    color: Color(0xFF757575),
                    onPressed: () {
                      countTime = 0;
                      start();
                    },
                    text: "Reiniciar",
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  start() {
    if (timer != null) timer.cancel();

    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      countTime++;
      setState(() {
        count.tag = countTime.toString();
        count.percent = countTime / stop;
      });
      print(countTime);
      print(timer.isActive);
      if (countTime >= stop) {
        timer.cancel();
        print("cancelando");
        print(timer.isActive);
      }
    });
  }

  startStop() {
    if (timer != null) {
      if (timer.isActive) {
        timer.cancel();
      } else {
        start();
      }
    }
  }
}
