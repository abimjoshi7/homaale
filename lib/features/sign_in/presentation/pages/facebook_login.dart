import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_scaffold.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kHeight20,
          kHeight20,
          kHeight20,
          Image.asset("assets/logos/fblogo.png"),
          kHeight10,
          Text(
            "Login with Facebook",
            style: kHeading1,
          ),
          kHeight20,
          Text("Homaale is requesting access with Facebook."),
          Text("Would you like to continue?"),
          kHeight20,
          kHeight20,
          kHeight20,
          kHeight20,
          kHeight20,
          kHeight20,
          kHeight20,
          kHeight20,
          Text("This doesn't let the app post to Facebook"),
          CustomElevatedButton(
            callback: () {},
            label: "Continue",
          )
        ],
      ),
    );
  }
}
