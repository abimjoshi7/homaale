import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Experience',
            style: kHeading2,
          ),
          kHeight10,
          Text('Garden Cleaner'),
          Text(
            'Cagtu. Full-time',
            style: kHelper1,
          ),
          Text(
              'I am excited about helping companies with their product development, management and strategy. I specialize in deep tech and hard analytical problems.'),
          Text(
            'June 2002-Present',
            style: kHelper1,
          )
        ],
      ),
    );
  }
}
