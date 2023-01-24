import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/portfolio/presentation/pages/pages.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoadSuccess) {
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
                          'Education',
                          style: kPurpleText19,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AddEducation.routeName,
                            );
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(
                      state.user.education?.length ?? 0,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              state.user.education?[index]?.school ?? '',
                              style: kText17,
                            ),
                            Text(
                              state.user.education?[index]?.degree ?? '',
                              style: kText15,
                            ),
                            Text(
                              '${DateFormat('yyyy-MM-dd').format(state.user.education?[index]?.startDate ?? DateTime.now())} - ${DateFormat('yyyy-MM-dd').format(state.user.education?[index]?.endDate ?? DateTime.now())}',
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
            padding: kPadding20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Education',
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
