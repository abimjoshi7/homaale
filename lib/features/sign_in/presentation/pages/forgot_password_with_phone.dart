import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/confirm_otp_sign_in.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWithPhone extends StatefulWidget {
  const ForgotPasswordWithPhone({super.key});
  static const routeName = '/forgot-password-with-phone';

  @override
  State<ForgotPasswordWithPhone> createState() =>
      _ForgotPasswordWithPhoneState();
}

class _ForgotPasswordWithPhoneState extends State<ForgotPasswordWithPhone> {
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SignInScaffold(
      child: Column(
        children: [
          kHeight20,
          kHeight20,
          const Text('Forgot Password', style: kHeading1),
          kHeight5,
          const Text(
            'Recover your password',
            style: kHelper13,
          ),
          kHeight20,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Phone', style: kLabelPrimary),
                    kHeight10,
                    Row(
                      children: [
                        Flexible(
                          child: Form(
                            key: _formKey,
                            child: CustomTextFormField(
                              hintText: 'Enter your phone number here',
                              textInputType: TextInputType.number,
                              onSaved: (p0) => setState(
                                () {
                                  phoneController.text = p0!;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    kHeight20,
                    const Text(
                      'An OTP code will be sent to your phone number.',
                      style: kBodyText1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomElevatedButton(
            callback: () async {
              _formKey.currentState!.save();
              try {
                final x = await NetworkHelper().fetchOTP(
                  phone: '+977${phoneController.text}',
                );
                if (x.statusCode == 201) {
                  if (!mounted) return;
                  await Navigator.pushNamed(
                    context,
                    ConfirmOTPSignIn.routeName,
                    arguments: '+977${phoneController.text}',
                  );
                }
              } catch (e) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Something went wrong. Please try again',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
            },
            label: 'Continue',
          ),
          kHeight50,
        ],
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
