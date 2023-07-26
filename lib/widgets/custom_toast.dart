import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomToast extends StatelessWidget {
  const CustomToast({
    super.key,
    required this.heading,
    required this.content,
    required this.onTap,
    required this.isSuccess,
    this.buttonLabel,
    this.showBothButtons = false,
  });

  final String heading;
  final String content;
  final VoidCallback onTap;
  final bool isSuccess;
  final String? buttonLabel;
  final bool showBothButtons;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(60),
        child: Padding(
          padding: kPadding20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                heading,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              kHeight10,
              Text(
                content,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 0.6,
                ),
              ),
              kHeight50,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  if (isSuccess == false && showBothButtons == false)
                    SizedBox(
                      width: showBothButtons ? 300 : 150,
                      height: 40,
                      child: CustomElevatedButton(
                        label: 'Cancel',
                        callback: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  else if (showBothButtons == true && isSuccess)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: SizedBox(
                            height: 35,
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
                        // addHorizontalSpace(
                        //   10,
                        // ),
                        Flexible(
                          child: SizedBox(
                            height: 35,
                            width: 100,
                            child: CustomElevatedButton(
                              callback: () => onTap,
                              label: buttonLabel ?? "Continue",
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: CustomElevatedButton(
                        label: buttonLabel ?? 'Continue',
                        callback: onTap,
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
