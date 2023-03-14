import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:flutter/material.dart';

class PackagesOffersSection extends StatelessWidget {
  const PackagesOffersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Packages & Offers',
            style: kPurpleText16,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              4,
              (index) => const Padding(
                padding: EdgeInsets.all(10),
                child: PackagesOffersCard(
                  name: 'Basic',
                  rate: 'Rs 1000/mo',
                  offerName: "Save up to 10%",
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
