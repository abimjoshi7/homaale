import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/confirm_otp.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_phone.dart';
import 'package:cipher/features/sign_up/presentation/pages/sign_up_with_email.dart';
import 'package:cipher/networking/models/user_model.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUpWithPhone extends StatefulWidget {
  static const String routeName = "/sign-up-with-phone";
  const SignUpWithPhone({super.key});

  @override
  State<SignUpWithPhone> createState() => _SignUpWithPhoneState();
}

class _SignUpWithPhoneState extends State<SignUpWithPhone> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            CustomHeader(
              leadingWidget: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              trailingWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Skip",
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
              "Register",
              style: kHeading1,
            ),
            const Text(
              "Create your new account",
              style: kHelper1,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     const Text(
                      //       "Full Name",
                      //       style: kLabelPrimary,
                      //     ),
                      //     kHeight5,
                      //     Row(
                      //       children: [
                      //         Flexible(
                      //           child: CustomTextFormField(
                      //             onSaved: (p0) {
                      //               setState(() {
                      //                 nameController.text = p0!;
                      //               });
                      //             },
                      //             hintText: "Enter your name here",
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // kHeight20,

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Phone Number",
                            style: kLabelPrimary,
                          ),
                          kHeight5,
                          CustomTextFormField(
                            onSaved: (p0) => setState(() {
                              phoneNumberController.text = p0!;
                            }),
                            hintText: "Mobile Number",
                            prefixWidget: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/nepalflag.png"),
                                  const Text(
                                    "+977",
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Password",
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Confirm Password",
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Flexible(
                                child: CustomHorizontalDivider(),
                              ),
                              kWidth10,
                              Text(
                                "Or Sign Up with Email instead",
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
                              "assets/logos/maillogo.png",
                            ),
                          )
                        ],
                      ),
                      kHeight20,
                      Row(
                        children: const [
                          CustomCheckBox(),
                          kWidth5,
                          Flexible(
                            child: Text(
                                "By signing you agree to our term of use and privacy policy."),
                          ),
                        ],
                      ),
                      kHeight20,
                      CustomElevatedButton(
                        callback: () async {
                          _formKey.currentState!.save();
                          final x = await NetworkHelper().createUserWithPhone(
                            phoneNumber: phoneNumberController.text,
                            password: passwordController.text,
                          );
                          if (x.statusCode == 201) {
                            if (!mounted) return;
                            Navigator.pushNamed(
                              context,
                              ConfirmOTP.routeName,
                              arguments: x.data["phone"] as String,
                            );
                          }
                          print(x);
                          print(x.data);
                          print(x.statusCode);
                          print(x.statusMessage);
                        },
                        label: "Sign Up",
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignInWithPhone.routeName);
                  },
                  child: const Text("Login"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
