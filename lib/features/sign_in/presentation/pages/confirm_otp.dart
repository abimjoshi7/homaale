import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/reset_password.dart';
import 'package:cipher/networking/models/request/otp_request.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/custom_timer.dart';
import 'package:cipher/widgets/small_box_container.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ConfirmOTP extends StatefulWidget {
  static const routeName = "/confirm-otp";
  const ConfirmOTP({super.key});

  @override
  State<ConfirmOTP> createState() => _ConfirmOTPState();
}

class _ConfirmOTPState extends State<ConfirmOTP> {
  String? firstValue;
  String? secondValue;
  String? thirdValue;
  String? fourthValue;
  String? fifthValue;
  String? sixthValue;
  List<String> otpValues = [];
  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ?? "") as String;
    String number = args.substring(1, args.length);
    return CustomScaffold(
      leadingWidget: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          kHeight20,
          kHeight20,
          const Text("Confirm OTP", style: kHeading1),
          kHeight5,
          Text(
            "Please enter the 6 digit code send to ${number.replaceRange(8, number.length, "*****")}",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SmallBoxContainer(
                          child: CustomTextFormField(
                            onChanged: (p0) => setState(
                              () {
                                firstValue = p0!;
                                otpValues.insert(0, p0);
                              },
                            ),
                          ),
                          theWidth: 50,
                          theHeight: 50,
                        ),
                        SmallBoxContainer(
                          child: CustomTextFormField(
                            onChanged: (p0) => setState(
                              () {
                                secondValue = p0!;
                                otpValues.insert(1, p0);

                                // otpValues.a7dd(p0);
                              },
                            ),
                          ),
                          theWidth: 50,
                          theHeight: 50,
                        ),
                        SmallBoxContainer(
                          child: CustomTextFormField(
                            onChanged: (p0) => setState(
                              () {
                                thirdValue = p0!;
                                otpValues.insert(2, p0);

                                // otpValues.add(p0);
                              },
                            ),
                          ),
                          theWidth: 50,
                          theHeight: 50,
                        ),
                        SmallBoxContainer(
                          child: CustomTextFormField(
                            onChanged: (p0) => setState(
                              () {
                                fourthValue = p0!;
                                otpValues.insert(3, p0);
                              },
                            ),
                          ),
                          theWidth: 50,
                          theHeight: 50,
                        ),
                        SmallBoxContainer(
                          child: CustomTextFormField(
                            onChanged: (p0) => setState(
                              () {
                                fifthValue = p0!;
                                otpValues.insert(4, p0);
                              },
                            ),
                          ),
                          theWidth: 50,
                          theHeight: 50,
                        ),
                        SmallBoxContainer(
                          child: CustomTextFormField(
                            onChanged: (p0) => setState(
                              () {
                                sixthValue = p0!;
                                otpValues.insert(5, p0);
                              },
                            ),
                          ),
                          theWidth: 50,
                          theHeight: 50,
                        ),
                      ],
                    ),
                    kHeight20,
                    kHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/timer.png"),
                        kWidth10,
                        CustomTimer(),
                        kWidth20,
                        CustomTextButton(
                          text: "Resend",
                          voidCallback: () {},
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
              print(otpValues.join());
              print(args);
              try {
                final x = await NetworkHelper().verifyOTP(
                  otpReq: OtpReq(
                    otp: otpValues.join(),
                    scope: "verify",
                    phone: args,
                  ),
                );
                print(
                  x.toJson(),
                );
              } catch (e) {
                print(e);
              }

              // if (x.success == true) {
              //   if (!mounted) return;
              //   Navigator.pushNamed(context, ResetPassword.routeName);
              // }
              // try {

              // } catch (e) {
              //   // print(e);
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(
              //       content: Text("Something went wrong. Try again"),
              //     ),
              //   );
              // }
            },
            label: "Continue",
          ),
          kHeight50,
        ],
      ),
    );
  }
}
