import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/bloc/password_security_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/models/password_security.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/custom_timer.dart';
import '../../../../sign_in/presentation/bloc/forgot_password_bloc.dart';
import '../../../../sign_in/presentation/pages/sign_in_page.dart';
import '../../../../user/presentation/bloc/user/user_bloc.dart';

class ChangePasswordModalSheet extends StatefulWidget {
  const ChangePasswordModalSheet({
    super.key,
  });

  @override
  State<ChangePasswordModalSheet> createState() =>
      _ChangePasswordModalSheetState();
}

class _ChangePasswordModalSheetState extends State<ChangePasswordModalSheet> {
  List<bool> isObscure = [true, true, true];
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomModalSheetDrawerIcon(),
        kHeight10,
        const Text(
          'Change Password',
          // style: kText17,
        ),
        Form(
          key: _key,
          child: Padding(
            padding: kPadding20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(
                  label: 'Current Password',
                  isRequired: true,
                  child: CustomTextFormField(
                    onSaved: (p0) => setState(
                      () {
                        currentPassword.text = p0!;
                      },
                    ),
                    suffixWidget: IconButton(
                      icon: Icon(
                        isObscure[0] == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: kColorPrimary,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure[0] = !isObscure[0];
                        });
                      },
                    ),
                    obscureText: isObscure[0],
                  ),
                ),
                CustomFormField(
                  label: 'New Password',
                  isRequired: true,
                  child: CustomTextFormField(
                    onSaved: (p0) => setState(
                      () {
                        newPassword.text = p0!;
                      },
                    ),
                    suffixWidget: IconButton(
                      icon: Icon(
                        isObscure[1] == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: kColorPrimary,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure[1] = !isObscure[1];
                        });
                      },
                    ),
                    obscureText: isObscure[1],
                    validator: validatePassword,
                  ),
                ),
                CustomFormField(
                  label: 'Confirm Password',
                  isRequired: true,
                  child: CustomTextFormField(
                    onSaved: (p0) => setState(
                      () {
                        confirmPassword.text = p0!;
                      },
                    ),
                    suffixWidget: IconButton(
                      icon: Icon(
                        isObscure[2] == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: kColorPrimary,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            isObscure[2] = !isObscure[2];
                          },
                        );
                      },
                    ),
                    obscureText: isObscure[2],
                    validator: validatePassword,
                  ),
                ),
              ],
            ),
          ),
        ),
        BlocConsumer<PasswordSecurityBloc, PasswordSecurityState>(
          listener: (context, state) {
            if (state is PasswordSecuritySuccess) {
              showDialog(
                context: context,
                builder: (context) => CustomToast(
                  heading: 'Success',
                  content: 'Password changed successfully',
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Root.routeName,
                    (route) => false,
                  ),
                  isSuccess: true,
                ),
              );
            }
            if (state is PasswordSecurityFailure) {
              showDialog(
                context: context,
                builder: (context) => CustomToast(
                  heading: 'Failure',
                  content: 'Password cannot be changed',
                  isSuccess: false,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            return CustomElevatedButton(
              callback: () {
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();
                  final passwordSecurity = PasswordSecurity(
                    oldPassword: currentPassword.text,
                    newPassword: newPassword.text,
                    confirmPassword: confirmPassword.text,
                  );
                  context.read<PasswordSecurityBloc>().add(
                        PasswordSecurityInitiated(
                          passwordSecurity: passwordSecurity,
                        ),
                      );
                }
              },
              label: 'Update',
            );
          },
        ),
        kHeight20,
        CustomElevatedButton(
          borderColor: kColorPrimary,
          mainColor: Colors.white,
          textColor: kColorPrimary,
          callback: () {
            Navigator.pop(context);
          },
          label: 'Cancel',
        ),
        kHeight20,
      ],
    );
  }
}

class AddPhoneNumberModalSheet extends StatefulWidget {
  final String updateText;
  const AddPhoneNumberModalSheet({
    super.key,
    required this.updateText,
  });

  @override
  State<AddPhoneNumberModalSheet> createState() =>
      _AddPhoneNumberModalSheetState();
}

class _AddPhoneNumberModalSheetState extends State<AddPhoneNumberModalSheet> {
  List<bool> isObscure = [true, true, true];
  final phoneNo = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final _key = GlobalKey<FormState>();
  String? otpValue;

