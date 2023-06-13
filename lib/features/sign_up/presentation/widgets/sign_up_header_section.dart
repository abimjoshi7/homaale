import 'package:cipher/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class SignUpHeaderSection extends StatelessWidget {
  const SignUpHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addVerticalSpace(
          12,
        ),
        Text(
          'Register',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          'Create your new account',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
