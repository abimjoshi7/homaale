import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/reset_password.dart';
import 'package:cipher/widgets/small_box_container.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ConfirmOTP extends StatelessWidget {
  static const routeName = "/confirm-otp";
  const ConfirmOTP({super.key});

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
            "Please enter the 6 digit code send to ${number.replaceRange(5, number.length, "*****")}",
            style: kHelper1,
          ),
          kHeight20,
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SmallBoxContainer(
                        child: Text("0"),
                        theWidth: 50,
                        theHeight: 50,
                      ),
                      SmallBoxContainer(
                        child: Text("0"),
                        theWidth: 50,
                        theHeight: 50,
                      ),
                      SmallBoxContainer(
                        child: Text("0"),
                        theWidth: 50,
                        theHeight: 50,
                      ),
                      SmallBoxContainer(
                        child: Text("0"),
                        theWidth: 50,
                        theHeight: 50,
                      ),
                      SmallBoxContainer(
                        child: Text("0"),
                        theWidth: 50,
                        theHeight: 50,
                      ),
                      SmallBoxContainer(
                        child: Text("0"),
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
                      Text("1:30 s"),
                      kWidth20,
                      CustomTextButton(
                        text: "Resend",
                        voidCallback: () {
                          // print(x1.replaceAll("([0-3])", "*"));
                          // print(args["phone"].toString().substring(
                          //     1, args["phone"].toString().length - 7));
                        },
                      ),
                    ],
                  ),
                  kHeight20,
                  kHeight20,
                  kHeight20,
                  kHeight20,
                  kHeight20,
                  kHeight20,
                  kHeight20,
                  kHeight20,
                  CustomElevatedButton(
                    callback: () {
                      Navigator.pushNamed(context, ResetPassword.routeName);
                    },
                    label: "Continue",
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
