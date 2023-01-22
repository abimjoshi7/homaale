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
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) async {
        final x = await CacheHelper.getCachedString(kErrorLog);
        if (state is SignInWithEmailSuccess) {
          if (keepLogged == true) {
            {
              await CacheHelper.setCachedString(
                kAccessTokenP,
                state.userLoginRes.access!,
              ).then(
                (value) async => CacheHelper.setCachedString(
                  kRefreshTokenP,
                  state.userLoginRes.refresh!,
                ).then(
                  (value) async => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Root.routeName,
                    (route) => false,
                  ),
                ),
              );
            }
          } else {
            await CacheHelper.setCachedString(
              kAccessToken,
              state.userLoginRes.access!,
            )
                .then(
                  (value) async => CacheHelper.setCachedString(
                    kRefreshToken,
                    state.userLoginRes.refresh!,
                  ),
                )
                .then(
                  (value) => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Root.routeName,
                    (route) => false,
                  ),
                );
          }
        } else if (state is SignInWithPhoneSuccess) {
          if (keepLogged == true) {
            {
              await CacheHelper.setCachedString(
                kAccessTokenP,
                state.userLoginRes.access!,
              ).then(
                (value) async => CacheHelper.setCachedString(
                  kRefreshTokenP,
                  state.userLoginRes.refresh!,
                ).then(
                  (value) async => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Root.routeName,
                    (route) => false,
                  ),
                ),
              );
            }
          } else {
            await CacheHelper.setCachedString(
              kAccessToken,
              state.userLoginRes.access!,
            )
                .then(
                  (value) async => CacheHelper.setCachedString(
                    kRefreshToken,
                    state.userLoginRes.refresh!,
                  ),
                )
                .then(
                  (value) => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Root.routeName,
                    (route) => false,
                  ),
                );
          }
        } else if (state is SignInWithEmailFailure ||
            state is SignInWithPhoneFailure) {
          if (!mounted) return;
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Failure',
              content: x ?? "Unknown Problem",
              onTap: () {},
              isSuccess: false,
            ),
          );
        }
      },
      builder: (context, state) {
        Widget buildForm() {
          if (state is SignInEmailInitial) {
            return CustomFormText(
              name: 'Email',
              child: CustomTextFormField(
                onSaved: (p0) => setState(
                  () {
                    usernameController.text = p0!;
                  },
                ),
                textInputType: TextInputType.emailAddress,
                hintText: 'sample@email.com',
              ),
            );
          } else if (state is SignInPhoneInitial) {
            return CustomFormText(
              name: 'Phone',
              child: CustomTextFormField(
                onSaved: (p0) => setState(
                  () {
                    phoneNumberController.text = p0!;
                  },
                ),
                textInputType: TextInputType.number,
                hintText: 'Mobile Number',
                prefixWidget: Padding(
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
            );
          } else {
            return CustomFormText(
              name: 'Phone',
              child: CustomTextFormField(
                onSaved: (p0) => setState(
                  () {
                    phoneNumberController.text = p0!;
                  },
                ),
                textInputType: TextInputType.number,
                hintText: 'Mobile Number',
                prefixWidget: Padding(
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
            );
          }
        }

        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildForm(),
              kHeight20,
              CustomFormText(
                name: 'Password',
                child: CustomTextFormField(
                  onSaved: (p0) => setState(
                    () {
                      passwordController.text = p0!;
                    },
                  ),
                  hintText: 'Enter your password here',
                ),
              ),
              kHeight20,
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
              kHeight20,
              CustomElevatedButton(
                callback: () async {
                  _formKey.currentState!.save();
                  if (state is SignInPhoneInitial ||
                      state is SignInWithPhoneFailure) {
                    context.read<SignInBloc>().add(
                          SignInWithPhoneInitiated(
                            userLoginReq: UserLoginReq(
                              username: '+977${phoneNumberController.text}',
                              password: passwordController.text,
                            ),
                          ),
                        );
                  } else if (state is SignInEmailInitial ||
                      state is SignInWithEmailFailure) {
                    context.read<SignInBloc>().add(
                          SignInWithEmailInitiated(
                            userLoginReq: UserLoginReq(
                              username: usernameController.text,
                              password: passwordController.text,
                            ),
                          ),
                        );
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
