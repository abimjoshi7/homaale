// ignore_for_file: lines_longer_than_80_chars

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});
  static const routeName = '/google-login';

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
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
        final x = await NetworkHelper().sendGoogleLoginReq(map);
        if (kDebugMode) {
          print('Google Access Token: ${x.access}');
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
      child: Column(
        children: [
          kHeight20,
          kHeight20,
          kHeight20,
          Image.asset('assets/logos/google_logo.png'),
          kHeight10,
          const Text(
            'Login with Google',
            style: kHeading1,
          ),
          kHeight20,
          const Text('Homaale is requesting access with Google.'),
          const Text('Would you like to continue?'),
          kHeight20,
          kHeight20,
          kHeight20,
          kHeight20,
          kHeight20,
          kHeight20,
          const Text("This doesn't let the app post to Google"),
          kHeight20,
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
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'By continuing, Cagtu will receive ongoing access to the information that you share and Twitter will record when Cagtu accesses it. Learn more about this sharing and setting that you have.',
              textAlign: TextAlign.center,
            ),
          ),
          kHeight20,
          kHeight20,
          const Text(
            'Privacy | Terms & Conditions',
            style: kHelper1,
          ),
        ],
      ),
    );
  }
}
