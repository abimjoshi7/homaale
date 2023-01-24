import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              textColor: kColorBlueText,
            );
          } else {
            return const NumberCountText(
              numberText: '0',
              textColor: kColorBlueText,
            );
          }
        }

        Widget buildTaskinProgress() {
          if (state is UserLoadSuccess) {
            return NumberCountText(
              numberText: state.user.stats!.taskInProgress!.toString(),
              textColor: kColorAmberText,
            );
          } else {
            return const NumberCountText(
              numberText: '0',
              textColor: kColorAmberText,
            );
          }
        }

        Widget buildTaskSuccessRate() {
          if (state is UserLoadSuccess) {
            return NumberCountText(
              numberText: state.user.stats!.successRate!.toString(),
              textColor: kColorGreenText,
            );
          } else {
            return const NumberCountText(
              numberText: '0',
              textColor: kColorGreenText,
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
