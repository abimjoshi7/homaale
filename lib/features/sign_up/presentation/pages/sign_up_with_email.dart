// ignore_for_file: duplicate_ignore, lines_longer_than_80_chars

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/validations/validate_email.dart';
import 'package:cipher/core/validations/validate_password.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_email.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_phone.dart';
import 'package:cipher/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:cipher/features/sign_up/presentation/pages/sign_up_with_phone.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    SignIn.routeName,
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
              style: kHelper13,
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
                                validator: validateEmail,
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
                                validator: validatePassword,
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
                                validator: (val) {
                                  if (val!.isEmpty) return 'Cannot be empty';
                                  if (val != passwordController.text) {
                                    return "Password didn't match";
                                  }
                                  return null;
                                },
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
                              style: kHelper13,
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
                            'assets/logos/phone_logo.png',
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
                    BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) async {
                        final x = await CacheHelper.getCachedString(
                          kErrorLog,
                        );
                        if (state is SignUpSuccess) {
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Succesfully signed up.'),
                            ),
                          );
                          await Navigator.pushNamed(
                            context,
                            SignInWithEmail.routeName,
                          );
                        } else if (state is SignUpFailure) {
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(x!),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomElevatedButton(
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
                                await context
                                    .read<SignUpCubit>()
                                    .initiateSignUpWithEmail(
                                      emailController.text,
                                      passwordController.text,
                                    );
                              }
                            }
                          },
                          label: 'Sign Up',
                        );
                      },
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
                    Navigator.pushNamed(context, SignIn.routeName);
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
