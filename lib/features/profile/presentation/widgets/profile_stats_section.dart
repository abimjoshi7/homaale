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
        Widget buildTaskCreated() {
          if (state is UserLoadSuccess) {
            return NumberCountText(
              numberText: state.user.stats!.taskAssigned!.toString(),
              textColor: kColorBlue,
            );
          } else {
            return const NumberCountText(
              numberText: '0',
              textColor: kColorBlue,
            );
          }
        }

        Widget buildTaskinProgress() {
          if (state is UserLoadSuccess) {
            return NumberCountText(
              numberText: state.user.stats!.taskInProgress!.toString(),
              textColor: kColorAmber,
            );
          } else {
            return const NumberCountText(
              numberText: '0',
              textColor: kColorAmber,
            );
          }
        }

        Widget buildTaskSuccessRate() {
          if (state is UserLoadSuccess) {
            return NumberCountText(
              numberText: state.user.stats!.successRate!.toString(),
              textColor: kColorGreen,
            );
          } else {
            return const NumberCountText(
              numberText: '0',
              textColor: kColorGreen,
            );
          }
        }

        return Padding(
          padding: kPadding10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  buildTaskCreated(),
                  const Text('Task Created'),
                ],
              ),
              Column(
                children: [
                  buildTaskinProgress(),
                  const Text('Task in Progress')
                ],
              ),
              Column(
                children: [
                  buildTaskSuccessRate(),
                  const Text('Success Rate'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
