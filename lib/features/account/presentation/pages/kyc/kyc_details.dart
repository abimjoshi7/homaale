import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account/presentation/widgets/account_list_tile_section.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class KycDetails extends StatelessWidget {
  const KycDetails({super.key});
  static const routeName = '/kyc-details';

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
              'KYC Details',
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
            icon: const SizedBox.shrink(),
            label: 'General Info',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Bank Details',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Identity Info',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
