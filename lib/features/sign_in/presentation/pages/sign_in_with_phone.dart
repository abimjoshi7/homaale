// ignore_for_file: inference_failure_on_function_invocation

import 'package:cipher/core/app/shared_preferences.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/home/presentation/pages/home.dart';
import 'package:cipher/features/sign_in/presentation/pages/facebook_login.dart';
import 'package:cipher/features/sign_in/presentation/pages/forgot_password_with_phone.dart';
import 'package:cipher/features/sign_in/presentation/pages/google_login.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_email.dart';
import 'package:cipher/features/sign_up/presentation/pages/sign_up_with_phone.dart';
import 'package:cipher/networking/models/request/user_login_req.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/small_box_container.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
                              onTap: () {},
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
                    CustomElevatedButton(
                      callback: () async {
                        _formKey.currentState!.save();
                        final x = await NetworkHelper().logInUser(
                          userLoginReq: UserLoginReq(
                            username: '+977${phoneNumberController.text}',
                            password: passwordController.text,
                          ),
                        );
                        if (kDebugMode) {
                          print(
                            x.toJson(),
                          );
                        }
                        if (x.access != null) {
                          if (keepLogged == true) {
                            await SharedPrefs.persistString(
                              key: kAccessToken,
                              value: x.access,
                            );
                            await SharedPrefs.persistString(
                              key: kRefreshToken,
                              value: x.refresh,
                            );
                          }
                          if (!mounted) return;
                          await Navigator.pushNamedAndRemoveUntil(
                            context,
                            Home.routeName,
                            (route) => false,
                          );
                        } else {
                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Cannot login. Please try again',
                              ),
                            ),
                          );
                        }
                      },
                      label: 'Login',
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    children: [
                      kHeight5,
                      const Icon(
                        Icons.maximize,
                        size: 40,
                        color: Color(0xffCED4DA),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            kHeight50,
                            Container(
                              color: Colors.black12,
                              height: 100,
                              width: 100,
                            ),
                            kHeight20,
                            const Text("Verify it's you"),
                            kHeight10,
                            const Text('or'),
                            kHeight10,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Use'),
                                kWidth10,
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    'MPIN',
                                    style: TextStyle(color: Color(0xff3EAEFF)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CustomElevatedButton(
                        callback: () {
                          Navigator.pop(context);
                        },
                        mainColor: Colors.white,
                        textColor: const Color(0xff3D3F7D),
                        label: 'Cancel',
                      ),
                      kHeight20
                    ],
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.fingerprint_rounded),
                  kWidth5,
                  Text(
                    'Tap to login with fingerprint',
                    style: kBodyText1,
                  )
                ],
              ),
            ),
            kHeight50,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Flexible(
                  child: CustomHorizontalDivider(),
                ),
                kWidth5,
                Text(
                  'Or login with',
                  style: kHelper1,
                ),
                kWidth5,
                Flexible(
                  child: CustomHorizontalDivider(),
                ),
              ],
            ),
            kHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    SignInWithEmail.routeName,
                    (route) => false,
                  ),
                  child: Image.asset(
                    'assets/logos/maillogo.png',
                  ),
                ),
                kWidth20,
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    GoogleLogin.routeName,
                  ),
                  child: Image.asset('assets/logos/googlelogo.png'),
                ),
                kWidth20,
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    FacebookLogin.routeName,
                  ),
                  child: Image.asset('assets/logos/fblogo.png'),
                ),
              ],
            ),
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
