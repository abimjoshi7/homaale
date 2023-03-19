import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BookedServicePage extends StatelessWidget {
  static const routeName = '/booked-service-page';
  const BookedServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(
            50,
          ),
          CustomHeader(
            label: "Trimming and Cutting",
          ),
          PriceBookFooterSection(
            bgColor: kColorGreen.withOpacity(
              0.2,
            ),
            buttonLabel: 'Approve',
            buttonColor: kColorGreen,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
