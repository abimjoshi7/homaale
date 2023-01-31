import 'package:flutter/material.dart';

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({
    super.key,
    required this.imagePath,
    required this.label,
    this.islocalImage = true,
  });

  final String imagePath;
  final String label;
  final bool islocalImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: 150,
            child: islocalImage
                ? Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(label),
          )
        ],
      ),
    );
  }
}
