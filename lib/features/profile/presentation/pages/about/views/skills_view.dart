// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/features/utilities/data/models/skill_option_model.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/skills/skills_bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class SkillsView extends StatefulWidget {
  const SkillsView({
    Key? key,
    this.style,
    this.isForm = false,
  }) : super(key: key);
  final TextStyle? style;
  final bool isForm;
  @override
  State<SkillsView> createState() => _SkillsViewState();
}

class _SkillsViewState extends State<SkillsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          List<int> skills =
              state.taskerProfile?.skills?.map((e) => e.id!).toList() ?? [];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Skills',
                    style: widget.style ?? null,
                  ),
                  addVerticalSpace(10),
                  Visibility(
                    visible: widget.isForm,
                    child: IconButton(
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
                                                  skills.clear();
                                                },
                                                child: const Text(
                                                  'Clear All',
                                                  style: kHelper13,
                                                ),
                                              ),
                                            ],
                                          ),
                                          kHeight5,
                                          BlocBuilder<SkillsBloc, SkillsState>(
                                            builder: (context, state) {
                                              if (state.theStates ==
                                                  TheStates.success) {
                                                return MultiSelectDialogField(
                                                  initialValue: widget.isForm
                                                      ? state.skillsIdList ??
                                                          skills
                                                      : skills,
                                                  items: List.generate(
                                                    state.skillListRes.length,
                                                    (index) => MultiSelectItem(
                                                      state.skillListRes[index]
                                                          .id,
                                                      state.skillListRes[index]
                                                          .name
                                                          .toString(),
                                                    ),
                                                  ),
                                                  onConfirm: (p0) {
                                                    setState(
                                                      () {
                                                        skills = p0
                                                            .map((e) => e!)
                                                            .toList();
                                                      },
                                                    );
                                                  },
                                                );
                                              }
                                              return SizedBox.shrink();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                BlocConsumer<UserBloc, UserState>(
                                  listener: (context, state) async {
                                    // if (state.theStates == TheStates.success && state.isEdited == true) {
                                    //   // context.read<UserBloc>().add(UserLoaded());
                                    //   showDialog(
                                    //     context: context,
                                    //     builder: (_) => CustomToast(
                                    //       heading: 'Success',
                                    //       content: 'Skills updated successfully',
                                    //       onTap: () {
                                    //         Navigator.pushNamed(
                                    //           context,
                                    //           Profile.routeName,
                                    //         );
                                    //       },
                                    //       isSuccess: true,
                                    //     ),
                                    //   );
                                    // }
                                    // if (state.theStates == TheStates.failure) {
                                    //   showDialog(
                                    //     context: context,
                                    //     builder: (_) => CustomToast(
                                    //       heading: 'Failure',
                                    //       content: 'Skills update failed.',
                                    //       onTap: () {},
                                    //       isSuccess: false,
                                    //     ),
                                    //   ).then(
                                    //     (value) => context.read<UserBloc>().add(UserLoaded()),
                                    //   );
                                    // }
                                  },
                                  builder: (context, state) {
                                    return CustomElevatedButton(
                                      callback: () async {
                                        if (widget.isForm) {
                                          context.read<SkillsBloc>().add(
                                                SelectedSkillsOptionsStore(
                                                  selectedSkills: skills,
                                                ),
                                              );
                                          Navigator.pop(context);
                                        }
                                        if (!widget.isForm) {
                                          context.read<UserBloc>().add(
                                                UserEdited(
                                                  req: {
                                                    'skills': skills,
                                                  },
                                                ),
                                              );
                                        }
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
                  ),
                ],
              ),
              BlocBuilder<SkillsBloc, SkillsState>(
                builder: (context, state) {
                  final List<String> _skillNames = _getSkillNames(
                    skillsIdList:
                        widget.isForm ? state.skillsIdList ?? skills : skills,
                    skillModelList: state.skillListRes,
                  );
                  ;

                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.043,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          SkillBox(label: _skillNames[index]),
                      separatorBuilder: (context, index) => kWidth10,
                      itemCount: _skillNames.length,
                    ),
                  );
                },
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

List<String> _getSkillNames({
  required List<int> skillsIdList,
  required List<SkillOptionModel> skillModelList,
}) {
  final List<String> _list = [];
  for (final skillOption in skillModelList) {
    if (skillsIdList.contains(skillOption.id)) {
      if (skillOption.name != null) _list.add(skillOption.name!);
    }
  }
  return _list;
}
