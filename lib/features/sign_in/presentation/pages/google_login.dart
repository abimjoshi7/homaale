import 'package:cipher/core/app/initial_data_fetch.dart';
import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
import 'package:cipher/widgets/loading_widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});
  static const routeName = '/google-login';

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  bool isLoading = false;
  final storage = const FlutterSecureStorage();
  final googleSignIn = GoogleSignIn(
    scopes: ['openid', 'email', 'profile'],
    serverClientId:
        '245846975950-vucoc2e1cmeielq5f5neoca7880n0u2i.apps.googleusercontent.com',
  );

  Future<void> signIn() async {
    try {
      setState(() {
        isLoading = true;
      });
      final result = await googleSignIn.signIn();
      final authentication = await result?.authentication;
      if (authentication?.idToken != null) {
        final idToken = authentication!.idToken;
        final x = await SignInRepository()
            .sendGoogleLoginReq({'credential': idToken});
        if (x.access != null) {
          CacheHelper.hasProfile = x.hasProfile;
          CacheHelper.accessToken = x.access;
          CacheHelper.refreshToken = x.refresh;
          CacheHelper.isLoggedIn = true;

          if (!mounted) return;

          // fetch user details
          if (CacheHelper.hasProfile ?? false) {
            userDetailsFetch(context);
          }

          // fetch data for app
          fetchDataForForms(context);

          Future.delayed(Duration(seconds: 2), () {
            setState(() {
              isLoading = false;
            });
            Navigator.pushNamedAndRemoveUntil(
              context,
              Root.routeName,
              (route) => false,
            );
          });
        } else {
          setState(() {
            isLoading = false;
          });
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cannot Sign in. Please try again'),
            ),
          );
        }
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (kDebugMode) {
        print('Google Sign-In Error');
      }
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      CacheHelper.isLoggedIn = true;
      await googleSignIn.signOut();
    } catch (e) {
      if (kDebugMode) {
        print('Google Sign-Out Error');
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      isLoading: isLoading,
      child: SignInScaffold(
        child: SizedBox.expand(
          child: Column(
            children: [
              addVerticalSpace(30),
              Image.asset('assets/logos/google_logo.png'),
              kHeight10,
              Text(
                'Login with Google',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              kHeight20,
              const Text('Homaale is requesting access to your Google.'),
              const Text("This doesn't let the app post to Google."),
              addVerticalSpace(50),
              const Text('Would you like to continue?'),
              addVerticalSpace(20),
              CustomElevatedButton(
                callback: () async {
                  try {
                    await signIn();
                  } catch (e) {
                    rethrow;
                  }
                },
                label: 'Continue',
              ),
              kHeight10,
              CustomElevatedButton(
                mainColor: Colors.white,
                textColor: const Color(0xff3D3F7D),
                callback: () async {
                  await signOut();
                  Navigator.pop(context);
                },
                label: 'Cancel',
              ),
              addVerticalSpace(60),
              const Text(
                'Privacy | Terms & Conditions',
                style: kText15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
