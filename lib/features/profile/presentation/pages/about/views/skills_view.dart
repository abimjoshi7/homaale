import 'dart:convert';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SkillsView extends StatefulWidget {
  const SkillsView({
    super.key,
  });

  @override
  State<SkillsView> createState() => _SkillsViewState();
}

class _SkillsViewState extends State<SkillsView> {
  final tagsController = TextfieldTagsController();

  @override
  void dispose() {
    tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          final List<String> skills = [
            ...jsonDecode(
              state.taskerProfile?.skill ?? '',
            )
          ];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Skills'),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CustomModalSheetDrawerIcon(),
                              Padding(
                                padding: kPadding10,
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Skills',
                                              style: kPurpleText16,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                tagsController.clearTags();
                                              },
                                              child: const Text(
                                                'Clear All',
                                                style: kHelper13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        kHeight5,
                                        CustomTagTextField(
                                          tagController: tagsController,
                                          hintText: 'Enter your skills',
                                          initialList:
                                              skills.isEmpty ? [] : skills,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              BlocConsumer<UserBloc, UserState>(
                                listener: (context, state) async {
                                  if (state.theStates == TheStates.success) {
                                    showDialog(
                                      context: context,
                                      builder: (_) => CustomToast(
                                        heading: 'Success',
                                        content: 'Skills updated successfully',
                                        onTap: () {
                                          Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            Profile.routeName,
                                            (route) => false,
                                          );
                                        },
                                        isSuccess: true,
                                      ),
                                    ).then(
                                      (value) => context.read<UserBloc>().add(
                                            UserLoaded(),
                                          ),
                                    );
                                  }
                                  if (state.theStates == TheStates.failure) {
                                    showDialog(
                                      context: context,
                                      builder: (_) => CustomToast(
                                        heading: 'Failure',
                                        content: 'Skills update failed.',
                                        onTap: () {},
                                        isSuccess: false,
                                      ),
                                    ).then(
                                      (value) => context.read<UserBloc>().add(
                                            UserLoaded(),
                                          ),
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  return CustomElevatedButton(
                                    callback: () async {
                                      context.read<UserBloc>().add(
                                            UserEdited(
                                              req: {
                                                'skill': jsonEncode(
                                                  tagsController.getTags,
                                                ),
                                              },
                                            ),
                                          );
                                    },
                                    label: 'Add',
                                  );
                                },
                              ),
                              kHeight50,
                            ],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      size: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      SkillBox(label: skills[index]),
                  separatorBuilder: (context, index) => kWidth10,
                  itemCount: skills.length,
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
