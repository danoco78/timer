import 'package:flutter/material.dart';
import 'dart:async';
import 'package:timer/model/count.dart';
import 'package:timer/stream/count_stream.dart';
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
  String startStopLabel = "Inciar/Parar";

  final countStream = new CountStream();

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
                      countStream.setTime(30);
                      countStream.start();
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
                      countStream.setTime(60);
                      countStream.start();
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
                      countStream.setTime(300);
                      countStream.start();
                    },
                    text: "5 Min",
                  ),
                ),
              ],
            ),
            Expanded(
                child: StreamBuilder(
                    initialData: count,
                    stream: countStream.stream(),
                    builder: (_, AsyncSnapshot snapshot) {
                      print("en el stream builder");
                      print(snapshot);

                      if (snapshot.hasData) {
                        print(snapshot.data);
                      }
                      return Indicator(
                          count: snapshot.hasData ? snapshot.data : count);
                    })),
            Row(
              children: [
                Expanded(
                  child: MyButton(
                    color: Color(0xFFFF5722),
                    onPressed: startStop,
                    text: startStopLabel,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: MyButton(
                    color: Color(0xFF757575),
                    onPressed: reset,
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

  void startStop() {
    if (countStream.getActive()) {
      countStream.stop();
      setState(() {
        startStopLabel = "Iniciar";
      });
    } else {
      countStream.start();
      setState(() {
        startStopLabel = "Parar";
      });
    }
  }

  void reset() {
    setState(() {
      startStopLabel = "Parar";
    });
    countStream.reset();
  }
}
