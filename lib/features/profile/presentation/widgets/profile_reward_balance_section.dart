import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ProfileRewardBalanceSection extends StatelessWidget {
  const ProfileRewardBalanceSection({
    super.key,
    required this.user,
  });

  final String user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          return Visibility(
            visible: user == 'self',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileStatsCard(
                  imagePath: 'assets/reward.png',
                  label: 'Reward Points',
                  value: state.taskerProfile?.points.toString() ?? '',
                ),
                const ProfileStatsCard(
                  imagePath: 'assets/wallet.png',
                  label: 'Account Balance',
                  value: 'Rs. 1,00,000.00',
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
