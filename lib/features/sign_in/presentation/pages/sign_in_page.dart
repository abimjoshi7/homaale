import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
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
          addVerticalSpace(MediaQuery.of(context).size.height * 0.025),
          InkWell(
            onTap: () async {
              DioHelper().refreshToken();
            },
            child: const Text('Welcome', style: kHeading1),
          ),
          const Text(
            'Login to your account',
            style: kHelper13,
          ),
          addVerticalSpace(MediaQuery.of(context).size.height * 0.0249),
          SignInFormFields(),
          addVerticalSpace(MediaQuery.of(context).size.height * 0.026),
          const FingerPrintSection(),
          addVerticalSpace(MediaQuery.of(context).size.height * 0.017),
          const SocialLoginSection(),
          addVerticalSpace(MediaQuery.of(context).size.height * 0.020),
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
          addVerticalSpace(MediaQuery.of(context).size.height * 0.020),
        ],
      ),
    );
  }
}
