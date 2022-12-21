import 'package:cipher/features/sign_in/presentation/pages/confirm_otp.dart';
import 'package:cipher/features/sign_in/presentation/pages/facebook_login.dart';
import 'package:cipher/features/sign_in/presentation/pages/forgot_password.dart';
import 'package:cipher/features/sign_in/presentation/pages/reset_password.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_email.dart';
import 'package:cipher/features/sign_up/presentation/pages/sign_up_with_email.dart';
import 'package:cipher/features/sign_up/presentation/pages/sign_up_with_phone.dart';
import 'package:cipher/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

import 'features/sign_in/presentation/pages/google_login.dart';
import 'features/sign_in/presentation/pages/sign_in_with_phone.dart';

class RouteService {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case SignInWithPhone.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignInWithPhone(),
        );
      case SignInWithEmail.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignInWithEmail(),
        );
      case ForgotPassword.routeName:
        return MaterialPageRoute(
          builder: (context) => const ForgotPassword(),
        );
      case ConfirmOTP.routeName:
        return MaterialPageRoute(
          builder: (context) => const ConfirmOTP(),
          settings: settings,
        );
      case ResetPassword.routeName:
        return MaterialPageRoute(
          builder: (context) => const ResetPassword(),
        );
      case FacebookLogin.routeName:
        return MaterialPageRoute(
          builder: (context) => const FacebookLogin(),
        );
      case GoogleLogin.routeName:
        return MaterialPageRoute(
          builder: (context) => const GoogleLogin(),
        );
      case SignUpWithPhone.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignUpWithPhone(),
        );
      case SignUpWithEmail.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignUpWithEmail(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Page not found"),
            ),
          ),
        );
    }
  }
}
