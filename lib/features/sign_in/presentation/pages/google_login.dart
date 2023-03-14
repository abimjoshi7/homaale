// ignore_for_file: lines_longer_than_80_chars

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
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
  final storage = const FlutterSecureStorage();
  final googleSignIn = GoogleSignIn(
    scopes: ['openid', 'email', 'profile'],
    clientId:
        '245846975950-vucoc2e1cmeielq5f5neoca7880n0u2i.apps.googleusercontent.com',
  );

  Future<void> signIn() async {
    try {
      final result = await googleSignIn.signIn();
      final authentication = await result?.authentication;
      if (authentication?.idToken != null) {
        final map = <String, dynamic>{};
        final idToken = authentication!.idToken;
        map.addAll(
          {
            'credential': idToken,
          },
        );
        // final x = await NetworkHelper().sendGoogleLoginReq(map);
        final x = await SignInRepository().sendGoogleLoginReq(map);
        if (kDebugMode) {
          print('Google Access Token: ${x.access}');
        }
        if (x.access != null) {
          await storage.write(
            key: CacheHelper.accessToken ?? '',
            value: x.access,
          );
          if (!mounted) return;
          await Navigator.pushNamedAndRemoveUntil(
            context,
            Root.routeName,
            (route) => false,
          );
        } else {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cannot Sign in. Please try again'),
            ),
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Google Sign-In Error');
      }
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
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
    return SignInScaffold(
      child: SizedBox.expand(
        child: Column(
          children: [
            addVerticalSpace(30),
            Image.asset('assets/logos/google_logo.png'),
            kHeight10,
            const Text(
              'Login with Google',
              style: kHeading1,
            ),
            kHeight20,
            const Text('Homaale is requesting access to your Google.'),
            const Text("This doesn't let the app post to Google"),
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
              callback: () {
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
    );
  }
}
