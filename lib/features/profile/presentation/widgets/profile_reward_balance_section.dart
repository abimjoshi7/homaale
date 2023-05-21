import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/features/wallet/presentation/bloc/wallet_bloc.dart';
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
            child: BlocProvider(
              create: (context) => WalletBloc(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileStatsCard(
                    imagePath: 'assets/reward.png',
                    label: 'Reward Points',
                    value: state.taskerProfile?.points.toString() ?? '',
                  ),
                  BlocBuilder<WalletBloc, WalletState>(
                    builder: (context, walletState) {
                      return ProfileStatsCard(
                        imagePath: 'assets/wallet.png',
                        label: 'Account Balance',
                        value: walletState.walletModel.length == 0
                            ? 'Rs. 0'
                            : "Rs. ${walletState.walletModel.first.availableBalance.toString()}",
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
