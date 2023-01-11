import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/presentation/pages/facebook_login.dart';
import 'package:cipher/features/sign_in/presentation/pages/google_login.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLoginWithEmailSection extends StatelessWidget {
  const SocialLoginWithEmailSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        Widget buildLogo() {
          if (state is SignInEmailInitial) {
            return Image.asset(
              'assets/logos/phone_logo.png',
            );
          } else if (state is SignInPhoneInitial) {
            return Image.asset(
              'assets/logos/mail_logo.png',
            );
          } else {
            return const SizedBox.shrink();
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
            kHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (state is SignInPhoneInitial) {
                      context.read<SignInBloc>().add(
                            SignInWithEmailSelected(),
                          );
                    } else if (state is SignInEmailInitial) {
                      context.read<SignInBloc>().add(
                            SignInWithPhoneSelected(),
                          );
                    }
                  },
                  child: buildLogo(),
                ),
                kWidth20,
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    GoogleLogin.routeName,
                  ),
                  child: Image.asset('assets/logos/google_logo.png'),
                ),
                kWidth20,
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    FacebookLogin.routeName,
                  ),
                  child: Image.asset('assets/logos/fb_logo.png'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
