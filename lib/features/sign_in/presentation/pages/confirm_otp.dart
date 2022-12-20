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
          const Text(
            "Please enter the 4 digit code send to 6977 9830******",
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
                        theWidth: 80,
                        theHeight: 50,
                      ),
                      SmallBoxContainer(
                        child: Text("0"),
                        theWidth: 80,
                        theHeight: 50,
                      ),
                      SmallBoxContainer(
                        child: Text("0"),
                        theWidth: 80,
                        theHeight: 50,
                      ),
                      SmallBoxContainer(
                        child: Text("0"),
                        theWidth: 80,
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
                        voidCallback: () {},
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