  @override
  void dispose() {
    phoneNo.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomModalSheetDrawerIcon(),
        kHeight10,
        Text(widget.updateText),
        Form(
          key: _key,
          child: Padding(
            padding: kPadding20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.updateText == "Update Phone"
                    ? CustomFormField(
                        label: 'Phone',
                        isRequired: true,
                        child: CustomTextFormField(
                          controller: phoneNo,
                          onSaved: (p0) => setState(
                            () {
                              phoneNo.text = p0!;
                            },
                          ),
                          validator: validateNumber,
                        ),
                      )
                    : CustomFormField(
                        label: 'Email',
                        isRequired: true,
                        child: CustomTextFormField(
                          controller: email,
                          onSaved: (p0) => setState(
                            () {
                              email.text = p0!;
                            },
                          ),
                          validator: validateEmail,
                        ),
                      ),
                CustomFormField(
                  label: 'Password',
                  isRequired: true,
                  child: CustomTextFormField(
                    controller: password,
                    onSaved: (p0) => setState(
                      () {
                        password.text = p0!;
                      },
                    ),
                    suffixWidget: IconButton(
                      icon: Icon(
                        isObscure[1] == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: kColorPrimary,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure[1] = !isObscure[1];
                        });
                      },
                    ),
                    obscureText: isObscure[1],
                    validator: validatePassword,
                  ),
                ),
              ],
            ),
          ),
        ),
        BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) async {
            if (widget.updateText == 'Update Email') if (state
                is changeEmailSuccess) {
              if (!mounted) return;
              await showDialog(
                context: context,
                builder: (context) => CustomToast(
                  heading: 'Success',
                  content: 'Verify your email',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    context.read<UserBloc>().add(UserLoaded());
                  },
                  isSuccess: true,
                ),
              );
            }
            if (widget.updateText == 'Update Phone') if (state
                is changePhoneSuccess) {
              if (!mounted) return;
              await showDialog(
                context: context,
                builder: (context) => CustomToast(
                  heading: 'Success',
                  content: 'OTP generated successfully',
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: SizedBox(
                              height: 200,
                              child: Column(
                                children: <Widget>[
                                  Pinput(
                                    length: 6,
                                    onCompleted: (value) {
                                      setState(
                                        () {
                                          otpValue = value;
                                        },
                                      );
                                    },
                                  ),
                                  kHeight20,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset('assets/timer.png'),
                                      kWidth10,
                                      CustomTimer(
                                        args: {"phone": phoneNo.text},
                                      ),
                                    ],
                                  ),
                                  kHeight20,
                                  CustomElevatedButton(
                                    callback: () async {
                                      try {
                                        if (otpValue == null ||
                                            otpValue!.isEmpty) {
                                          if (!mounted) return;
                                          await showDialog(
                                            context: context,
                                            builder: (_) => CustomToast(
                                              heading: 'Failure',
                                              content:
                                                  "OTP Field Cannot Be Empty",
                                              onTap: () {},
                                              isSuccess: false,
                                            ),
                                          );
                                        }
                                        if (otpValue == null ||
                                            otpValue!.isEmpty) return;
                                        showDialog(
                                          context: context,
                                          builder: (_) => CustomToast(
                                            heading: 'Success',
                                            content: "Phone Number is added.",
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            isSuccess: true,
                                          ),
                                        );
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Something went wrong. Try again.'),
                                          ),
                                        );
                                      }
                                    },
                                    label: 'Continue',
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  isSuccess: true,
                ),
              );
            }
            if (widget.updateText == 'Update Phone') if (state
                is changePhoneFailure) {
              if (!mounted) return;
              await showDialog(
                context: context,
                builder: (context) => CustomToast(
                  heading: 'Go To OTP Screen',
                  content:
                      'Kindly, Go to login page and Process through "Did not get OTP ?"',
                  onTap: () async {
                    final googleSignIn = GoogleSignIn(
                      scopes: ['openid', 'email', 'profile'],
                      serverClientId:
                          '245846975950-vucoc2e1cmeielq5f5neoca7880n0u2i.apps.googleusercontent.com',
                    );
                    await googleSignIn.signOut();
                    context.read<SignInBloc>().add(
                          SignOutInitiated(),
                        );
                    context.read<UserBloc>().add(UserCleared());
                    await Navigator.pushNamedAndRemoveUntil(
                      context,
                      ResendVerificationPage.routeName,
                      (route) => false,
                    );
                  },
                  isSuccess: true,
                ),
              );
            }
          },
          builder: (context, state2) {
            return Center(
              child: CustomElevatedButton(
                callback: () async {
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    if (widget.updateText == 'Update Phone') {
                      context.read<ForgotPasswordBloc>().add(
                            changePhoneInitiated(
                              "+977${phoneNo.text}",
                              password.text,
                            ),
                          );
                    }
                    if (widget.updateText == 'Update Email') {
                      context.read<ForgotPasswordBloc>().add(
                            changeEmailInitiated(
                              email.text,
                              password.text,
                            ),
                          );
                    }
                  }
                },
                label: 'Update',
              ),
            );
          },
        ),
        kHeight20,
        CustomElevatedButton(
          borderColor: kColorPrimary,
          mainColor: Colors.white,
          textColor: kColorPrimary,
          callback: () {
            Navigator.pop(context);
          },
          label: 'Cancel',
        ),
        kHeight20,
      ],
    );
  }
}
