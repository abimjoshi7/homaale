// ignore_for_file: lines_longer_than_80_chars

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_phone.dart';
import 'package:cipher/features/sign_up/presentation/pages/otp_sign_up.dart';
import 'package:cipher/features/sign_up/presentation/pages/sign_up_with_email.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUpWithPhone extends StatefulWidget {
  const SignUpWithPhone({super.key});
  static const String routeName = '/sign-up-with-phone';

  @override
  State<SignUpWithPhone> createState() => _SignUpWithPhoneState();
}

class _SignUpWithPhoneState extends State<SignUpWithPhone> {
  final _formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Phone Number',
                            style: kLabelPrimary,
                          ),
                          kHeight5,
                          CustomTextFormField(
                            textInputType: TextInputType.number,
                            validator: (p0) {
                              if (phoneNumberController.text.length < 10) {
                                return 'Number should be greater or equal to 10 digits';
                              }
                              return null;
                            },
                            onSaved: (p0) => setState(() {
                              phoneNumberController.text = p0!;
                            }),
                            hintText: 'Mobile Number',
                            prefixWidget: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset('assets/nepalflag.png'),
                                  const Text(
                                    '+977',
                                    style: kBodyText1,
                                  ),
                                  const Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter password';
                                    }
                                    return null;
                                    //  else {
                                    //   bool result = validatePassword(value);
                                    //   if (result) {
                                    //     return null;
                                    //   } else {
                                    //     return "Should contain at least 1 capital letter, number & special symbol";
                                    //   }
                                    // }
                                  },
                                  textInputType: TextInputType.visiblePassword,
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
                                  textInputType: TextInputType.visiblePassword,
                                  onSaved: (p0) => setState(
                                    () {
                                      confirmPasswordController.text = p0!;
                                    },
                                  ),
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
                                'Or Sign Up with Email instead',
                                style: kHelper1,
                              ),
                              kWidth10,
                              Flexible(child: CustomHorizontalDivider()),
                            ],
                          ),
                          kHeight10,
                          GestureDetector(
                            onTap: () => Navigator.pushNamedAndRemoveUntil(
                              context,
                              SignUpWithEmail.routeName,
                              (route) => false,
                            ),
                            child: Image.asset(
                              'assets/logos/mail_logo.png',
                            ),
                          )
                        ],
                      ),
                      kHeight20,
                      Row(
                        children: [
                          CustomCheckBox(
                            isChecked: isChecked,
                            onTap: () => setState(() {
                              isChecked = !isChecked;
                            }),
                          ),
                          kWidth5,
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
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate() == true) {
                            if (isChecked == false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please agree to the terms and policy.',
                                  ),
                                ),
                              );
                            } else {
                              try {
                                final x =
                                    await NetworkHelper().createUserWithPhone(
                                  phoneNumber:
                                      '+977${phoneNumberController.text}',
                                  password: passwordController.text,
                                );
                                if (x.statusCode == 201) {
                                  if (!mounted) return;
                                  await Navigator.pushNamed(
                                    context,
                                    OtpSignUp.routeName,
                                    arguments: {
                                      'phone':
                                          '+977${phoneNumberController.text}',
                                      'password': passwordController.text,
                                    },
                                  );
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Something went wrong. Please try again',
                                    ),
                                  ),
                                );
                              }
                            }
                          }
                        },
                        label: 'Sign Up',
                      )
                    ],
                  ),
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

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
