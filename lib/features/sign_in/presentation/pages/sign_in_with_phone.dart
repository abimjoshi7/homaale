// ignore_for_file: inference_failure_on_function_invocation

import 'dart:developer';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:cipher/features/sign_in/presentation/pages/forgot_password_with_phone.dart';
import 'package:cipher/features/sign_in/presentation/widgets/widgets.dart';
import 'package:cipher/features/sign_up/presentation/pages/sign_up_with_phone.dart';
import 'package:cipher/networking/models/request/user_login_req.dart';
import 'package:cipher/widgets/small_box_container.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({super.key});
  static const routeName = '/sign-in-with-phone';

  @override
  State<SignInWithPhone> createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {
  bool keepLogged = false;
  final _formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SignInScaffold(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            kHeight20,
            const Text('Welcome', style: kHeading1),
            const Text(
              'Login to your account',
              style: kHelper13,
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Phone',
                          style: kLabelPrimary,
                        ),
                        kHeight5,
                        Row(
                          children: [
                            Flexible(
                              child: CustomTextFormField(
                                onSaved: (p0) => setState(
                                  () {
                                    phoneNumberController.text = p0!;
                                  },
                                ),
                                textInputType: TextInputType.number,
                                hintText: 'Mobile Number',
                                prefixWidget: Padding(
                                  padding: const EdgeInsets.all(8),
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
                            ),
                            kWidth10,
                            GestureDetector(
                              onTap: () async {
                                final x = await CacheHelper.getCachedString(
                                  kAccessTokenP,
                                );
                                print(x);
                              },
                              child: const SmallBoxContainer(
                                child: Icon(
                                  Icons.phone_android_sharp,
                                  color: Color(0xff5C6096),
                                ),
                              ),
                            )
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
                                onSaved: (p0) => setState(
                                  () {
                                    passwordController.text = p0!;
                                  },
                                ),
                                hintText: 'Enter your password here',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    kHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomCheckBox(
                              isChecked: keepLogged,
                              onTap: () => setState(
                                () {
                                  keepLogged = !keepLogged;
                                },
                              ),
                            ),
                            kWidth5,
                            const Text(
                              'Remember me',
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              ForgotPasswordWithPhone.routeName,
                            );
                          },
                          child: const Text('Forgot password?'),
                        )
                      ],
                    ),
                    kHeight20,
                    BlocConsumer<SignInCubit, SignInState>(
                      listener: (context, state) async {
                        final x = await CacheHelper.getCachedString(kErrorLog);
                        if (state is SignInSuccess) {
                          log(
                            state.userLoginRes.toJson().toString(),
                          );

                          if (keepLogged == true) {
                            {
                              await CacheHelper.setCachedString(
                                kAccessTokenP,
                                state.userLoginRes.access!,
                              ).then(
                                (value) async => CacheHelper.setCachedString(
                                  kRefreshTokenP,
                                  state.userLoginRes.refresh!,
                                ).then(
                                  (value) async =>
                                      Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Root.routeName,
                                    (route) => false,
                                  ),
                                ),
                              );
                            }
                          } else {
                            await CacheHelper.setCachedString(
                              kAccessToken,
                              state.userLoginRes.access!,
                            )
                                .then(
                                  (value) async => CacheHelper.setCachedString(
                                    kRefreshToken,
                                    state.userLoginRes.refresh!,
                                  ),
                                )
                                .then(
                                  (value) => Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Root.routeName,
                                    (route) => false,
                                  ),
                                );
                          }
                          // if (!mounted) return;
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text(
                          //       'Succesfully signed in',
                          //     ),
                          //   ),
                          // );
                        } else if (state is SignInFailure) {
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                x!,
                              ),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomElevatedButton(
                          callback: () async {
                            _formKey.currentState!.save();
                            await context.read<SignInCubit>().initiateSignIn(
                                  UserLoginReq(
                                    username:
                                        '+977${phoneNumberController.text}',
                                    password: passwordController.text,
                                  ),
                                );
                          },
                          label: 'Login',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const FingerPrintSection(),
            kHeight50,
            const SocialLoginWithEmailSection(),
            kHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have any account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      SignUpWithPhone.routeName,
                    );
                  },
                  child: const Text(
                    'Sign Up',
                  ),
                ),
              ],
            ),
            kHeight20,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
