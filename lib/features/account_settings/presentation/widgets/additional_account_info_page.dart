import 'package:cipher/core/mixins/the_modal_bottom_sheet.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdditionalAccountInfoPage extends StatelessWidget
    with TheModalBottomSheet {
  const AdditionalAccountInfoPage({super.key});
  static const routeName = '/additional-account-info-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "Account"),
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
            child: Text(
              'Account',
              style: Theme.of(context).textTheme.bodySmall,
              // style: TextStyle(
              //   fontSize: 14,
              //   fontWeight: FontWeight.w500,
              //   color: Color(
              //     0xff212529,
              //   ),
              // ),
            ),
          ),
          const Divider(),

          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Personal information',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {
              showCustomBottomSheet(
                context: context,
                widget: const PersonalInformationPage(),
              );
            },
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Address information',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {
              showCustomBottomSheet(
                context: context,
                widget: const AddressInformationPage(),
              );
            },
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Professional information',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {
              showCustomBottomSheet(
                context: context,
                widget: const ProfessionalInformationModalSheet(),
              );
            },
          ),
          // AccountListTileSection(
          //   icon: const SizedBox.shrink(),
          //   label: 'Active Hours',
          //   trailingWidget: const Icon(
          //     Icons.arrow_forward_ios_rounded,
          //     size: 12,
          //   ),
          //   onTap: () {
          //     showModalBottomSheet(
          //       constraints: BoxConstraints(maxHeight: 800),
          //       isScrollControlled: true,
          //       context: context,
          //       builder: (context) => ActiveHoursPage(),
          //     );
          //   },
          // ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Profile Configuration',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {
              showCustomBottomSheet(
                context: context,
                widget: const ProfileConfigModalSheet(),
              );
            },
          ),
        ],
      ),
    );
  }
}
