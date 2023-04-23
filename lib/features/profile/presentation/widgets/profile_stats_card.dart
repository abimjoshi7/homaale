import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ProfileStatsCard extends StatelessWidget {
  const ProfileStatsCard({
    super.key,
    required this.label,
    required this.imagePath,
    required this.value,
  });

  final String label;
  final String imagePath;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 150,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath),
                kWidth5,
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
