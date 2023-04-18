import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/widgets/form_edit_profile_section.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  static const routeName = '/edit-profile-page';
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(appBarTitle: "Edit Profile"),
      body: Column(
        children: [
          const Expanded(
            child: FormEditProfileSection(),
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Additional account setting',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                AdditionalAccountInfoPage.routeName,
              );
            },
          ),
          kHeight10,
        ],
      ),
    );
  }
}
