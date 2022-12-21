import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/google_login.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FacebookLogin extends StatelessWidget {
  static const routeName = "/facebook-login";
  const FacebookLogin({super.key});

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
            callback: () {
              Navigator.pushNamed(context, GoogleLogin.routeName);
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
                "By continuing, Cagtu will receive ongoing access to the information that you share and Twitter will record when Cagtu accesses it. Learn more about this sharing and setting that you have.",
                textAlign: TextAlign.center),
          ),
          kHeight20,
          kHeight20,
          Text(
            "Privacy | Terms & Conditions",
            style: kHelper1,
          ),
        ],
      ),
    );
  }
}
