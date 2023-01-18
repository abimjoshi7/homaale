// ignore_for_file: lines_longer_than_80_chars

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_up/data/models/otp_reset_verify_req.dart';
import 'package:cipher/features/sign_up/presentation/bloc/otp_reset_verify_bloc.dart';
import 'package:cipher/widgets/custom_timer.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpSignUp extends StatefulWidget {
  const OtpSignUp({super.key});
  static const routeName = '/otp-sign-up';

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
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    //! obscuring phone number
    final number = args!['phone']!.substring(1, args['phone']?.length);
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
          BlocConsumer<OtpResetVerifyBloc, OtpResetVerifyState>(
            listener: (context, state) {},
            builder: (context, state) {
              return CustomElevatedButton(
                callback: () async {
                  try {
                    final otpResetVerifyReq = OtpResetVerifyReq(
                      otp: otpValue,
                      phone: args['phone'],
                      scope: 'verify',
                      password: args['password'],
                      confirmPassword: args['password'],
                    );

                    context.read<OtpResetVerifyBloc>().add(
                          OtpResetVerifyInitiated(
                            initiateEvent: otpResetVerifyReq,
                          ),
                        );

                    // if (!mounted) return;
                    // await Navigator.pushNamedAndRemoveUntil(
                    //   context,
                    //   SignInPage.routeName,
                    //   (route) => false,
                    // );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Something went wrong. Try again'),
                      ),
                    );
                  }
                },
                label: 'Continue',
              );
            },
          ),
          kHeight50,
        ],
      ),
    );
  }
}
