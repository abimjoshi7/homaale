import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
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
                      numberText: state.taskerProfile?.stats?.taskAssigned
                              ?.toInt()
                              .toString() ??
                          '',
                      textColor: kColorBlue,
                    ),
                    const Text('Task Created'),
                  ],
                ),
                Column(
                  children: [
                    NumberCountText(
                      numberText:
                          state.taskerProfile?.stats?.taskInProgress == null
                              ? '0'
                              : state.taskerProfile?.stats?.taskInProgress
                                      ?.toInt()
                                      .toString() ??
                                  '',
                      textColor: kColorAmber,
                    ),
                    const Text('Task in Progress')
                  ],
                ),
                Column(
                  children: [
                    NumberCountText(
                      numberText: state.taskerProfile?.stats?.successRate
                              ?.toInt()
                              .toString() ??
                          '',
                      textColor: kColorGreen,
                    ),
                    const Text('Success Rate'),
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
