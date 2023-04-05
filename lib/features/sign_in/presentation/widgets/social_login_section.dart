import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/presentation/pages/facebook_login.dart';
import 'package:cipher/features/sign_in/presentation/pages/google_login.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (_, state) {
        Widget buildLogo() {
          if (state.theStates == TheStates.initial) ;

          if (!state.isPhoneNumber) {
            return Image.asset(
              'assets/logos/phone_logo.png',
            );
          } else {
            return Image.asset(
              'assets/logos/mail_logo.png',
            );
          }
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Flexible(
                  child: CustomHorizontalDivider(),
                ),
                kWidth5,
                Text(
                  'Or login with',
                  style: kHelper13,
                ),
                kWidth5,
                Flexible(
                  child: CustomHorizontalDivider(),
                ),
              ],
            ),
            addVerticalSpace(MediaQuery.of(context).size.height * 0.020),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                kWidth20,
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if (state.theStates == TheStates.initial) {
                      if (state.isPhoneNumber) {
                        context.read<SignInBloc>().add(
                              SignInWithEmailSelected(),
                            );
                      }
                      if (!state.isPhoneNumber) {
                        context.read<SignInBloc>().add(
                              SignInWithPhoneSelected(),
                            );
                      }
                    }
                  },
                  child: buildLogo(),
                ),
                // kWidth20,
                //TODO:implement google sign in and apple sign in
                // GestureDetector(
                //   onTap: () => Navigator.pushNamed(
                //     context,
                //     GoogleLogin.routeName,
                //   ),
                //   child: Image.asset('assets/logos/google_logo.png'),
                // ),
                kWidth20,
                //TODO:implement facebook sign in
                // GestureDetector(
                //   onTap: () => Navigator.pushNamed(
                //     context,
                //     FacebookLogin.routeName,
                //   ),
                //   child: Image.asset('assets/logos/fb_logo.png'),
                // ),
              ],
            ),
          ],
        );
      },
    );
  }
}
