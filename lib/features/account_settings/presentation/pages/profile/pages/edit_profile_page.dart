import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/sections/edit_profile_section.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/paddings.dart';

class EditProfilePage extends StatefulWidget {
  static const routeName = '/edit-profile-page';
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        appBarTitle: "Edit Profile",
        trailingWidget: SizedBox.shrink(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          addVerticalSpace(20),
          TabBar(
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            controller: _tabController,
            tabs: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  General',
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Address',
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Professional',
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Configuration  ',
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                EditProfileSection(),
                AddressInformationPage(),
                ProfessionalInformationModalSheet(),
                ProfileConfigModalSheet(),
              ],
            ),
          ),
          // AccountListTileSection(
          //   icon: const SizedBox.shrink(),
          //   label: 'Additional account setting',
          //   trailingWidget: const Icon(
          //     Icons.arrow_forward_ios,
          //     size: 16,
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(
          //       context,
          //       AdditionalAccountInfoPage.routeName,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
