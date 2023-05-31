import 'package:flutter/material.dart';

import '../../../../../widgets/custom_app_bar.dart';
import '../../../../tax_calculator/presentation/screens/tax_calculator.dart';
import '../../widgets/account_list_tile_section.dart';
import 'horoscope.dart';

class QuickLinksPage extends StatelessWidget {
  static const routeName = '/quick-links';

  const QuickLinksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Quick Links',
      ),
      body: Column(
        children: [
          AccountListTileSection(
            onTap: () {
              Navigator.pushNamed(
                context,
                HoroscopePage.routeName,
              );
            },
            icon: const Icon(
              Icons.balance_outlined,
            ),
            label: 'Horoscope',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
          AccountListTileSection(
            onTap: () {
              Navigator.pushNamed(
                context,
                TaxCalculator.routeName,
              );
            },
            icon: const Icon(
              Icons.calculate,
            ),
            label: 'Tax Calculator',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
