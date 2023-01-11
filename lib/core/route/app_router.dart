import 'package:cipher/core/app/root.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/kyc_details_organizaton.dart';
import 'package:cipher/features/account_settings/presentation/pages/pages.dart';
import 'package:cipher/features/home/presentation/pages/home.dart';
import 'package:cipher/features/onboarding/presentation/pages/onboarding.dart';
import 'package:cipher/features/portfolio/presentation/pages/pages.dart';
import 'package:cipher/features/preference/presentation/pages/preference.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/features/sign_up/presentation/pages/pages.dart';
import 'package:cipher/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case Onboarding.routeName:
        return MaterialPageRoute(
          builder: (context) => const Onboarding(),
        );
      case Root.routeName:
        return MaterialPageRoute(
          builder: (context) => const Root(),
        );
      case SignIn.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignIn(),
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
      case Home.routeName:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case Account.routeName:
        return MaterialPageRoute(
          builder: (context) => const Account(),
        );
      case Settings.routeName:
        return MaterialPageRoute(
          builder: (context) => const Settings(),
        );
      case CompleteProfilePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const CompleteProfilePage(),
        );
      case KycDetails.routeName:
        return MaterialPageRoute(
          builder: (context) => const KycDetails(),
        );
      case KycDetailsOrganization.routeName:
        return MaterialPageRoute(
          builder: (context) => const KycDetailsOrganization(),
        );
      case SavedPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SavedPage(),
        );
      case Membership.routeName:
        return MaterialPageRoute(
          builder: (context) => const Membership(),
        );
      case ConnectedAccountPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ConnectedAccountPage(),
        );
      case NotificationsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const NotificationsPage(),
        );
      case LanguagesPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const LanguagesPage(),
        );
      case BillingAndPaymentPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const BillingAndPaymentPage(),
        );
      case HelpAndLegalPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const HelpAndLegalPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
