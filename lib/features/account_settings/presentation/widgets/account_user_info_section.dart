import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class AccountUserInfoSection extends StatelessWidget {
  const AccountUserInfoSection({
    super.key,
    required this.name,
    required this.isVerified,
    required this.designation,
    required this.credentialId,
  });

  final String name;
  final bool isVerified;
  final String designation;
  final String credentialId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight20,
        Row(
          children: [
            Text(
              name,
              style: kPurpleText16,
            ),
            kWidth5,
            if (isVerified == true)
              const Icon(
                Icons.verified,
                color: Colors.lightBlue,
              ),
          ],
        ),
        kHeight5,
        Text(designation),
        kHeight5,
        Text(
          credentialId,
          style: kHelper13,
        ),
      ],
    );
  }
}
