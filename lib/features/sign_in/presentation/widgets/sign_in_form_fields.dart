import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/models/user_login_req.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInFormFields extends StatefulWidget {
  const SignInFormFields({super.key});

  @override
  State<SignInFormFields> createState() => _SignInFormFieldsState();
}

class _SignInFormFieldsState extends State<SignInFormFields> {
  final _formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  bool keepLogged = false;
  bool isObscure = true;

  @override
  void initState() {
    initLoginDetails();
    super.initState();
  }

  Future<void> initLoginDetails() async {
    final String phone = await CacheHelper.getCachedString(kUserPhone) ?? '';
    final String mail = await CacheHelper.getCachedString(kUsermail) ?? '';
    final String password = await CacheHelper.getCachedString(kUserPass) ?? '';
    final String keepInfo =
        await CacheHelper.getCachedString(kRememberCreds) ?? 'false';

    setState(() {
      phoneNumberController.text = phone;
      usernameController.text = mail;
      passwordController.text = password;
      keepLogged = keepInfo == 'true';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) async {
        final error = await CacheHelper.getCachedString(kErrorLog);

        if (state is SignInSuccess) {
          CacheHelper.hasProfile = state.userLoginRes.hasProfile;
          CacheHelper.accessToken = state.userLoginRes.access;
          CacheHelper.refreshToken = state.userLoginRes.refresh;
          if (keepLogged == true) {
            // await CacheHelper.setCachedString(
            //   kIsPersistToken,
            //   "1",
            // ).then(
            //   (value) async => CacheHelper.setCachedString(
            //     kToken,
            //     CacheHelper.accessToken ?? '',
            //   ),
            // );
          }
          if (!mounted) return;
          Navigator.pushNamedAndRemoveUntil(
            context,
            Root.routeName,
            (route) => false,
          );
        }
        if (state is SignInFailure) {
          if (!mounted) return;
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Failure',
              content: error ?? "Please try again.",
              onTap: () {
                // context.read<SignInBloc>().add(
                //       SignInWithPhoneSelected(),
                //     );
              },
              isSuccess: false,
            ),
          ).then(
            (value) => context.read<SignInBloc>().add(
                  SignInWithPhoneSelected(),
                ),
          );
        }
      },
      builder: (context, state) {
        Widget buildForm() {
          if (state is SignInEmailInitial) {
            return CustomFormField(
              label: 'Email',
              child: CustomTextFormField(
                controller: usernameController,
                onSaved: (p0) => setState(
                  () {
                    usernameController.text = p0!;
                  },
                ),
                textInputType: TextInputType.emailAddress,
                hintText: 'sample@email.com',
                validator: validateNotEmpty,
              ),
            );
          }
          if (state is SignInPhoneInitial) {
            return CustomFormField(
              label: 'Phone',
              child: CustomTextFormField(
                controller: phoneNumberController,
                validator: validateNotEmpty,
                onSaved: (p0) => setState(
                  () {
                    phoneNumberController.text = p0!;
                  },
                ),
                textInputType: TextInputType.number,
                hintText: 'Mobile Number',
                prefixWidget: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8),
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
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        }

        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildForm(),
              CustomFormField(
                label: 'Password',
                child: CustomTextFormField(
                  controller: passwordController,
                  obscureText: isObscure,
                  suffixWidget: InkWell(
                    onTap: () {
                      setState(
                        () {
                          isObscure = !isObscure;
                        },
                      );
                    },
                    child: Icon(
                      color: kColorPrimary,
                      isObscure
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                    ),
                  ),
                  onSaved: (p0) => setState(
                    () {
                      passwordController.text = p0!;
                    },
                  ),
                  hintText: 'Enter your password here',
                  validator: validateNotEmpty,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomCheckBox(
                        isChecked: keepLogged,
                        onTap: () => setState(
                          () {
                            keepLogged = !keepLogged;
                          },
                        ),
                      ),
                      kWidth5,
                      const Text(
                        'Remember me',
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        ForgotPasswordPage.routeName,
                      );
                    },
                    child: const Text('Forgot password?'),
                  )
                ],
              ),
              addVerticalSpace(20),
              CustomElevatedButton(
                callback: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    if (keepLogged) {
                      CacheHelper.setCachedString(
                        kUserPhone,
                        phoneNumberController.text,
                      );
                      CacheHelper.setCachedString(
                        kUserPass,
                        passwordController.text,
                      );
                      CacheHelper.setCachedString(
                        kUsermail,
                        usernameController.text,
                      );
                      CacheHelper.setCachedString(
                        kRememberCreds,
                        'true',
                      );
                    } else {
                      CacheHelper.clearCachedData(kUsermail);
                      CacheHelper.clearCachedData(kUserPhone);
                      CacheHelper.clearCachedData(kUserPass);
                      CacheHelper.clearCachedData(kRememberCreds);
                    }

                    if (state is SignInPhoneInitial) {
                      context.read<SignInBloc>().add(
                            SignInWithPhoneInitiated(
                              userLoginReq: UserLoginReq(
                                username: '+977${phoneNumberController.text}',
                                password: passwordController.text,
                              ),
                            ),
                          );
                    }
                    if (state is SignInEmailInitial) {
                      context.read<SignInBloc>().add(
                            SignInWithEmailInitiated(
                              userLoginReq: UserLoginReq(
                                username: usernameController.text,
                                password: passwordController.text,
                              ),
                            ),
                          );
                    }
                  }
                },
                label: 'Login',
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
