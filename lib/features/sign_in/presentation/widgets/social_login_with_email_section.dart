import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/facebook_login.dart';
import 'package:cipher/features/sign_in/presentation/pages/google_login.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_email.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SocialLoginWithEmailSection extends StatelessWidget {
  const SocialLoginWithEmailSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              style: kHelper1,
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
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                SignInWithEmail.routeName,
                (route) => false,
              ),
              child: Image.asset(
                'assets/logos/mail_logo.png',
              ),
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
  }
}
