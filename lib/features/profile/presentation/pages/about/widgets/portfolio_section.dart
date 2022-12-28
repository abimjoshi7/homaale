import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Portfolio',
          ),
          kHeight10,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                PortfolioCard(
                  label: 'Garden Cleaning',
                  imagePath: 'assets/Casual life 3D - 39.png',
                ),
                kWidth5,
                PortfolioCard(
                  label: 'Kitchen Cleaning',
                  imagePath: 'assets/Casual life 3D - 39.png',
                ),
                kWidth5,
                PortfolioCard(
                  label: 'Motor Cleaning',
                  imagePath: 'assets/Casual life 3D - 39.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
