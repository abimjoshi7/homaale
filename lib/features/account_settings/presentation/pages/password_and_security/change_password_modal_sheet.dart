import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/validations/validate_password.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/bloc/password_security_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/models/password_security.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          style: kText17,
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
              label: 'Save',
            );
          },
        ),
        kHeight20,
      ],
    );
  }
}
