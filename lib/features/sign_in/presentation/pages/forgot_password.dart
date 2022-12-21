import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/confirm_otp.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  static const routeName = "/forgot-password";
  const ForgotPassword({super.key});

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
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          kHeight20,
          kHeight20,
          const Text("Forgot Password", style: kHeading1),
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
                  const Text("Email/Phone", style: kLabelPrimary),
                  kHeight10,
                  Row(
                    children: [
                      Flexible(
                        child: CustomTextFormField(
                          hintText: "Enter your email/phone number here",
                        ),
                      ),
                    ],
                  ),
                  kHeight20,
                  const Text(
                    "An OTP code will be sent to your email/phone number.",
                    style: kBodyText1,
                  ),
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
                      Navigator.pushNamed(context, ConfirmOTP.routeName);
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
