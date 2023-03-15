<<<<<<< HEAD
=======
import 'dart:developer';

>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:cipher/features/sign_up/presentation/pages/otp_sign_up.dart';
import 'package:cipher/features/sign_up/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  void initState() {
<<<<<<< HEAD
    super.initState();
    context.read<SignupBloc>().add(
          const SignUpWithPhoneSelected(),
        );
  }

  Widget buildFormField(SignUpState state) {
    if (state.theStates == TheStates.initial) {
      if (state.isPhoneNumber) {
        return CustomFormField(
          isRequired: true,
          label: 'Phone',
          child: CustomTextFormField(
            value: state.identifierFormFieldValue ?? '',
            textInputType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            validator: validateNumber,
            onSaved: (value) =>
                setState(() => phoneNumberController.text = '$value'),
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
      }

      if (!state.isPhoneNumber) {
        return CustomFormField(
          isRequired: true,
          label: 'Email',
          child: CustomTextFormField(
            value: state.identifierFormFieldValue ?? '',
            textInputType: TextInputType.emailAddress,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.singleLineFormatter
            ],
            validator: validateEmail,
            onSaved: (value) => setState(() => emailController.text = '$value'),
            hintText: 'Enter your email here',
          ),
        );
      }
    }
    return const LinearProgressIndicator();
  }

=======
    // TODO: implement initState
    super.initState();
    context.read<SignupBloc>().add(
          SignUpWithPhoneSelected(),
        );
  }

