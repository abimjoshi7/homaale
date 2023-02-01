import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_tags/textfield_tags.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tagsController = TextfieldTagsController();
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoadSuccess) {
          final x = state.user.skill?.replaceAll(RegExp(r"[^\s\w]"), '');
          final skills = x?.split(' ');
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Skills'),
                    IconButton(
                      onPressed: () {
                        buildSkills(context, state, tagsController, skills);
                      },
                      icon: const Icon(
                        Icons.edit_outlined,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => skills!.first != ''
                        ? SkillBox(label: skills[index])
                        : const SizedBox.shrink(),
                    separatorBuilder: (context, index) => kWidth10,
                    itemCount: skills?.length ?? 0,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Future<dynamic> buildSkills(
    BuildContext context,
    UserLoadSuccess state,
    TextfieldTagsController tagsController,
    List<String>? skills,
  ) {
    return showModalBottomSheet(
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
              padding: kPadding20,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        initialList: skills?.first == '' ? [] : skills,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BlocConsumer<UserBloc, UserState>(
              listener: (context, state) async {
                if (state is UserEditSuccess) {
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
                if (state is UserEditFailure) {
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
                    final map = {
                      'skill':
                          '${tagsController.getTags!.map((s) => "'$s'").toList()}',
                    };

                    context.read<UserBloc>().add(
                          UserEdited(
                            req: map,
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
  }
}
