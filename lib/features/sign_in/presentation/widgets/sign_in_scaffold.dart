import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/preference/presentation/pages/preference.dart';
import 'package:flutter/material.dart';

class SignInScaffold extends StatelessWidget {
  const SignInScaffold({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/main_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              kHeight50,
              Padding(
                padding: kPadding20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Preference.routeName,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Visibility(
                          visible: false,
                          child: Row(
                            children: const [
                              Text(
                                'Skip',
                                style: kSkipHelper,
                              ),
                              kWidth10,
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 12,
                                color: Color(0xffdee2e6),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.3,
                width: MediaQuery.of(context).size.width * 0.6,
                child: Image.asset(
                  'assets/homaale_logo_title.png',
                  fit: BoxFit.contain,
                ),
              ),
              kHeight50,
              Expanded(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                    ),
                  ),
                  child: Padding(
                    padding: kPadding20,
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
