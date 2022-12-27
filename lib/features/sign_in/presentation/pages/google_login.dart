import 'dart:convert';
import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin extends StatefulWidget {
  static const routeName = "/google-login";
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  final googleSignIn = GoogleSignIn(
    scopes: ['openid', 'email', 'profile'],
    clientId:
        "245846975950-vucoc2e1cmeielq5f5neoca7880n0u2i.apps.googleusercontent.com",
  );

  signIn() async {
    try {
      await googleSignIn.signIn();
    } catch (e) {
      if (kDebugMode) {
        print("Google Sign-In Error");
      }
      rethrow;
    }
  }

  signOut() async {
    try {
      await googleSignIn.signOut();
    } catch (e) {
      if (kDebugMode) {
        print("Google Sign-Out Error");
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      leadingWidget: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      trailingWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Skip",
              style: kSkipHelper,
            ),
            kWidth10,
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
              color: Color(0xffdee2e6),
            )
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kHeight20,
          kHeight20,
          kHeight20,
          Image.asset("assets/logos/googlelogo.png"),
          kHeight10,
          const Text(
            "Login with Google",
            style: kHeading1,
          ),
          kHeight20,
          const Text("Homaale is requesting access with Google."),
          const Text("Would you like to continue?"),
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
                final map = <String, dynamic>{};
                final idToken =
                    await googleSignIn.currentUser!.authentication.then(
                  (value) => value.idToken,
                );
                map.addAll(
                  {
                    "credential": idToken,
                  },
                );
                final x = await NetworkHelper().sendGoogleLoginReq(map);
                print(x.access);
              } catch (e) {
                rethrow;
              }
            },
            label: "Continue",
          ),
          kHeight10,
          CustomElevatedButton(
            mainColor: Colors.white,
            textColor: const Color(0xff3D3F7D),
            callback: () {},
            label: "Cancel",
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
                "By continuing, Cagtu will receive ongoing access to the information that you share and Twitter will record when Cagtu accesses it. Learn more about this sharing and setting that you have.",
                textAlign: TextAlign.center),
          ),
          kHeight20,
          kHeight20,
          const Text(
            "Privacy | Terms & Conditions",
            style: kHelper1,
          ),
        ],
      ),
    );
  }
}
