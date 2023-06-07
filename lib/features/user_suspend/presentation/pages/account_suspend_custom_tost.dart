import 'package:cipher/features/contact_us/presentation/contact_us_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/paddings.dart';
import '../../../../widgets/custom_elevated_button.dart';

class AccountSuspendCustomToast extends StatelessWidget {
  const AccountSuspendCustomToast({
    super.key,
    required this.heading,
    required this.content,
  });

  final String heading;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(50),
        child: Padding(
          padding: kPadding20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                heading,
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ),
              kHeight10,
              Text('$content.'),
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: CustomElevatedButton(
                      borderColor: Theme.of(context).primaryColor,
                      mainColor: Colors.white,
                      callback: () {
                        Navigator.pop(context);
                      },
                      label: 'Cancel',
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: CustomElevatedButton(
                      callback: () {
                        Navigator.pushNamed(context, ContactUsPage.routeName);
                      },
                      label: 'Contact Us',
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
