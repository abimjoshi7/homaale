import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/content_client/presentation/pages/privacy_policy.dart';
import 'package:cipher/features/content_client/presentation/pages/terms_of_use.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:cipher/features/sign_up/presentation/pages/otp_sign_up.dart';
import 'package:cipher/features/sign_up/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/gestures.dart';
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
    String? x,
    BuildContext context,
    SignUpState state,
  ) async {
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
                SignUpWithEmailSelected(email: emailController.text),
              )
          : context.read<SignupBloc>().add(
                SignUpWithPhoneSelected(phone: phoneNumberController.text),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<SignupBloc, SignUpState>(
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
            return Column(
              children: <Widget>[
                SignUpHeaderSection(mounted: mounted),
                Flexible(
                  flex: 3,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          buildFormField(state),
                          passwordFormField(),
                          confirmPasswordFormField(),
                          addVerticalSpace(16),
                          Column(
                            children: <Widget>[
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
                              SelectSignUpMethodButton(state: state),
                            ],
                          ),
                          addVerticalSpace(16),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                CustomCheckBox(
                                  isChecked: isChecked,
                                  onTap: () => setState(() {
                                    isChecked = !isChecked;
                                  }),
                                ),
                                addHorizontalSpace(8),
                                Flexible(
                                  child: RichText(
                                    strutStyle:
                                        const StrutStyle(fontFamily: 'Poppins'),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      text: 'By signing up, you agree to our ',
                                      style: kHeading3.copyWith(
                                        wordSpacing: 0.5,
                                        letterSpacing: 0.1,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'terms of use ',
                                          style: kHeading3.copyWith(
                                            color: const Color(0xffFCA500),
                                            letterSpacing: 0.3,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => Navigator.pushNamed(
                                                  context,
                                                  TermsOfUsePage.routeName,
                                                ),
                                        ),
                                        const TextSpan(
                                          text: 'and ',
                                        ),
                                        TextSpan(
                                          text: 'privacy policy.',
                                          style: kHeading3.copyWith(
                                            color: const Color(0xffFCA500),
                                            letterSpacing: 0.3,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => Navigator.pushNamed(
                                                  context,
                                                  PrivacyPolicyPage.routeName,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          addVerticalSpace(32),
                          if (state.theStates != TheStates.initial)
                            CircularProgressIndicator(),
                          if (state.theStates == TheStates.initial)
                            Flexible(
                              child: CustomElevatedButton(
                                callback: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    if (isChecked == false) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Please agree to the terms and policy.',
                                          ),
                                        ),
                                      );
                                    } else {
                                      if (state.theStates ==
                                          TheStates.initial) {
                                        if (state.isPhoneNumber) {
                                          context.read<SignupBloc>().add(
                                                SignUpWithPhoneInitiated(
                                                  phone: phoneNumberController
                                                      .text,
                                                  password:
                                                      passwordController.text,
                                                ),
                                              );
                                        }
                                        if (!state.isPhoneNumber) {
                                          context.read<SignupBloc>().add(
                                                SignUpWithEmailInitiated(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                ),
                                              );
                                        }
                                      }
                                    }
                                  }
                                },
                                label: 'Sign Up',
                              ),
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
