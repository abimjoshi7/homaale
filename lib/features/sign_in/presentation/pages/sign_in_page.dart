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
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                addVerticalSpace(10.0),
                InkWell(
                  onTap: () async {
                    DioHelper().refreshToken();
                  },
                  child:  Text('Welcome', style: Theme.of(context).textTheme.headlineSmall),
                ),
                 Text(
                  'Login to your account',
                  style:Theme.of(context).textTheme.bodySmall,
                  // kHelper13,
                ),
                // addVerticalSpace(20),
                SignInFormFields(),
                // addVerticalSpace(MediaQuery.of(context).size.height * 0.026),
                // const FingerPrintSection(), //TODO:implement fingerprint login
                addVerticalSpace(20.0),
                const SocialLoginSection(),
                addVerticalSpace(10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Don't have any account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          SignUpPage.routeName,
                        );
                      },
                      child:  Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