>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
  Future signUpSuccessDialogBox(BuildContext context, SignUpState state) {
    return showDialog(
      context: context,
      builder: (_) => CustomToast(
        heading: 'Success',
        content: (!state.isPhoneNumber)
            ? 'Succesfully signed up. Please verify your email'
            : 'Succesfully signed up.',
        onTap: () {
          (!state.isPhoneNumber)
              ? Navigator.pushNamedAndRemoveUntil(
                  context,
                  SignInPage.routeName,
                  (route) => false,
                )
              : Navigator.pushNamed(
                  context,
                  OtpSignUp.routeName,
                  arguments: {
                    'phone': '+977${phoneNumberController.text}',
                    'password': passwordController.text,
                  },
                );
        },
        isSuccess: true,
      ),
    );
  }

  Future signUpFailureDialogBox(
<<<<<<< HEAD
    String? x,
    BuildContext context,
    SignUpState state,
  ) async {
=======
      String? x, BuildContext context, SignUpState state) async {
    log('failure dialog box ayo');
>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
    return showDialog(
      context: context,
      builder: (_) => CustomToast(
        heading: 'Failure',
        content: x ?? '',
        isSuccess: false,
        onTap: () {},
      ),
    ).then(
      (value) => (!state.isPhoneNumber)
          ? context.read<SignupBloc>().add(
<<<<<<< HEAD
                SignUpWithEmailSelected(email: emailController.text),
              )
          : context.read<SignupBloc>().add(
                SignUpWithPhoneSelected(phone: phoneNumberController.text),
=======
                SignUpWithEmailSelected(),
              )
          : context.read<SignupBloc>().add(
                SignUpWithPhoneSelected(),
>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
              ),
    );
  }

  Widget passwordFormField() {
    return CustomFormField(
      isRequired: true,
      label: 'Password',
      child: CustomTextFormField(
        validator: validatePassword,
        textInputType: TextInputType.visiblePassword,
        onSaved: (value) => setState(() {
          passwordController.text = '$value';
          setState(() => {});
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
    );
  }

  Widget confirmPasswordFormField() {
    return CustomFormField(
      isRequired: true,
      label: 'Confirm Password',
      child: CustomTextFormField(
        textInputType: TextInputType.visiblePassword,
        onSaved: (value) => setState(
          () {
            confirmPasswordController.text = '$value';
            setState(() => {});
          },
        ),
        validator: (val) {
          if (val!.isEmpty) return 'Cannot be empty';
          if (!(confirmPasswordController.text == passwordController.text)) {
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
    );
  }

<<<<<<< HEAD
=======
  GestureDetector selectSignUpMethodButton(SignUpState state) {
    return GestureDetector(
      onTap: () {
        if (state.theStates == TheStates.initial) {
          if (state.isPhoneNumber) {
            context.read<SignupBloc>().add(
                  SignUpWithEmailSelected(),
                );
          }
          if (!state.isPhoneNumber) {
            context.read<SignupBloc>().add(
                  SignUpWithPhoneSelected(),
                );
          }
        }
      },
      child: SignUpDisplayLogo(
        state: state,
      ),
    );
  }

>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<SignupBloc, SignUpState>(
<<<<<<< HEAD
        listener: (_, state) {
          if (state.theStates == TheStates.failure) {
            signUpFailureDialogBox(
                state.errorMsg ?? 'Failed to log.', _, state);
          }
          if (state.theStates == TheStates.success) {
            signUpSuccessDialogBox(_, state);
          }
        },
        child: BlocBuilder<SignupBloc, SignUpState>(
          builder: (_, state) {
=======
        listener: (context, state) {
          if (state.theStates == TheStates.failure) {
            signUpFailureDialogBox(
                state.errorMsg ?? 'Failed to log.', context, state);
          }
          if (state.theStates == TheStates.success) {
            signUpSuccessDialogBox(context, state);
          }
        },
        child: BlocBuilder<SignupBloc, SignUpState>(
          builder: (context, state) {
            Widget buildFormField() {
              if (state.theStates == TheStates.initial) {
                if (state.isPhoneNumber) {
                  return CustomFormField(
                    isRequired: true,
                    label: 'Phone',
                    child: CustomTextFormField(
                      textInputType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: validateNumber,
                      onSaved: (value) {
                        setState(
                          () => phoneNumberController.text = value ?? '',
                        );
                      },
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
                }

                if (!state.isPhoneNumber) {
                  return CustomFormField(
                    isRequired: true,
                    label: 'Email',
                    child: CustomTextFormField(
                      textInputType: TextInputType.emailAddress,
                      validator: validateEmail,
                      onSaved: (value) => setState(
                        () =>
                            setState(() => emailController.text = value ?? ''),
                      ),
                      hintText: 'Enter your email here',
                    ),
                  );
                }
              }
              return const LinearProgressIndicator();
            }

>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
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
<<<<<<< HEAD
                          buildFormField(state),
=======
                          buildFormField(),
>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
                          passwordFormField(),
                          confirmPasswordFormField(),
                          addVerticalSpace(16),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Flexible(
                                    child: CustomHorizontalDivider(),
                                  ),
                                  kWidth10,
                                  SignUpBuildText(state: state),
                                  kWidth10,
                                  const Flexible(
                                    child: CustomHorizontalDivider(),
                                  ),
                                ],
                              ),
                              addVerticalSpace(8),
<<<<<<< HEAD
                              SelectSignUpMethodButton(state: state),
=======
                              selectSignUpMethodButton(state),
>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
                            ],
                          ),
                          addVerticalSpace(16),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomCheckBox(
                                  isChecked: isChecked,
                                  onTap: () => setState(() {
                                    isChecked = !isChecked;
                                  }),
                                ),
                                addHorizontalSpace(8),
                                const Flexible(
                                  child: AutoSizeText(
                                    minFontSize: 13,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    'By signing up, you agree to our terms of use and privacy policy.',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          addVerticalSpace(32),
                          Flexible(
                              child: CustomElevatedButton(
                            callback: () {
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
                                  if (state.theStates == TheStates.initial) {
                                    if (state.isPhoneNumber) {
<<<<<<< HEAD
=======
                                      log('phone number event triggered!');
>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
                                      context.read<SignupBloc>().add(
                                            SignUpWithPhoneInitiated(
                                              phone: phoneNumberController.text,
                                              password: passwordController.text,
                                            ),
                                          );
                                    }
                                    if (!state.isPhoneNumber) {
<<<<<<< HEAD
=======
                                      log('email event triggered!');

>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
                                      context.read<SignupBloc>().add(
                                            SignUpWithEmailInitiated(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            ),
                                          );
                                    }
<<<<<<< HEAD
=======
                                    log('signup state test: ${state.theStates}');
>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
                                  }
                                }
                              }
                            },
                            label: 'Sign Up',
                          )),
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
