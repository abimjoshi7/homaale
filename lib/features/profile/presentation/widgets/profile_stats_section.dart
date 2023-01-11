import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileStatsSection extends StatelessWidget {
  const ProfileStatsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: const [
              NumberCountText(
                numberText: '400',
                textColor: kColorBlueText,
              ),
              Text('Task Created')
            ],
          ),
          Column(
            children: const [
              NumberCountText(
                numberText: '30',
                textColor: kColorAmberText,
              ),
              Text('Task in Progress')
            ],
          ),
          Column(
            children: const [
              NumberCountText(
                numberText: '400',
                textColor: kColorGreenText,
              ),
              Text('Success Rate')
            ],
          ),
        ],
      ),
    );
  }
}
