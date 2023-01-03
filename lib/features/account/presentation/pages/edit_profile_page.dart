import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account/presentation/widgets/account_list_tile_section.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  static const routeName = '/edit-profile-page';
  const EditProfilePage({super.key});

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
          Divider(),
          Expanded(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                      ),
                    ),
                    kHeight15,
                    Center(
                      child: Text(
                        'Change profile photo',
                        style: kPurpleText16,
                      ),
                    ),
                    kHeight50,
                    Text(
                      'Full name',
                      style: kPurpleText16,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: 'Harry Smith',
                    ),
                    kHeight20,
                    Text(
                      'Designation',
                      style: kPurpleText16,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: 'Pilot',
                    ),
                    kHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
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
                    Text(
                      'Do you want to enable task analytics in profile?',
                      style: kHelper1,
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
            icon: SizedBox.shrink(),
            label: 'Additional account setting',
            trailingWidget: Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {},
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
