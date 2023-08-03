import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:flutter/material.dart';

class SignUpFooterSection extends StatelessWidget {
  const SignUpFooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?'),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              SignInPage.routeName,
            );
          },
          child: Text('Login', style: Theme.of(context).textTheme.headlineSmall),
        ),
      ],
    );
  }
}
