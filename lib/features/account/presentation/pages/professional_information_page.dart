import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account/presentation/widgets/account_list_tile_section.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfessionalInformationPage extends StatelessWidget {
  const ProfessionalInformationPage({super.key});

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
              'Account',
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
          AccountListTileSection(
            icon: SizedBox.shrink(),
            label: 'Skills',
            trailingWidget: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: SizedBox.shrink(),
            label: 'Portfolio',
            trailingWidget: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: SizedBox.shrink(),
            label: 'Experience',
            trailingWidget: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: SizedBox.shrink(),
            label: 'Education',
            trailingWidget: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: SizedBox.shrink(),
            label: 'Certification',
            trailingWidget: Icon(
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
