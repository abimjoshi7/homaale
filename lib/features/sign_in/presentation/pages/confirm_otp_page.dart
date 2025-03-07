import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/bloc/forgot_password_bloc.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:cipher/features/sign_up/data/models/otp_reset_verify_req.dart';
import 'package:cipher/widgets/custom_timer.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ConfirmOtpPage extends StatefulWidget {
  const ConfirmOtpPage({super.key});
  static const routeName = '/confirm-otp-page';

  @override
  State<ConfirmOtpPage> createState() => _ConfirmOtpPageState();
}

class _ConfirmOtpPageState extends State<ConfirmOtpPage> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  String? otpValue;
  String? number;
  bool isNewObscure = true;
  bool isConfirmObscure = true;

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
      listener: (context, state) async {
        final error = await CacheHelper.getCachedString(
          kErrorLog,
        );
        if (state is ForgotPasswordResetSuccess) {
          if (!mounted) return;
          await showDialog(
            context: context,
            builder: (_) => CustomToast(
              heading: 'Success',
              content: "Password change successfully",
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
        if (state is ForgotPasswordResetFailure) {
          if (!mounted) return;
          await showDialog(
            context: context,
            builder: (_) => CustomToast(
              heading: 'Failure',
              content: error ?? "Password change failed",
              onTap: () {},
              isSuccess: false,
            ),
          );
        }
      },
      builder: (context, state) {
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
                        CustomTimer(
                          args: {"phone": args},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomElevatedButton(
                callback: () async {
                  try {
                    if (otpValue == null || otpValue!.isEmpty) {
                      if (!mounted) return;
                      await showDialog(
                        context: context,
                        builder: (_) => CustomToast(
                          heading: 'Failure',
                          content: "OTP Field Cannot Be Empty",
                          onTap: () {},
                          isSuccess: false,
                        ),
                      );
                    }
                    if (otpValue == null || otpValue!.isEmpty) return;
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            kHeight50,
                            const Text('Reset Password', style: kHeading1),
                            kHeight5,
                            const Text(
                              'Recover your password',
                              style: kHelper13,
                            ),
                            kHeight20,
                            StatefulBuilder(
                              builder: (context, setState) => Form(
                                key: _key,
                                child: Padding(
                                  padding: kPadding20,
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Text(
                                          'New Password',
                                          style: kLabelPrimary,
                                        ),
                                        kHeight10,
                                        Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: CustomTextFormField(
                                                obscureText: isNewObscure,
                                                validator: validatePassword,
                                                onSaved: (p0) => setState(
                                                  () {
                                                    passwordController.text =
                                                        p0!;
                                                  },
                                                ),
                                                suffixWidget: IconButton(
                                                  color: kColorPrimary,
                                                  icon: isNewObscure
                                                      ? Icon(Icons
                                                          .visibility_rounded)
                                                      : Icon(
                                                          Icons
                                                              .visibility_off_rounded,
                                                        ),
                                                  onPressed: () => setState(
                                                      () => isNewObscure =
                                                          !isNewObscure),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        kHeight20,
                                        const Text(
                                          'Confirm Password',
                                          style: kLabelPrimary,
                                        ),
                                        kHeight10,
                                        Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: CustomTextFormField(
                                                obscureText: isConfirmObscure,
                                                validator: validatePassword,
                                                onSaved: (p0) => setState(
                                                  () =>
                                                      confirmPasswordController
                                                          .text = p0!,
                                                ),
                                                suffixWidget: InkWell(
                                                  onTap: () {
                                                    setState(
                                                      () => isConfirmObscure =
                                                          !isConfirmObscure,
                                                    );
                                                  },
                                                  child: Icon(
                                                    color: kColorPrimary,
                                                    isConfirmObscure
                                                        ? Icons
                                                            .visibility_rounded
                                                        : Icons
                                                            .visibility_off_rounded,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CustomElevatedButton(
                              callback: () async {
                                if (_key.currentState!.validate()) {
                                  _key.currentState!.save();
                                  context.read<ForgotPasswordBloc>().add(
                                        ForgotPasswordPhoneResetInitiated(
                                          OtpResetVerifyReq(
                                            phone: "+977$args",
                                            otp: otpValue,
                                            scope: 'reset',
                                            password: passwordController.text,
                                            confirmPassword:
                                                confirmPasswordController.text,
                                          ),
                                        ),
                                      );
                                }
                              },
                              label: 'Continue',
                            ),
                            kHeight50
                          ],
                        ),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Something went wrong. Try again.'),
                      ),
                    );
                  }
                },
                label: 'Continue',
              ),
              kHeight15,
              CustomElevatedButton(
                label: 'Cancel',
                mainColor: Colors.white,
                textColor: kColorPrimary,
                callback: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    SignInPage.routeName,
                    (route) => false,
                  );
                },
              ),
              kHeight50,
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
