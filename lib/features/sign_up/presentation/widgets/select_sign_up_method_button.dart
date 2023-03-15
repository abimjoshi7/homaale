import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:cipher/features/sign_up/presentation/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SelectSignUpMethodButton extends StatelessWidget {
  final SignUpState state;
  const SelectSignUpMethodButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (state.theStates == TheStates.initial) {
          FocusScope.of(context).unfocus();
          if (state.isPhoneNumber) {
            context.read<SignupBloc>().add(
                  const SignUpWithEmailSelected(),
                );
          }
          if (!state.isPhoneNumber) {
            context.read<SignupBloc>().add(
                  const SignUpWithPhoneSelected(),
                );
          }
        }
      },
      child: SignUpDisplayLogo(
        state: state,
      ),
    );
  }
}
