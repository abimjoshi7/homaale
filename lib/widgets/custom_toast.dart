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
  });

  final String heading;
  final String content;
  final VoidCallback onTap;
  final bool isSuccess;
  final String? buttonLabel;

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
              Text(content),
              kHeight50,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  if (isSuccess == false)
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: CustomElevatedButton(
                        label: 'Cancel',
                        callback: () {
                          Navigator.pop(context);
                        },
                      ),
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
