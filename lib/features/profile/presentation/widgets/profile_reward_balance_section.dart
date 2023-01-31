import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        Widget displayRewardPoints() {
          if (state is UserLoadSuccess) {
            return ProfileStatsCard(
              imagePath: 'assets/reward.png',
              label: 'Reward Points',
              value: state.user.points.toString(),
            );
          } else {
            return const ProfileStatsCard(
              imagePath: 'assets/reward.png',
              label: 'Reward Points',
              value: '000',
            );
          }
        }

        return Visibility(
          visible: user == 'self',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              displayRewardPoints(),
              const ProfileStatsCard(
                imagePath: 'assets/wallet.png',
                label: 'Account Balance',
                value: 'Rs. 1,00,000.00',
              ),
            ],
          ),
        );
      },
    );
  }
}
