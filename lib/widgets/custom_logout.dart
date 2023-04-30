import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CustomLogout extends StatelessWidget {
  const CustomLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 8,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/5844 2.png",
                ),
              ),
            ),
          ),
          Text(
            "Hope to see you back soon",
            style: kPurpleText19,
            textAlign: TextAlign.center,
          ),
          addVerticalSpace(8),
          Text(
            "Are you sure you want to logout from Homaale?",
            style: kHelper15,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SizedBox(
                height: 40,
                width: 100,
                child: CustomElevatedButton(
                  callback: () {
                    Navigator.pop(context);
                  },
                  label: "Cancel",
                  mainColor: Colors.white,
                  textColor: kColorPrimary,
                  borderColor: kColorPrimary,
                ),
              ),
            ),
            addHorizontalSpace(
              10,
            ),
            Flexible(
              child: SizedBox(
                height: 40,
                width: 100,
                child: CustomElevatedButton(
                  callback: () async {
                    context.read<SignInBloc>().add(
                          SignOutInitiated(),
                        );
                    await Navigator.pushNamedAndRemoveUntil(
                      context,
                      SignInPage.routeName,
                      (route) => false,
                    );
                  },
                  label: "Yes, I'm sure",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
