import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/profile.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});
  static const routeName = '/complete-profile-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Profile.routeName,
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            trailingWidget: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            child: const Text(
              'Complete Profile',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(
                  0xff212529,
                ),
              ),
            ),
          ),
          const Divider(),
          const ProfileCompletionForm(),
        ],
      ),
    );
  }
}
