import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static const String routeName = "/sign-up-page";
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Full Name",
                          style: kLabelPrimary,
                        ),
                        kHeight5,
                        Row(
                          children: const [
                            Flexible(
                              child: CustomTextFormField(
                                hintText: "Enter your name here",
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
                          "Email",
                          style: kLabelPrimary,
                        ),
                        kHeight5,
                        Row(
                          children: const [
                            Flexible(
                              child: CustomTextFormField(
                                hintText: "Enter your email here",
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
                          "Phone Number",
                          style: kLabelPrimary,
                        ),
                        kHeight5,
                        CustomTextFormField(
                          hintText: "Mobile Number",
                          prefixWidget: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset("assets/nepalflag.png"),
                                Text(
                                  "+977",
                                  style: kBodyText1,
                                ),
                                Icon(Icons.arrow_drop_down)
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
                          children: const [
                            Flexible(
                              child: CustomTextFormField(),
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
                          children: const [
                            Flexible(
                              child: CustomTextFormField(),
                            ),
                          ],
                        ),
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
                      callback: () {},
                      label: "Sign Up",
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignInPage.routeName);
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
