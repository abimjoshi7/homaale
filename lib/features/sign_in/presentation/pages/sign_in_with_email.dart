import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/facebook_login.dart';
import 'package:cipher/features/sign_in/presentation/pages/forgot_password_with_email.dart';
import 'package:cipher/features/sign_in/presentation/pages/google_login.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_phone.dart';
import 'package:cipher/features/sign_up/presentation/pages/sign_up_with_phone.dart';
import 'package:cipher/networking/models/request/user_login_req.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignInWithEmail extends StatefulWidget {
  static const routeName = "/sign-in-with-email";
  const SignInWithEmail({super.key});

  @override
  State<SignInWithEmail> createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends State<SignInWithEmail> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      leadingWidget: IconButton(
        onPressed: () {
          // Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Color(0xffdee2e6),
        ),
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              kHeight20,
              const Text("Welcome", style: kHeading1),
              const Text(
                "Login to your account",
                style: kHelper1,
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
                    children: [
                      Flexible(
                        child: CustomTextFormField(
                          onSaved: (p0) => setState(() {
                            usernameController.text = p0!;
                          }),
                          hintText: "samplemail@email.com",
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
                          hintText: "Enter your password here",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomCheckBox(
                        isChecked: isChecked,
                        onTap: () => setState(() {
                          isChecked = !isChecked;
                        }),
                      ),
                      kWidth5,
                      const Text(
                        "Remember me",
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ForgotPasswordWithEmail.routeName);
                    },
                    child: const Text("Forgot password?"),
                  )
                ],
              ),
              kHeight10,
              CustomElevatedButton(
                callback: () async {
                  _formKey.currentState!.save();
                  final x = await NetworkHelper().logInUser(
                    userLoginReq: UserLoginReq(
                      username: usernameController.text,
                      password: passwordController.text,
                    ),
                  );
                  // print(x.username);
                  // print(x.access);
                  // print(x.isVerified);
                },
                label: "Login",
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                              const Text("or"),
                              kHeight10,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Use"),
                                  kWidth10,
                                  GestureDetector(
                                      onTap: () {},
                                      child: const Text(
                                        "MPIN",
                                        style:
                                            TextStyle(color: Color(0xff3EAEFF)),
                                      )),
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
                          label: "Cancel",
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
                      "Tap to login with fingerprint",
                      style: kBodyText1,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Flexible(
                    child: CustomHorizontalDivider(),
                  ),
                  kWidth5,
                  Text(
                    "Or login with",
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
                    onTap: () =>
                        Navigator.pushNamed(context, SignInWithPhone.routeName),
                    child: Image.asset(
                      "assets/logos/phonelogo.png",
                    ),
                  ),
                  kWidth20,
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      GoogleLogin.routeName,
                    ),
                    child: Image.asset("assets/logos/googlelogo.png"),
                  ),
                  kWidth20,
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      FacebookLogin.routeName,
                    ),
                    child: Image.asset("assets/logos/fblogo.png"),
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
                      "Sign Up",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
