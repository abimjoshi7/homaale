import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/facebook_login.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  static const routeName = "/reset-password";
  const ResetPassword({super.key});

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          kHeight20,
          kHeight20,
          const Text("Reset Password", style: kHeading1),
          kHeight5,
          const Text(
            "Recover your password",
            style: kHelper1,
          ),
          kHeight20,
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("New Password", style: kLabelPrimary),
                  kHeight10,
                  Row(
                    children: const [
                      Flexible(
                        child: CustomTextFormField(),
                      ),
                    ],
                  ),
                  kHeight20,
                  const Text("Confirm Password", style: kLabelPrimary),
                  kHeight10,
                  Row(
                    children: const [
                      Flexible(
                        child: CustomTextFormField(),
                      ),
                    ],
                  ),
                  kHeight20,
                  kHeight20,
                  kHeight20,
                  kHeight20,
                  kHeight20,
                  kHeight20,
                  kHeight20,
                  kHeight20,
                  kHeight20,
                  CustomElevatedButton(
                    callback: () {
                      Navigator.pushNamed(context, FacebookLogin.routeName);
                    },
                    label: "Continue",
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
