import 'package:flutter/material.dart';
import 'dart:math';

import 'dart:async';

import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer timer;
  int time = 8; //!in seconds
  void timeTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (time == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          time--;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff10002b),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button(timeTimer, 'time'),
              Text(
                formatText(time),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget button(Function onPress, String label) {
  return ElevatedButton(
    onPressed: onPress,
    child: Text(label),
  );
}

String formatText(int time) {
  String hours = ((time / 60) / 60).toStringAsFixed(0);
  String minutes = ((time - (int.parse(hours) * 3600)) / 60).toStringAsFixed(0);
  String seconds =
      (time - (int.parse(hours) * 3600) - (int.parse(minutes) * 60))
          .toStringAsFixed(0);

  // if (int.parse(hours) < 10) {
  //   hours = '0' + hours;
  // }
  if (int.parse(minutes) < 10) {
    minutes = '0' + minutes;
  }
  if (int.parse(seconds) < 10) {
    seconds = '0' + seconds;
  }

  return hours + ':' + minutes + ':' + seconds;
}
