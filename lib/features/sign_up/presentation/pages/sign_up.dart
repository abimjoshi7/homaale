import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/validations/validate_email.dart';
import 'package:cipher/core/validations/validate_password.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:cipher/features/sign_up/presentation/pages/otp_sign_up.dart';
import 'package:cipher/features/sign_up/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const String routeName = '/sign-up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<SignupBloc, SignUpState>(
        builder: (context, state) {
          Widget buildFormField() {
            if (state is SignUpPhoneInitial) {
              return CustomFormField(
                label: 'Phone',
                child: CustomTextFormField(
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
              );
            } else if (state is SignUpEmailInitial) {
              return CustomFormField(
                label: 'Email',
                child: CustomTextFormField(
                  validator: validateEmail,
                  onSaved: (p0) => setState(() {
                    emailController.text = p0!;
                  }),
                  hintText: 'Enter your email here',
                ),
              );
            }
            return const SizedBox.shrink();
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
            } else {
              return const SizedBox.shrink();
            }
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
            } else {
              return const SizedBox.shrink();
            }
          }

          return Column(
            children: [
              SignUpHeaderSection(mounted: mounted),
              kHeight50,
              Expanded(
                child: Padding(
                  padding: kPadding15,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildFormField(),
                        CustomFormField(
                          label: 'Password',
                          child: CustomTextFormField(
                            validator: validatePassword,
                            textInputType: TextInputType.visiblePassword,
                            onSaved: (p0) => setState(() {
                              passwordController.text = p0!;
                            }),
                          ),
                        ),
                        CustomFormField(
                          label: 'Confirm Password',
                          child: CustomTextFormField(
                            textInputType: TextInputType.visiblePassword,
                            onSaved: (p0) => setState(
                              () {
                                confirmPasswordController.text = p0!;
                              },
                            ),
                            validator: (val) {
                              if (val!.isEmpty) return 'Cannot be empty';
                              if (val != passwordController.text) {
                                return "Password didn't match";
                              }
                              return null;
                            },
                          ),
                        ),
                        kHeight50,
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
                            kHeight20,
                            GestureDetector(
                              onTap: () {
                                if (state is SignUpPhoneInitial) {
                                  context.read<SignupBloc>().add(
                                        SignUpWithEmailSelected(),
                                      );
                                } else {
                                  context.read<SignupBloc>().add(
                                        SignUpWithPhoneSelected(),
                                      );
                                }
                              },
                              child: displayLogo(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: kPadding10,
                child: Row(
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
              ),
              BlocConsumer<SignupBloc, SignUpState>(
                listener: (context, state) async {
                  final x = await CacheHelper.getCachedString(
                    kErrorLog,
                  );
                  if (state is SignUpWithEmailSuccess) {
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Succesfully signed up. Please verify your email'),
                      ),
                    );
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      SignInPage.routeName,
                      (route) => false,
                    );
                  }
                  if (state is SignUpWithPhoneSuccess) {
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Succesfully signed up.'),
                      ),
                    );
                    await Navigator.pushNamed(
                      context,
                      OtpSignUp.routeName,
                      arguments: {
                        'phone': '+977${phoneNumberController.text}',
                        'password': passwordController.text,
                      },
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
              kHeight20,
              const SignUpFooterSection(),
              kHeight50,
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
