import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/features/profile/presentation/pages/services/widgets/services_text_card.dart';
import 'package:flutter/material.dart';

class ServicesProfile extends StatelessWidget {
  const ServicesProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 8,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => const ServicesTextCard(
          price: "Rs 2000",
          location: "Shantinagar",
          reviewNumber: "4.5(200)",
          address: "Buddhanagar, KTM",
          title: "Garden Redesign",
          imagePath: "assets/Casual life 3D - 43.png",
          description:
              "Almost no computer knowledge, socan provide the fitness for... ",
        ),
      ),
    );
  }
}
