import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUpDisplayLogo extends StatelessWidget {
  final SignUpState state;
  const SignUpDisplayLogo({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.theStates == TheStates.initial) {
      return Image.asset(
        (!state.isPhoneNumber)
            ? 'assets/logos/phone_logo.png'
            : 'assets/logos/mail_logo.png',
      );
    }
    return const CustomLoader();
  }
}
