import 'package:cipher/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';

class SignUpBuildText extends StatelessWidget {
  final SignUpState state;
  const SignUpBuildText({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Text(
      (state.isPhoneNumber)
          ? 'Or Sign Up with Email instead'
          : 'Or Sign Up with Phone instead',
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
