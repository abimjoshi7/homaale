import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SignUpHeaderSection extends StatelessWidget {
  const SignUpHeaderSection({
    super.key,
    required this.mounted,
  });

  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight50,
        CustomHeader(
          leadingWidget: IconButton(
            onPressed: () {
              if (!mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                context,
                SignInPage.routeName,
                (route) => false,
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          trailingWidget: Padding(
            padding: addPadding(context, 0.020),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    context.read<SignInBloc>().add(SignInWithoutCredentials());
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Root.routeName,
                      (route) => false,
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
                            style: kSkipHelper.copyWith(color: kColorSilver),
                          ),
                          kWidth10,
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12,
                            color: kColorSilver,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
         Text(
          'Register',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
         Text(
          'Create your new account',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
