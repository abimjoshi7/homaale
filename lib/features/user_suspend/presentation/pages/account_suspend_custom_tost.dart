import 'package:flutter/material.dart';

import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/paddings.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../support/presentation/support_ticket_page.dart';

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
        margin: const EdgeInsets.all(60),
        child: Padding(
          padding: kPadding20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.redAccent,
                  child: Icon(
                    Icons.clear_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              addVerticalSpace(10),
              Text(
                heading,
                style: TextStyle(color: Colors.redAccent),
              ),
              kHeight10,
              Text(content),
              kHeight50,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: CustomElevatedButton(
                      callback: () {
                        Navigator.pushNamed(
                            context, SupportTicketPage.routeName);
                      },
                      label: 'Support',
                    ),
                  ),
                  addHorizontalSpace(30),
                  SizedBox(
                    width: 100,
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
