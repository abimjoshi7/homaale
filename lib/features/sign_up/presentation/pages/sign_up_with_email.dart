// ignore_for_file: duplicate_ignore, lines_longer_than_80_chars

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_email.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_phone.dart';
import 'package:cipher/features/sign_up/presentation/pages/sign_up_with_phone.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({super.key});
  static const String routeName = '/sign-up-with-email';

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            CustomHeader(
              leadingWidget: IconButton(
                onPressed: () {
                  if (!mounted) return;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    SignInWithPhone.routeName,
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.arrow_back),
              ),
              trailingWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: const [
                    Text(
                      'Skip',
                      style: kSkipHelper,
                    ),
                    kWidth10,
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                      color: Color(0xffdee2e6),
                    )
                  ],
                ),
              ),
            ),
            const Text(
              'Register',
              style: kHeading1,
            ),
            const Text(
              'Create your new account',
              style: kHelper1,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: kLabelPrimary,
                        ),
                        kHeight5,
                        Row(
                          children: [
                            Flexible(
                              child: CustomTextFormField(
                                onSaved: (p0) => setState(() {
                                  emailController.text = p0!;
                                }),
                                hintText: 'Enter your email here',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    kHeight20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Password',
                          style: kLabelPrimary,
                        ),
                        kHeight5,
                        Row(
                          children: [
                            Flexible(
                              child: CustomTextFormField(
                                onSaved: (p0) => setState(() {
                                  passwordController.text = p0!;
                                }),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    kHeight20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Confirm Password',
                          style: kLabelPrimary,
                        ),
                        kHeight5,
                        Row(
                          children: [
                            Flexible(
                              child: CustomTextFormField(
                                onSaved: (p0) => setState(() {
                                  passwordController.text = p0!;
                                }),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    kHeight20,
                    Column(
                      children: [
                        Row(
                          children: const [
                            Flexible(
                              child: CustomHorizontalDivider(),
                            ),
                            kWidth10,
                            Text(
                              'Or Sign Up with Mobile instead',
                              style: kHelper1,
                            ),
                            kWidth10,
                            Flexible(
                              child: CustomHorizontalDivider(),
                            ),
                          ],
                        ),
                        kHeight10,
                        GestureDetector(
                          onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            SignUpWithPhone.routeName,
                            (route) => false,
                          ),
                          child: Image.asset(
                            'assets/logos/phonelogo.png',
                          ),
                        )
                      ],
                    ),
                    kHeight20,
                    Row(
                      children: [
                        CustomCheckBox(
                          isChecked: isChecked,
                          onTap: () => setState(
                            () {
                              isChecked = !isChecked;
                            },
                          ),
                        ),
                        kWidth5,
                        // ignore: lines_longer_than_80_chars, lines_longer_than_80_chars
                        const Flexible(
                          child: Text(
                            'By signing you agree to our term of use and privacy policy.',
                          ),
                        ),
                      ],
                    ),
                    kHeight20,
                    CustomElevatedButton(
                      callback: () async {
                        _formKey.currentState!.validate();
                        if (_formKey.currentState!.validate() == true) {
                          _formKey.currentState!.save();
                          try {
                            final x = await NetworkHelper().createUserWithEmail(
                              email: emailController.text,
                              password: passwordController.text,
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Something went wrong. Please try again.',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        }
                      },
                      label: 'Sign Up',
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignInWithPhone.routeName);
                  },
                  child: const Text('Login'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
