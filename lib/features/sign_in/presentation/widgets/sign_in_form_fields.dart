import 'package:cipher/core/app/initial_data_fetch.dart';
import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/models/user_login_req.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInFormFields extends StatefulWidget {
  const SignInFormFields({super.key});

  @override
  State<SignInFormFields> createState() => _SignInFormFieldsState();
}

class _SignInFormFieldsState extends State<SignInFormFields> {
  final _formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final phonePasswordController = TextEditingController();
  final emailPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  bool keepLogged = false;
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    initLoginDetails();
    context.read<SignInBloc>().add(SignInWithPhoneSelected());
  }

  Future<void> initLoginDetails() async {
    final String phone = await CacheHelper.getCachedString(kUserPhone) ?? '';
    final String mail = await CacheHelper.getCachedString(kUsermail) ?? '';
    final String phonePassword =
        await CacheHelper.getCachedString(kUserPhonePass) ?? '';
    final String emailPassword =
        await CacheHelper.getCachedString(kUserEmailPass) ?? '';

    final String keepInfo =
        await CacheHelper.getCachedString(kRememberCreds) ?? 'false';

    setState(() {
      phoneNumberController.text = phone;
      usernameController.text = mail;
      phonePasswordController.text = phonePassword;
      emailPasswordController.text = emailPassword;
      keepLogged = keepInfo == 'true';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) async {
        if (state.theStates == TheStates.success) {
          CacheHelper.hasProfile = state.userLoginRes?.hasProfile;
          CacheHelper.accessToken = state.userLoginRes?.access;
          CacheHelper.refreshToken = state.userLoginRes?.refresh;

          if (!mounted) return;

          initialFetch(context);

          // fetch user details
          if (CacheHelper.hasProfile ?? false) {
            userDetailsFetch(context);
          }

          // fetch data for app
          fetchDataForForms(context);

          Future.delayed(Duration(seconds: 2), () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Root.routeName,
              (route) => false,
            );
          });
        }
        if (state.theStates == TheStates.failure) {
          (state.isPhoneNumber)
              ? context.read<SignInBloc>().add(
                    SignInWithPhoneSelected(),
                  )
              : context.read<SignInBloc>().add(
                    SignInWithEmailSelected(),
                  );
        }
      },
      builder: (context, state) {
        Widget buildForm() {
          if (state.theStates == TheStates.initial) {
            if (!state.isPhoneNumber) {
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
                  hintText: 'sample@gmail.com',
                  validator: validateNotEmpty,
                ),
              );
            }
            if (state.isPhoneNumber) {
              return CustomFormField(
                label: 'Phone',
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomTextFormField(
                        theWidth: MediaQuery.of(context).size.width * 0.88,
                        controller: phoneNumberController,
                        validator: validateNotEmpty,
                        onSaved: (p0) => setState(
                          () => phoneNumberController.text = p0!,
                        ),
                        textInputType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ),
                      ),
                      // addHorizontalSpace(MediaQuery.of(context).size.width * 0.01),
                      // GetDevicePhoneNumberButton(
                      //   onTap: () => null,
                      // ),
                    ],
                  ),
                ),
              );
            }
          }

          return const SizedBox();
        }

        Widget buildPasswordField() {
          if (state.theStates == TheStates.initial) {
            return CustomFormField(
              label: 'Password',
              child: CustomTextFormField(
                theWidth: MediaQuery.of(context).size.width * 0.88,
                controller: state.isPhoneNumber
                    ? phonePasswordController
                    : emailPasswordController,
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
                    state.isPhoneNumber
                        ? phonePasswordController.text = p0!
                        : emailPasswordController.text = p0!;
                  },
                ),
                hintText: 'Enter your password here',
                hintStyle: Theme.of(context).textTheme.bodySmall,
                validator: validateNotEmpty,
              ),
            );
          }
          return CustomLoader();
        }

        Widget loginButton() {
          if (state.theStates == TheStates.initial) {
            return CustomElevatedButton(
              callback: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  //setting validation error status
                  // state.copyWith(hasValidationErrors: false);

                  if (keepLogged) {
                    CacheHelper.setCachedString(
                      kUserPhone,
                      phoneNumberController.text,
                    );
                    CacheHelper.setCachedString(
                      kUserPhonePass,
                      phonePasswordController.text,
                    );
                    CacheHelper.setCachedString(
                      kUserEmailPass,
                      emailPasswordController.text,
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
                    CacheHelper.clearCachedData(kUserPhonePass);
                    CacheHelper.clearCachedData(kUserEmailPass);
                    CacheHelper.clearCachedData(kRememberCreds);
                  }

                  if (state.theStates == TheStates.initial) {
                    if (state.isPhoneNumber) {
                      context.read<SignInBloc>().add(
                            SignInWithPhoneInitiated(
                              userLoginReq: UserLoginReq(
                                username: '+977${phoneNumberController.text}',
                                password: phonePasswordController.text,
                              ),
                            ),
                          );
                    }
                    if (!state.isPhoneNumber) {
                      context.read<SignInBloc>().add(
                            SignInWithEmailInitiated(
                              userLoginReq: UserLoginReq(
                                username: usernameController.text,
                                password: emailPasswordController.text,
                              ),
                            ),
                          );
                    }
                  }
                }
                //setting validation error status to true
                else {
                  if (state.theStates == TheStates.initial) {
                    context
                        .read<SignInBloc>()
                        .add(SignInValErrorStatusChanged());
                  }
                }
              },
              label: 'Login',
            );
          }
          return CustomLoader();
        }

        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildForm(),
              buildPasswordField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CustomCheckBox(
                        isChecked: keepLogged,
                        onTap: () => setState(
                          () {
                            keepLogged = !keepLogged;
                          },
                        ),
                      ),
                      kWidth5,
                      Text(
                        'Remember me',
                        style: Theme.of(context).textTheme.bodySmall,
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
                    child: Text(
                      'Forgot password?',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )
                ],
              ),
              addVerticalSpace(MediaQuery.of(context).size.height * 0.020),
              CustomElevatedButton(
                callback: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    //setting validation error status
                    // state.copyWith(hasValidationErrors: false);

                    if (keepLogged) {
                      CacheHelper.setCachedString(
                        kUserPhone,
                        phoneNumberController.text,
                      );

                      CacheHelper.setCachedString(
                        kUserPhonePass,
                        phonePasswordController.text,
                      );
                      CacheHelper.setCachedString(
                        kUserEmailPass,
                        emailPasswordController.text,
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
                      CacheHelper.clearCachedData(kUserPhonePass);
                      CacheHelper.clearCachedData(kUserEmailPass);
                      CacheHelper.clearCachedData(kRememberCreds);
                    }

                    if (state.theStates == TheStates.initial) {
                      if (state.isPhoneNumber) {
                        context.read<SignInBloc>().add(
                              SignInWithPhoneInitiated(
                                userLoginReq: UserLoginReq(
                                  username: '+977${phoneNumberController.text}',
                                  password: phonePasswordController.text,
                                ),
                              ),
                            );
                      }
                      if (!state.isPhoneNumber) {
                        context.read<SignInBloc>().add(
                              SignInWithEmailInitiated(
                                userLoginReq: UserLoginReq(
                                  username: usernameController.text,
                                  password: emailPasswordController.text,
                                ),
                              ),
                            );
                      }
                    }
                  }
                  //setting validation error status to true
                  else {
                    if (state.theStates == TheStates.initial) {
                      context
                          .read<SignInBloc>()
                          .add(SignInValErrorStatusChanged());
                    }
                  }
                },
                label: 'Login',
              ),
              addVerticalSpace(8.0),
              if (state.theStates == TheStates.initial)
                CustomTextButton(
                  text: (state.isPhoneNumber)
                      ? "Didn't get OTP ?"
                      : "Didn't get verification email?",
                  voidCallback: () => Navigator.pushNamed(
                    context,
                    ResendVerificationPage.routeName,
                  ),
                  // style :Theme.of(context).textTheme.bodySmall
                  style: kText13.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                    wordSpacing: 0.1,
                  ),
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
    phonePasswordController.dispose();
    emailPasswordController.dispose();
    super.dispose();
  }
}
