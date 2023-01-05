// ignore_for_file: inference_failure_on_function_invocation

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/cubit/sign_in_cubit.dart';
import 'package:cipher/features/sign_in/presentation/pages/forgot_password_with_email.dart';
import 'package:cipher/features/sign_in/presentation/widgets/widgets.dart';
import 'package:cipher/features/sign_up/presentation/pages/sign_up_with_email.dart';
import 'package:cipher/networking/models/request/user_login_req.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInWithEmail extends StatefulWidget {
  const SignInWithEmail({super.key});
  static const routeName = '/sign-in-with-email';

  @override
  State<SignInWithEmail> createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends State<SignInWithEmail> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool keepLogged = false;
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
              style: kHelper1,
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
                          'Email',
                          style: kLabelPrimary,
                        ),
                        kHeight5,
                        Row(
                          children: [
                            Flexible(
                              child: CustomTextFormField(
                                onSaved: (p0) => setState(
                                  () {
                                    usernameController.text = p0!;
                                  },
                                ),
                                textInputType: TextInputType.emailAddress,
                                hintText: 'sample@email.com',
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
                              ForgotPasswordWithEmail.routeName,
                            );
                          },
                          child: const Text('Forgot password?'),
                        )
                      ],
                    ),
                    kHeight20,
                    BlocConsumer<SignInCubit, SignInState>(
                      listener: (context, state) async {
                        final x = await storage.read(key: kErrorLog);
                        if (state is SignInSuccess) {
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Succesfully signed in',
                              ),
                            ),
                          );
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
                                    username: usernameController.text,
                                    password: passwordController.text,
                                  ),
                                );
                            print(state);
                            // if (state is SignInSuccess) {
                            //   if (state.userLoginRes.access != null) {
                            //     if (keepLogged == true) {
                            //       await storage.write(
                            //         key: kAccessToken,
                            //         value: state.userLoginRes.access,
                            //       );
                            //       await storage.write(
                            //         key: kRefreshToken,
                            //         value: state.userLoginRes.refresh,
                            //       );
                            //       if (!mounted) return;
                            //       await Navigator.pushNamedAndRemoveUntil(
                            //         context,
                            //         Root.routeName,
                            //         (route) => false,
                            //       );
                            //     } else {
                            //       if (!mounted) return;
                            //       await Navigator.pushNamedAndRemoveUntil(
                            //         context,
                            //         Root.routeName,
                            //         (route) => false,
                            //       );
                            //     }
                            //   }
                            // }
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
            const SocialLoginWithPhoneSection(),
            kHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have any account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      SignUpWithEmail.routeName,
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
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
