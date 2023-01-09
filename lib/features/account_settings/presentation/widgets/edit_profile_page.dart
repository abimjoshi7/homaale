import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  static const routeName = '/edit-profile-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.pop(context);
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
              'Edit Profile',
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
          Expanded(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 50,
                      ),
                    ),
                    kHeight15,
                    const Center(
                      child: Text(
                        'Change profile photo',
                        style: kPurpleText16,
                      ),
                    ),
                    kHeight50,
                    const Text(
                      'Full name',
                      style: kPurpleText16,
                    ),
                    kHeight5,
                    const CustomTextFormField(
                      hintText: 'Harry Smith',
                    ),
                    kHeight20,
                    const Text(
                      'Designation',
                      style: kPurpleText16,
                    ),
                    kHeight5,
                    const CustomTextFormField(
                      hintText: 'Pilot',
                    ),
                    kHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Task Analytics',
                          style: kPurpleText16,
                        ),
                        Switch(
                          value: false,
                          onChanged: (value) {},
                        )
                      ],
                    ),
                    kHeight5,
                    const Text(
                      'Do you want to enable task analytics in profile?',
                      style: kHelper13,
                    ),
                    kHeight50,
                    Center(
                      child: CustomElevatedButton(
                        callback: () {},
                        label: 'Save',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Additional account setting',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
