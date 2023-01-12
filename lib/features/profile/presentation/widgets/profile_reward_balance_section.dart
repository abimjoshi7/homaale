import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
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
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        Widget displayRewardPoints() {
          if (state is UserDataLoadSuccess) {
            return ProfileStatsCard(
              imagePath: 'assets/reward.png',
              label: 'Reward Points',
              value: state.userData.points.toString(),
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
