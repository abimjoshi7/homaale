import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_phone.dart';
import 'package:cipher/networking/models/request/otp_request.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  static const routeName = "/reset-password";
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return CustomScaffold(
      leadingWidget: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          kHeight50,
          const Text("Reset Password", style: kHeading1),
          kHeight5,
          const Text(
            "Recover your password",
            style: kHelper1,
          ),
          kHeight20,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("New Password", style: kLabelPrimary),
                    kHeight10,
                    Row(
                      children: [
                        Flexible(
                          child: CustomTextFormField(
                            onChanged: (p0) => setState(
                              () {
                                passwordController.text = p0!;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    kHeight20,
                    const Text("Confirm Password", style: kLabelPrimary),
                    kHeight10,
                    Row(
                      children: [
                        Flexible(
                          child: CustomTextFormField(
                            onChanged: (p0) => setState(
                              () {
                                confirmPasswordController.text = p0!;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomElevatedButton(
            callback: () async {
              final x = await NetworkHelper().resetPassword(
                otpReq: OtpReq(
                  scope: args["scope"],
                  otp: args["otp"],
                  phone: args["phone"],
                  password: passwordController.text,
                  confirmPassword: confirmPasswordController.text,
                ),
              );
              if (x.success == true) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(x.message!),
                  ),
                );
                await Navigator.pushNamedAndRemoveUntil(
                    context, SignInWithPhone.routeName, (route) => false);
              }
            },
            label: "Continue",
          ),
          kHeight50
        ],
      ),
    );
  }
}
