import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/preference/presentation/pages/preference.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SignInScaffold extends StatelessWidget {
  const SignInScaffold({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
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
                    addVerticalSpace(
                        MediaQuery.of(context).size.height * 0.050),
                    Padding(
                      padding: addPadding(context, 0.020),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
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
                                visible: true,
                                child: Row(
                                  children: [
                                    Text(
                                      'Skip',
                                      style: kSkipHelper.copyWith(
                                          color: Colors.white),
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
                    // addVerticalSpace(MediaQuery.of(context).size.height * 0.050),
                  ],
                ),
                Positioned(
                  top: (state.theStates == TheStates.initial &&
                          state.hasValidationErrors)
                      ? MediaQuery.of(context).size.height * 0.23
                      : MediaQuery.of(context).size.height * 0.265,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
