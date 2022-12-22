import 'dart:async';
import 'package:flutter/material.dart';

class CustomTimer extends StatefulWidget {
  const CustomTimer({
    super.key,
  });

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  late Timer _timer;
  int _start = 60;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text("$_start seconds");
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
