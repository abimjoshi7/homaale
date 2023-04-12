import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});
  static const routeName = '/notifications-page';

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
              'Notifications',
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
          AccountListTileSection(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'Messages',
                  style: kPurpleText19,
                ),
                Text('Message notification content'),
              ],
            ),
            label: '',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'Email',
                  style: kPurpleText19,
                ),
                Text('Email notification content'),
              ],
            ),
            label: '',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'Messages',
                  style: kPurpleText19,
                ),
                Text('Message notification content'),
              ],
            ),
            label: '',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'Proposal',
                  style: kPurpleText19,
                ),
                Text('Proposal notification content'),
              ],
            ),
            label: '',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'Contracts',
                  style: kPurpleText19,
                ),
                Text('Contract notification content'),
              ],
            ),
            label: '',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'Group & Invitations',
                  style: kPurpleText19,
                ),
                Text('Group & Invitation notification content'),
              ],
            ),
            label: '',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'Memberships',
                  style: kPurpleText19,
                ),
                Text('Membership notification content'),
              ],
            ),
            label: '',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'Miscellaneous',
                  style: kPurpleText19,
                ),
                Text('Miscellaneous notification content'),
              ],
            ),
            label: '',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
