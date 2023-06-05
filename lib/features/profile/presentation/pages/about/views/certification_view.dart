import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/documents/presentation/pages/edit/edit_certification.dart';
import 'package:cipher/features/documents/presentation/pages/pages.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CertificationView extends StatelessWidget {
  const CertificationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskerCertificationCubit, TaskerCertificationState>(
      builder: (context, state) {
        if (state is TaskerGetCertificationSuccess) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Certification',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AddCertifications.routeName,
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      state.taskerCertificationRes.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                      Uri.parse(
                                        state.taskerCertificationRes[index].certificateUrl ?? 'www.google.com',
                                      ),
                                    );
                                  },
                                  child: Text(
                                    state.taskerCertificationRes[index].name ?? '',
                                    style: kText17,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          constraints: const BoxConstraints(
                                            maxHeight: 800,
                                          ),
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) => EditCertification(
                                            id: state.taskerCertificationRes[index].id!,
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.edit_outlined,
                                        size: 18,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        await context.read<TaskerCertificationCubit>().deleteTaskerCertification(
                                              state.taskerCertificationRes[index].id!,
                                            );
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline_outlined,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Text(
                              state.taskerCertificationRes[index].description ?? '',
                              style: kText15,
                            ),
                            if (state.taskerCertificationRes.isEmpty)
                              const SizedBox.shrink()
                            else
                              Text(
                                '${DateFormat('yyyy-MM-dd').format(state.taskerCertificationRes[index].issuedDate ?? DateTime.now())} - ${DateFormat('yyyy-MM-dd').format(state.taskerCertificationRes[index].expireDate ?? DateTime.now())}',
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
        }
        return const SizedBox.shrink();
      },
    );
  }
}
