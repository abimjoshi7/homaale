import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_up/presentation/bloc/otp_reset_verify_bloc.dart';
import 'package:cipher/features/sign_up/presentation/pages/otp_sign_up.dart';
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
              Center(
                child: CustomElevatedButton(
                  callback: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      context.read<OtpResetVerifyBloc>().add(
                            OtpResendSignUpInitiated(
                              phoneNumber: "+977${phoneController.text}",
                            ),
                          );
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        OtpSignUp.routeName,
                        (route) => false,
                        arguments: {
                          'phone': '+977${phoneController.text}',
                          'password': '',
                        },
                      );
                    }
                  },
                  label: 'Continue',
                ),
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
