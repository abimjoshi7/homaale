import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:cipher/features/sign_up/data/models/otp_reset_verify_req.dart';
import 'package:cipher/features/sign_up/presentation/bloc/otp_reset_verify_bloc.dart';
import 'package:cipher/widgets/custom_timer.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      length: 6,
      onCompleted: (value) {
        setState(
          () => otpValue = value,
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
        children: <Widget>[
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
              children: <Widget>[
                _buildOTP(),
                kHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/timer.png'),
                    kWidth10,
                    const CustomTimer(),
                    kWidth20,
                    CustomTextButton(
                      text: 'Resend',
                      voidCallback: () {
                        context.read<OtpResetVerifyBloc>().add(
                            OtpResendSignUpInitiated(
                                phoneNumber: args['phone'].toString()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          BlocConsumer<OtpResetVerifyBloc, OtpResetVerifyState>(
            listener: (context, state) async {
              final error = await CacheHelper.getCachedString(kErrorLog);
              if (state is OtpResetVerifySuccess) {
                if (!mounted) return;
                await showDialog(
                  context: context,
                  builder: (context) => CustomToast(
                    heading: 'Success',
                    content: 'Signed up successfully',
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        SignInPage.routeName,
                        (route) => false,
                      );
                    },
                    isSuccess: true,
                  ),
                );
              } else if (state is OtpResetVerifyFailure) {
                if (!mounted) return;
                await showDialog(
                  context: context,
                  builder: (context) => CustomToast(
                    heading: 'Failure',
                    content: error ?? 'Please try again',
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        SignInPage.routeName,
                        (route) => false,
                      );
                    },
                    isSuccess: true,
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomElevatedButton(
                callback: () async {
                  context.read<OtpResetVerifyBloc>().add(
                        OtpResetVerifyInitiated(
                          initiateEvent: OtpResetVerifyReq(
                            otp: otpValue,
                            phone: args['phone'],
                            scope: 'verify',
                            password: args['password'],
                            confirmPassword: args['password'],
                          ),
                        ),
                      );
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
