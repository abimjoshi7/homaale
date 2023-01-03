// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account/presentation/pages/kyc/kyc_modal_sheets.dart';
import 'package:cipher/features/account/presentation/pages/settings/settings.dart';
import 'package:cipher/features/account/presentation/widgets/account_list_tile_section.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Account extends StatelessWidget with KycModalSheets {
  const Account({super.key});
  static const routeName = '/account';

  @override
  Widget build(BuildContext context) {
    bool isKycVerified = false;
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
              'Profile',
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
          Stack(
            children: [
              SizedBox(
                height: 160,
                width: double.infinity,
                child: Image.asset(
                  'assets/—Pngtree—blue tech line shading for_4059122 1.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                left: 30,
                top: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                    ),
                    kWidth20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kHeight20,
                        Row(
                          children: const [
                            Text(
                              'FirstName LastName',
                              style: kPurpleText16,
                            ),
                            kWidth5,
                            Icon(
                              Icons.verified,
                              color: Colors.lightBlue,
                            ),
                          ],
                        ),
                        kHeight5,
                        const Text('Individual  |  Gardener'),
                        kHeight5,
                        const Text(
                          'sristisharma@homaale.com',
                          style: kHelper1,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ProfileStatsCard(
                imagePath: 'assets/reward.png',
                label: 'Reward Points',
                value: '199',
              ),
              ProfileStatsCard(
                imagePath: 'assets/wallet.png',
                label: 'Account Balance',
                value: 'Rs. 1,00,000.00',
              ),
            ],
          ),
          kHeight10,
          CustomElevatedButton(
            callback: () {
              Navigator.pushNamed(context, Profile.routeName);
            },
            label: 'View Profile',
          ),
          Visibility(
            visible: isKycVerified == false,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: const BoxDecoration(
                  color: Color(0xffFFF5E5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.info_outline_rounded,
                            size: 20,
                            color: Colors.amber,
                          ),
                          kWidth5,
                          Text('Get your KYC verified now'),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AccountListTileSection(
            onTap: () async {
              await KycModalSheets.showKycFillAs(context);
            },
            icon: const Icon(
              FontAwesomeIcons.idCard,
              color: Color(0xff495057),
            ),
            label: 'KYC',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
          AccountListTileSection(
            onTap: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Color(0xff495057),
            ),
            label: 'Saved',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
          AccountListTileSection(
            onTap: () {},
            icon: const Icon(
              Icons.card_giftcard_outlined,
              color: Color(0xff495057),
            ),
            label: 'Offers',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
          AccountListTileSection(
            onTap: () {
              Navigator.pushNamed(
                context,
                Settings.routeName,
              );
            },
            icon: const Icon(
              Icons.settings,
              color: Color(0xff495057),
            ),
            label: 'Settings',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
          AccountListTileSection(
            onTap: () {},
            icon: const Icon(
              Icons.dark_mode_outlined,
              color: Color(0xff495057),
            ),
            label: 'Dark Mode',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
          AccountListTileSection(
            onTap: () {},
            icon: const Icon(
              Icons.contact_mail_sharp,
              color: Color(0xff495057),
            ),
            label: 'Tax Calculator',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
