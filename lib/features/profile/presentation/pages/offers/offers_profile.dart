import 'package:cipher/features/profile/presentation/pages/services/widgets/services_text_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OffersProfile extends StatelessWidget {
  const OffersProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 7,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
