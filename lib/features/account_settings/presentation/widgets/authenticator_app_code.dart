import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AuthenticatorAppCode extends StatelessWidget {
  const AuthenticatorAppCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomModalSheetDrawerIcon(),
        const Text(
          'Authenticator App Code',
          style: kPurpleText16,
        ),
        kHeight20,
        Image.asset('assets/fake_qr.png'),
        kHeight20,
        const Text(
          'Scan this QR Code or request a key',
          style: kPurpleText13,
        ),
        Padding(
          padding: kPadding20,
          child: Column(
            children: const [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Complete set- up by scanning the QR code shown. If you can’t scan the code',
                    ),
                    TextSpan(
                      text: ' provide you with a key.',
                      style: TextStyle(
                        color: kColorBlue,
                      ),
                    ),
                  ],
                ),
              ),
              kHeight20,
              CustomTextFormField(
                hintText: 'Enter code by your authenticator app',
              ),
              kHeight20,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'You can ',
                    ),
                    TextSpan(
                      text: 'download an authenticator ',
                      style: TextStyle(
                        color: kColorBlue,
                      ),
                    ),
                    TextSpan(
                      text:
                          'to your phone from the App or Google Play Store.\n\n',
                    ),
                    TextSpan(
                      text:
                          'Enter the six- digit code from the application \n\n',
                      style: kPurpleText16,
                    ),
                    TextSpan(
                      text:
                          'After scanning the QR code, the app will display a six- digit code that you can enter below.',
                    ),
                  ],
                ),
              ),
              kHeight20,
              CustomTextFormField(
                hintText: 'Enter six digit code',
              ),
              kHeight20,
            ],
          ),
        ),
        CustomElevatedButton(
          callback: () {},
          label: 'Finish',
        ),
      ],
    );
  }
}
