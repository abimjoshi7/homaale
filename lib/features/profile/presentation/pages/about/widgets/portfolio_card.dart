import 'package:flutter/material.dart';

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({
    Key? key,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  final String imagePath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: 150,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label),
          )
        ],
      ),
    );
  }
}
