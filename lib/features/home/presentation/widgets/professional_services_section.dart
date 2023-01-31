import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfessionalServicesSection extends StatelessWidget {
  const ProfessionalServicesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SectionHeading(
            labelName: 'Professional services',
            onTap: () {},
          ),
          kHeight20,
          SizedBox(
            height: 130,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              separatorBuilder: (context, index) => kWidth10,
              itemBuilder: (context, index) => const ServiceCard(),
            ),
          ),
        ],
      ),
    );
  }
}
