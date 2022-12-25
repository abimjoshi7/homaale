import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_phone.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/custom_timer.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpSignUp extends StatefulWidget {
  static const routeName = "/otp-sign-up";
  const OtpSignUp({super.key});

  @override
  State<OtpSignUp> createState() => _OtpSignUpState();
}

class _OtpSignUpState extends State<OtpSignUp> {
  String? otpValue;

  Widget _buildOTP() {
    return Pinput(
      length: 6,
      onCompleted: (value) {
        setState(
          () {
            otpValue = value;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        (ModalRoute.of(context)?.settings.arguments) as Map<String, String>;

    //! obscuring phone number
    String number = args["phone"]!.substring(1, args["phone"]!.length);
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
          const Text("Confirm OTP", style: kHeading1),
          kHeight5,
          Text(
            "Please enter the 6 digit code send to ${number.replaceRange(8, number.length, "*****")}",
            style: kHelper1,
          ),
          kHeight20,
          Expanded(
            child: Column(
              children: [
                _buildOTP(),
                kHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/timer.png"),
                    kWidth10,
                    const CustomTimer(),
                    kWidth20,
                    CustomTextButton(
                      text: "Resend",
                      voidCallback: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            callback: () async {
              try {
                final x = await NetworkHelper().verifyOTPSignUp(
                  otp: otpValue!,
                  phone: args["phone"]!,
                  scope: "verify",
                  password: args["password"]!,
                  confirmPassword: args["password"]!,
                );

                if (x.success == true) {
                  if (!mounted) return;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    SignInWithPhone.routeName,
                    (route) => false,
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Something went wrong. Try again"),
                  ),
                );
              }
            },
            label: "Continue",
          ),
          kHeight50,
        ],
      ),
    );
  }
}
