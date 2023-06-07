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
        Row(
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (isVerified == true)
              const Icon(
                Icons.verified,
                color: Colors.lightBlue,
              ),
          ],
        ),
        Text(designation == '' ? 'Hoomale User' : designation),
        Text(credentialId),
      ],
    );
  }
}
