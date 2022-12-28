import 'package:cipher/features/onboarding/presentation/pages/onboarding.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_certifications.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_education.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_exprience.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_portfolio.dart';
import 'package:cipher/features/preference/presentation/pages/preference.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/sign_in/presentation/pages/confirm_otp_sign_in.dart';
import 'package:cipher/features/sign_in/presentation/pages/facebook_login.dart';
import 'package:cipher/features/sign_in/presentation/pages/forgot_password_with_email.dart';
import 'package:cipher/features/sign_in/presentation/pages/forgot_password_with_phone.dart';
import 'package:cipher/features/sign_in/presentation/pages/reset_password.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_email.dart';
import 'package:cipher/features/sign_up/presentation/pages/otp_sign_up.dart';
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
      case Onboarding.routeName:
        return MaterialPageRoute(
          builder: (context) => const Onboarding(),
        );
      case SignInWithPhone.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignInWithPhone(),
        );
      case SignInWithEmail.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignInWithEmail(),
        );
      case ForgotPasswordWithEmail.routeName:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordWithEmail(),
        );
      case ForgotPasswordWithPhone.routeName:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordWithPhone(),
        );
      case ConfirmOTPSignIn.routeName:
        return MaterialPageRoute(
          builder: (context) => const ConfirmOTPSignIn(),
          settings: settings,
        );
      case OtpSignUp.routeName:
        return MaterialPageRoute(
          builder: (context) => const OtpSignUp(),
          settings: settings,
        );
      case ResetPassword.routeName:
        return MaterialPageRoute(
          builder: (context) => const ResetPassword(),
          settings: settings,
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
      case Profile.routeName:
        return MaterialPageRoute(
          builder: (context) => const Profile(),
        );
      case AddPortfolio.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddPortfolio(),
        );
      case AddExperience.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddExperience(),
        );
      case AddEducation.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddEducation(),
        );
      case AddCertifications.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddCertifications(),
        );
      case Preference.routeName:
        return MaterialPageRoute(
          builder: (context) => const Preference(),
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
