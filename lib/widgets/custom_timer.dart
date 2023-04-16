import 'dart:async';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_up/presentation/bloc/otp_reset_verify_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CustomTimer extends StatefulWidget {
  const CustomTimer({
    super.key,
    this.args,
  });
  final Map<String, String>? args;
  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  late Timer _timer;
  int _start = 60;
  bool _resendEnabled = false;

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
            _resendEnabled = true;
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
    return Row(
      children: <Widget>[
        Text('$_start seconds'),
        kWidth20,
        (_resendEnabled)
            ? CustomTextButton(
                text: 'Resend',
                voidCallback: () {
                  context.read<OtpResetVerifyBloc>().add(
                      OtpResendSignUpInitiated(
                          phoneNumber: widget.args!['phone'].toString()));
                  setState(() {
                    _start = 60;
                    _resendEnabled = false;
                  });
                  startTimer();
                },
              )
            : SizedBox(),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
