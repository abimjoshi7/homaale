import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_email.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWithEmail extends StatefulWidget {
  const ForgotPasswordWithEmail({super.key});
  static const routeName = '/forgot-password-with-email';

  @override
  State<ForgotPasswordWithEmail> createState() =>
      _ForgotPasswordWithEmailState();
}

class _ForgotPasswordWithEmailState extends State<ForgotPasswordWithEmail> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SignInScaffold(
      child: Column(
        children: [
          kHeight20,
          kHeight20,
          const Text('Forgot Password', style: kHeading1),
          kHeight5,
          const Text(
            'Recover your password',
            style: kHelper1,
          ),
          kHeight20,
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email', style: kLabelPrimary),
                  kHeight10,
                  Row(
                    children: [
                      Flexible(
                        child: Form(
                          key: _formKey,
                          child: CustomTextFormField(
                            onSaved: (p0) => setState(
                              () {
                                emailController.text = p0!;
                              },
                            ),
                            hintText: 'Enter your email here',
                          ),
                        ),
                      ),
                    ],
                  ),
                  kHeight20,
                  const Text(
                    'An OTP code will be sent to your email.',
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
                    callback: () async {
                      _formKey.currentState!.save();
                      try {
                        final x = await NetworkHelper().resetPasswordwithEmail(
                          email: emailController.text,
                        );
                        if (x.statusCode == 201) {
                          if (!mounted) return;
                          await Navigator.pushNamedAndRemoveUntil(
                            context,
                            SignInWithEmail.routeName,
                            (route) => false,
                          );
                        }
                      } catch (e) {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Something went wrong. Please try again',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }

                      // print(x);
                      // print(x.statusCode);
                      // print(x.statusMessage);
                    },
                    label: 'Continue',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
