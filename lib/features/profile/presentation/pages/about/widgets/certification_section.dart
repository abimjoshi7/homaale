import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/portfolio/presentation/cubit/tasker_certification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CertificationSection extends StatelessWidget {
  const CertificationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskerCertificationCubit, TaskerCertificationState>(
      builder: (context, state) {
        if (state is TaskerGetCertificationSuccess) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Certification',
                      style: kPurpleText19,
                    ),
                  ),
                  Column(
                    children: List.generate(
                      state.taskerCertificationRes.result!.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              state
                                  .taskerCertificationRes.result![index]!.name!,
                              style: kText17,
                            ),
                            Text(
                              state.taskerCertificationRes.result![index]!
                                  .description!,
                              style: kText15,
                            ),
                            Text(
                              '${state.taskerCertificationRes.result![index]!.issuedDate.toString().substring(0, 10)} - ${state.taskerCertificationRes.result![index]!.expireDate.toString().substring(0, 10)}',
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
          return SizedBox.shrink();
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Certification',
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
