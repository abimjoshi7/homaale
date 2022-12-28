import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLogin extends StatefulWidget {
  static const routeName = "/facebook-login";
  const FacebookLogin({super.key});

  @override
  State<FacebookLogin> createState() => _FacebookLoginState();
}

class _FacebookLoginState extends State<FacebookLogin> {
  final fbInstance = FacebookAuth.instance;

  login() async {
    final map = <String, dynamic>{};
    final LoginResult result = await fbInstance.login();
    switch (result.status) {
      case LoginStatus.success:
        final accessToken = result.accessToken!;
        final userData = await fbInstance.getUserData();
        map.addAll(userData);
        map.remove("id");
        map.addAll(
          {
            "accessToken": accessToken.token,
            "userID": userData["id"],
          },
        );
        final x = await NetworkHelper().sendFacebookReq(map);
        if (kDebugMode) {
          print("Facebook Access Token: ${x.access}");
        }
        break;

      case LoginStatus.cancelled:
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Cancelled"),
          ),
        );
        break;
      case LoginStatus.failed:
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Failed. Please try again."),
          ),
        );
        break;
      default:
        if (kDebugMode) {
          print(result.status);
          print(result.message);
        }
        break;
    }
  }

  logout() async {
    await fbInstance.logOut();
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
          children: [
            GestureDetector(
              onTap: () async {},
              child: const Text(
                "Skip",
                style: kSkipHelper,
              ),
            ),
            kWidth10,
            const Icon(
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
          Image.asset("assets/logos/fblogo.png"),
          kHeight10,
          const Text(
            "Login with Facebook",
            style: kHeading1,
          ),
          kHeight20,
          const Text("Homaale is requesting access with Facebook."),
          const Text("Would you like to continue?"),
          kHeight20,
          kHeight20,
          kHeight20,
          kHeight20,
          kHeight20,
          kHeight20,
          const Text("This doesn't let the app post to Facebook"),
          kHeight20,
          CustomElevatedButton(
            callback: () async {
              await login();
            },
            label: "Continue",
          ),
          kHeight10,
          CustomElevatedButton(
            mainColor: Colors.white,
            textColor: const Color(0xff3D3F7D),
            callback: () async {
              await logout();
              if (!mounted) return;
              Navigator.pop(context);
            },
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
