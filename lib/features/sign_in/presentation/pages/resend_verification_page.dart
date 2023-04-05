import 'dart:async';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/bloc/forgot_password_bloc.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ResendVerificationPage extends StatefulWidget {
  const ResendVerificationPage({super.key});
  static const routeName = '/resend-verification-page';

  @override
  State<ResendVerificationPage> createState() => _ResendVerificationPageState();
}

class _ResendVerificationPageState extends State<ResendVerificationPage> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        Widget buildHeaderText() {
          if (state.theStates == TheStates.initial) ;
          if (!state.isPhoneNumber) {
            return const Text('Resend Verification Email', style: kHeading1);
          }
          return const Text('Resend OTP', style: kHeading1);
        }

        Widget displayText() {
          if (state.theStates == TheStates.initial) ;
          if (!state.isPhoneNumber) {
            return const Text('Email', style: kLabelPrimary);
          }

          return const Text('Phone', style: kLabelPrimary);
        }

        Widget displayText2() {
          if (state.theStates == TheStates.initial) ;
          if (!state.isPhoneNumber) {
            return const Text(
              'A verification link will be re-sent to your email.',
              style: kBodyText1,
            );
          } else {
            return const Text(
              'An otp will be re-sent to your phone.',
              style: kBodyText1,
            );
          }
        }

        Widget displayTextField() {
          if (state.theStates == TheStates.initial) ;
          if (!state.isPhoneNumber) {
            return CustomTextFormField(
              onSaved: (p0) => setState(
                () {
                  emailController.text = p0!;
                },
              ),
              hintText: 'Enter your email here',
              validator: validateNotEmpty,
            );
          } else {
            return CustomTextFormField(
              onSaved: (p0) => setState(
                () {
                  phoneController.text = p0!;
                },
              ),
              hintText: 'Enter your phone number here',
              validator: validateNotEmpty,
            );
          }
        }

        return SignInScaffold(
          child: Column(
            children: <Widget>[
              kHeight20,
              kHeight20,
              buildHeaderText(),
              kHeight5,
              const Text(
                'Hey, No Worries!👋',
                style: kHelper13,
              ),
              kHeight20,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        displayText(),
                        kHeight10,
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Form(
                                key: _formKey,
                                child: displayTextField(),
                              ),
                            ),
                          ],
                        ),
                        kHeight20,
                        displayText2(),
                      ],
                    ),
                  ),
                ),
              ),
              BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                listener: (context, state) async {
                  final x = await CacheHelper.getCachedString(kErrorLog);
                  if (state is ForgotPasswordWithEmailSuccess) {
                    if (!mounted) return;
                    await showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                        heading: 'Success',
                        content: 'Verify your email',
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
                  if (state is ForgotPasswordWithPhoneSuccess) {
                    if (!mounted) return;
                    await showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                        heading: 'Success',
                        content: 'OTP generated successfully',
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            ConfirmOtpPage.routeName,
                            (route) => false,
                            arguments: phoneController.text,
                          );
                        },
                        isSuccess: true,
                      ),
                    );
                  }
                  if (state is ForgotPasswordFailure) {
                    if (!mounted) return;
                    await showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                        heading: 'Failure',
                        content: x ?? '',
                        onTap: () {},
                        isSuccess: false,
                      ),
                    );
                  }
                },
                builder: (context, state2) {
                  return Center(
                    child: CustomElevatedButton(
                      callback: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if (state.theStates == TheStates.initial) return;
                          if (!state.isPhoneNumber) {
                            context.read<ForgotPasswordBloc>().add(
                                  ForgotPasswordEmailInitiated(
                                    emailController.text,
                                  ),
                                );
                          }
                          if (state.isPhoneNumber) {
                            context.read<ForgotPasswordBloc>().add(
                                  ForgotPasswordPhoneInitiated(
                                    "+977${phoneController.text}",
                                  ),
                                );
                          }
                        }
                      },
                      label: 'Continue',
                    ),
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
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
