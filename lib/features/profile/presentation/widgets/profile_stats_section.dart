import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ProfileStatsSection extends StatelessWidget {
  const ProfileStatsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          return Padding(
            padding: kPadding10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    NumberCountText(
                      numberText: state.taskerProfile?.stats?.successRate?.toStringAsFixed(2).toString() ?? '',
                      textColor: kColorGreen,
                    ),
                    Text(
                      'Success Rate',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Column(
                  children: [
                    NumberCountText(
                      numberText: state.taskerProfile?.stats?.happyClients?.toInt().toString() ?? '',
                      textColor: Colors.purple,
                    ),
                    Text(
                      'Happy Clients',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Column(
                  children: [
                    NumberCountText(
                      numberText: state.taskerProfile?.stats?.taskCompleted == null
                          ? '0'
                          : state.taskerProfile?.stats?.taskCompleted?.toInt().toString() ?? '',
                      textColor: kColorAmber,
                    ),
                    Text(
                      'Tasks Completed',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
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
