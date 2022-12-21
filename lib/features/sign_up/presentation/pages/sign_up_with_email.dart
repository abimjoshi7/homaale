import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_email.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_phone.dart';
import 'package:cipher/features/sign_up/presentation/pages/sign_up_with_phone.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUpWithEmail extends StatefulWidget {
  static const String routeName = "/sign-up-with-email";
  const SignUpWithEmail({super.key});

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  final _formKey = GlobalKey<FormState>();
  // final nameController = TextEditingController();
  final emailController = TextEditingController();
  // final phoneNumberController = TextEditingController();
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
                          Text(
                            "Email",
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
                                  hintText: "Enter your email here",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      kHeight20,
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     const Text(
                      //       "Phone Number",
                      //       style: kLabelPrimary,
                      //     ),
                      //     kHeight5,
                      //     CustomTextFormField(
                      //       onSaved: (p0) => setState(() {
                      //         phoneNumberController.text = p0!;
                      //       }),
                      //       hintText: "Mobile Number",
                      //       prefixWidget: Padding(
                      //         padding: const EdgeInsets.all(10),
                      //         child: Row(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             Image.asset("assets/nepalflag.png"),
                      //             const Text(
                      //               "+977",
                      //               style: kBodyText1,
                      //             ),
                      //             const Icon(Icons.arrow_drop_down)
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // kHeight20,
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
                                "Or Sign Up with Mobile instead",
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
                                (route) => false),
                            child: Image.asset(
                              "assets/logos/phonelogo.png",
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
                          // print(nameController.text);
                          // print(emailController.text);
                          // print(phoneNumberController.text);
                          // print(passwordController.text);
                          final x = await NetworkHelper().createUserWithEmail(
                              email: emailController.text,
                              password: passwordController.text);
                          if (x.statusCode == 201) {
                            if (!mounted) return;
                            Navigator.pushNamedAndRemoveUntil(context,
                                SignInWithEmail.routeName, (route) => false);
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
