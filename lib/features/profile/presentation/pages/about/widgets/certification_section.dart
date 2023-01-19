import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/portfolio/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CertificationSection extends StatelessWidget {
  const CertificationSection({
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
                    padding: kPadding20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Certification',
                          style: kPurpleText19,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AddCertifications.routeName,
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
                      state.userData.certificates!.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              state.userData.certificates![index]!.name!,
                              style: kText17,
                            ),
                            Text(
                              state.userData.certificates![index]!.description!,
                              style: kText15,
                            ),
                            Text(
                              '${DateFormat('yyyy-MM-dd').format(state.userData.certificates![index]!.issuedDate!)} - ${DateFormat('yyyy-MM-dd').format(state.userData.certificates![index]!.expireDate!)}',
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
