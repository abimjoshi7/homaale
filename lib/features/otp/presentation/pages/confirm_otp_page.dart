import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/otp/data/repositories/otp_repositories.dart';
import 'package:cipher/features/sign_in/presentation/bloc/forgot_password_bloc.dart';
import 'package:cipher/widgets/custom_timer.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class ConfirmOtpPage extends StatefulWidget {
  const ConfirmOtpPage({super.key});
  static const routeName = '/confirm-otp-page';

  @override
  State<ConfirmOtpPage> createState() => _ConfirmOtpPageState();
}

class _ConfirmOtpPageState extends State<ConfirmOtpPage> {
  String? otpValue;
  String? number;

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
    final number = args.substring(0, args.length);
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ForgotPasswordWithPhoneSuccess) {
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
                            voidCallback: () async {
                              await OtpRepositories().verifyOTP(
                                phone: args,
                                otp: '1234',
                                scope: 'verify',
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  callback: () async {
                    try {
                      // await Navigator.pushNamed(
                      //   context,
                      //   ResetPassword.routeName,
                      //   arguments: {
                      //     'otp': otpValue!,
                      //     'phone': args,
                      //     'scope': 'reset',
                      //   },
                      // );

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
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
