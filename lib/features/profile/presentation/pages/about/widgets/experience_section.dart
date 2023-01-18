import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/portfolio/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoadSuccess) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Experience',
                          style: kPurpleText19,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AddExperience.routeName,
                            );
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(
                      state.userData.experience!.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              state.userData.experience![index]!.title!,
                              // state.taskerExperienceRes.result![index]!.title!,
                              style: kText17,
                            ),
                            Text(
                              '${state.userData.experience![index]!.companyName!}. ${state.userData.experience![index]!.employmentType}',
                              style: kHelper13,
                            ),
                            Text(
                              state.userData.experience![index]!.description!,
                              style: kText15,
                            ),
                            Text(
                              // '${state.taskerExperienceRes.result![index]!.startDate.toString().substring(0, 10)} - ${state.taskerExperienceRes.result![index]!.endDate.toString().substring(0, 10)}',
                              '${DateFormat('yyyy-MM-dd').format(state.userData.experience![index]!.startDate!)} - ${DateFormat('yyyy-MM-dd').format(state.userData.experience![index]!.endDate!)}',
                              style: kHelper13,
                            ),
                            const Divider()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Experience',
                  style: kPurpleText19,
                ),
                kHeight10,
                Text('Garden Cleaner'),
                Text(
                  'Cagtu. Full-time',
                  style: kHelper13,
                ),
                Text(
                  'I am excited about helping companies with their product development, management and strategy. I specialize in deep tech and hard analytical problems.',
                ),
                Text(
                  'June 2002-Present',
                  style: kHelper13,
                )
              ],
            ),
          );
        }
      },
    );
  }
}
