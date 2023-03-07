import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:cipher/features/sign_up/presentation/pages/otp_sign_up.dart';
import 'package:cipher/features/sign_up/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String routeName = '/sign-up-page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isChecked = false;
  List<bool> isObscure = [true, true];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<SignupBloc, SignUpState>(
        builder: (context, state) {
          Widget buildFormField() {
            if (state is SignUpPhoneInitial) {
              return CustomFormField(
                isRequired: true,
                label: 'Phone',
                child: CustomTextFormField(
                  textInputType: TextInputType.number,
                  validator: validateNumber,
                  onSaved: (p0) => setState(
                    () {
                      phoneNumberController.text = p0 ?? '';
                    },
                  ),
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
              );
            } else if (state is SignUpEmailInitial) {
              return CustomFormField(
                isRequired: true,
                label: 'Email',
                child: CustomTextFormField(
                  textInputType: TextInputType.emailAddress,
                  validator: validateEmail,
                  onSaved: (p0) => setState(
                    () {
                      emailController.text = p0 ?? '';
                    },
                  ),
                  hintText: 'Enter your email here',
                ),
              );
            }
            return const CircularProgressIndicator();
          }

          Widget buildText() {
            if (state is SignUpEmailInitial) {
              return const Text(
                'Or Sign Up with Phone instead',
                style: kHelper13,
              );
            } else if (state is SignUpPhoneInitial) {
              return const Text(
                'Or Sign Up with Email instead',
                style: kHelper13,
              );
            }
            return const CircularProgressIndicator();
          }

          Widget displayLogo() {
            if (state is SignUpEmailInitial) {
              return Image.asset(
                'assets/logos/phone_logo.png',
              );
            } else if (state is SignUpPhoneInitial) {
              return Image.asset(
                'assets/logos/mail_logo.png',
              );
            }
            return const CircularProgressIndicator();
          }

          return Column(
            children: [
              SignUpHeaderSection(mounted: mounted),
              Flexible(
                flex: 3,
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        buildFormField(),
                        CustomFormField(
                          isRequired: true,
                          label: 'Password',
                          child: CustomTextFormField(
                            validator: validatePassword,
                            textInputType: TextInputType.visiblePassword,
                            onSaved: (p0) => setState(() {
                              passwordController.text = p0 ?? '';
                            }),
                            obscureText: isObscure[0],
                            suffixWidget: InkWell(
                              onTap: () {
                                setState(() {
                                  isObscure[0] = !isObscure[0];
                                });
                              },
                              child: Icon(
                                color: kColorPrimary,
                                isObscure[0]
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                              ),
                            ),
                          ),
                        ),
                        CustomFormField(
                          isRequired: true,
                          label: 'Confirm Password',
                          child: CustomTextFormField(
                            textInputType: TextInputType.visiblePassword,
                            onSaved: (p0) => setState(
                              () {
                                confirmPasswordController.text = p0 ?? '';
                              },
                            ),
                            validator: (val) {
                              if (val!.isEmpty) return 'Cannot be empty';
                              if (!val.contains(passwordController.text)) {
                                return "Password didn't match";
                              }
                              return null;
                            },
                            obscureText: isObscure[1],
                            suffixWidget: InkWell(
                              onTap: () {
                                setState(() {
                                  isObscure[1] = !isObscure[1];
                                });
                              },
                              child: Icon(
                                color: kColorPrimary,
                                isObscure[1]
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                              ),
                            ),
                          ),
                        ),
                        addVerticalSpace(8),
                        Column(
                          children: [
                            Row(
                              children: [
                                const Flexible(
                                  child: CustomHorizontalDivider(),
                                ),
                                kWidth10,
                                buildText(),
                                kWidth10,
                                const Flexible(
                                  child: CustomHorizontalDivider(),
                                ),
                              ],
                            ),
                            addVerticalSpace(8),
                            GestureDetector(
                              onTap: () {
                                if (state is SignUpPhoneInitial) {
                                  context.read<SignupBloc>().add(
                                        SignUpWithEmailSelected(),
                                      );
                                } else if (state is SignUpEmailInitial) {
                                  context.read<SignupBloc>().add(
                                        SignUpWithPhoneSelected(),
                                      );
                                }
                              },
                              child: displayLogo(),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomCheckBox(
                              isChecked: isChecked,
                              onTap: () => setState(() {
                                isChecked = !isChecked;
                              }),
                            ),
                            addHorizontalSpace(8),
                            FittedBox(
                              child: Text(
                                'By signing up, you agree to our terms of use and privacy policy.',
                              ),
                            ),
                          ],
                        ),
                        BlocConsumer<SignupBloc, SignUpState>(
                          listener: (context, state) async {
                            final x = await CacheHelper.getCachedString(
                              kErrorLog,
                            );
                            if (state is SignUpWithEmailSuccess) {
                              if (!mounted) return;
                              showDialog(
                                context: context,
                                builder: (context) => CustomToast(
                                  heading: 'Success',
                                  content:
                                      'Succesfully signed up. Please verify your email',
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      SignInPage.routeName,
                                      (route) => false,
                                    );
                                  },
                                  isSuccess: true,
                                ),
                              );
                            }
                            if (state is SignUpWithPhoneSuccess) {
                              if (!mounted) return;
                              showDialog(
                                context: context,
                                builder: (context) => CustomToast(
                                  heading: 'Success',
                                  content: 'Succesfully signed up.',
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      OtpSignUp.routeName,
                                      arguments: {
                                        'phone':
                                            '+977${phoneNumberController.text}',
                                        'password': passwordController.text,
                                      },
                                    );
                                  },
                                  isSuccess: true,
                                ),
                              );
                            }
                            if (state is SignUpFailure) {
                              if (!mounted) return;
                              await showDialog(
                                context: context,
                                builder: (context) => CustomToast(
                                  heading: 'Failure',
                                  content: x ?? '',
                                  isSuccess: false,
                                  onTap: () {},
                                ),
                              ).then(
                                (value) => context.read<SignupBloc>().add(
                                      SignUpWithPhoneSelected(),
                                    ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return CustomElevatedButton(
                              callback: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  if (isChecked == false) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Please agree to the terms and policy.',
                                        ),
                                      ),
                                    );
                                  } else {
                                    if (state is SignUpPhoneInitial) {
                                      context.read<SignupBloc>().add(
                                            SignUpWithPhoneInitiated(
                                              phone: phoneNumberController.text,
                                              password: passwordController.text,
                                            ),
                                          );
                                    } else if (state is SignUpEmailInitial) {
                                      context.read<SignupBloc>().add(
                                            SignUpWithEmailInitiated(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            ),
                                          );
                                    }
                                  }
                                }
                              },
                              label: 'Sign Up',
                            );
                          },
                        ),
                        const SignUpFooterSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
