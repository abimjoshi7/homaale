import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/reset_password.dart';
import 'package:cipher/widgets/custom_timer.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class ConfirmOTPSignIn extends StatefulWidget {
  const ConfirmOTPSignIn({super.key});
  static const routeName = '/confirm-otp-sign-in';

  @override
  State<ConfirmOTPSignIn> createState() => _ConfirmOTPSignInState();
}

class _ConfirmOTPSignInState extends State<ConfirmOTPSignIn> {
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
    final args = (ModalRoute.of(context)?.settings.arguments ?? '') as String;

    //! obscuring phone number
    final number = args.substring(1, args.length);
    return SignInScaffold(
      child: Column(
        children: [
          kHeight20,
          kHeight20,
          const Text('Confirm OTP', style: kHeading1),
          kHeight5,
          Text(
            "Please enter the 6 digit code send to ${number.replaceRange(8, number.length, "*****")}",
            style: kHelper13,
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
                    Image.asset('assets/timer.png'),
                    kWidth10,
                    const CustomTimer(),
                    kWidth20,
                    CustomTextButton(
                      text: 'Resend',
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
                await Navigator.pushNamed(
                  context,
                  ResetPassword.routeName,
                  arguments: {
                    'otp': otpValue!,
                    'phone': args,
                    'scope': 'reset',
                  },
                );

                // final x = await NetworkHelper().verifyOTP(
                //   otp: otpValue!,
                //   phone: args,
                //   scope: "reset",
                // );

                // if (x.success == true) {
                //   if (!mounted) return;
                //   Navigator.pushNamed(
                //     context,
                //     ResetPassword.routeName,
                //     arguments: {
                //       "otp": otpValue!,
                //       "phone": args,
                //       "scope": "reset",
                //     },
                //   );
                // }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Something went wrong. Try again'),
                  ),
                );
              }
            },
            label: 'Continue',
          ),
          kHeight50,
        ],
      ),
    );
  }
}
