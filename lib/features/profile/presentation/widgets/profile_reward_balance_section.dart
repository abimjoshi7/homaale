import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileRewardBalanceSection extends StatelessWidget {
  const ProfileRewardBalanceSection({
    super.key,
    required this.user,
  });

  final String user;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: user == 'self',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          ProfileStatsCard(
            imagePath: 'assets/reward.png',
            label: 'Reward Points',
            value: '199',
          ),
          ProfileStatsCard(
            imagePath: 'assets/wallet.png',
            label: 'Account Balance',
            value: 'Rs. 1,00,000.00',
          ),
        ],
      ),
    );
  }
}
