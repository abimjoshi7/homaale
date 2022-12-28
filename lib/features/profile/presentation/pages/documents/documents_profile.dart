import 'package:cipher/features/profile/presentation/pages/documents/widgets/document_text_card.dart';
import 'package:flutter/material.dart';

class DocumentsProfile extends StatelessWidget {
  const DocumentsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const DocumentTextCard(
          imagePath: 'assets/Casual life 3D - 39.png',
          label: 'Registration.jpg',
          iconPath: 'assets/2.png',
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
        ),
      ),
    );
  }
}
