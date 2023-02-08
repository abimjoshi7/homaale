import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/widgets/widgets.dart';
import 'package:cipher/features/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  static const routeName = '/sign-in-page';

  @override
  Widget build(BuildContext context) {
    return SignInScaffold(
      child: Column(
        children: [
          kHeight20,
          const Text('Welcome', style: kHeading1),
          const Text(
            'Login to your account',
            style: kHelper13,
          ),
          const Expanded(
            child: SignInFormFields(),
          ),
          kHeight20,
          const FingerPrintSection(),
          kHeight50,
          const SocialLoginSection(),
          kHeight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have any account?"),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    SignUpPage.routeName,
                  );
                },
                child: const Text(
                  'Sign Up',
                ),
              ),
            ],
          ),
          kHeight20,
        ],
      ),
    );
  }
}
