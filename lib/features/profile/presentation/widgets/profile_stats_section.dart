import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileStatsSection extends StatelessWidget {
  const ProfileStatsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        Widget buildTaskCreated() {
          if (state is UserDataLoadSuccess) {
            return NumberCountText(
              numberText: state.userData.stats!.taskAssigned!.toString(),
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
          if (state is UserDataLoadSuccess) {
            return NumberCountText(
              numberText: state.userData.stats!.taskInProgress!.toString(),
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
          if (state is UserDataLoadSuccess) {
            return NumberCountText(
              numberText: state.userData.stats!.successRate!.toString(),
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
