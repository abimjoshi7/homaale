import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/tax_calculator/presentation/screens/pages.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_tags/textfield_tags.dart';

class ProfessionalInformationModalSheet extends StatefulWidget {
  const ProfessionalInformationModalSheet({super.key});

  @override
  State<ProfessionalInformationModalSheet> createState() =>
      _ProfessionalInformationModalSheetState();
}

class _ProfessionalInformationModalSheetState
    extends State<ProfessionalInformationModalSheet> {
  String? userType;
  String? specialities;
  String? experienceLevel;
  TimeOfDay? issuedTime;
  TimeOfDay? completeTime;
  String? daySelect;
  TaskerProfileRetrieveRes? user;
  final tagsController = TextfieldTagsController();
  bool isClient = false;
  bool isTasker = false;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) async {
        // if (state is UserEditSuccess) {
        //   await showDialog(
        //     context: context,
        //     builder: (context) => CustomToast(
        //       heading: 'Success',
        //       content: 'Profile edited succesfully',
        //       onTap: () {
        //         Navigator.pop(context);
        //       },
        //       isSuccess: true,
        //     ),
        //   );
        // }
        // if (state is UserEditFailure) {
        //   await showDialog(
        //     context: context,
        //     builder: (context) => CustomToast(
        //       heading: 'Failure',
        //       content: 'Profile edit cannot be completed',
        //       onTap: () {},
        //       isSuccess: false,
        //     ),
        //   );
        // }
      },
      builder: (context, state) {
        if (state is UserLoadSuccess) {
          user = state.user;
          if (user!.userType!
                  .replaceAll(RegExp(r"\p{P}", unicode: true), '')
                  .split(' ')
                  .length >
              1) {
            isTasker = true;
            isClient = true;
          } else if (user!.userType!
                      .replaceAll(RegExp(r"\p{P}", unicode: true), '')
                      .split(' ')
                      .length ==
                  1 &&
              user!.userType!
                      .replaceAll(RegExp(r"\p{P}", unicode: true), '')
                      .split(' ')
                      .first
                      .toLowerCase()
                      .trim() ==
                  'tasker') {
            isTasker = true;
          } else {
            isClient = true;
          }

          Widget displayClientCheckBox() {
            return Builder(
              builder: (context) => StatefulBuilder(
                builder: (context, setState) => Checkbox(
                  value: isClient,
                  onChanged: (value) {
                    // if (user!.userType!
                    //         .replaceAll(' ', '')
                    //         .toLowerCase()
                    //         .contains('"tasker","client"') ||
                    //     user!.userType!
                    //         .replaceAll(' ', '')
                    //         .toLowerCase()
                    //         .contains('"client","tasker"')) {
                    //   isTasker = true;
                    //   isClient = true;
                    // } else if (user!.userType!.contains("Tasker")) {
                    //   isTasker = true;
                    // } else {
                    //   isClient = true;
                    // }
                    setState(
                      () {
                        isClient = value!;
                      },
                    );
                  },
                ),
              ),
            );
          }

          Widget displayTaskerCheckBox() {
            return StatefulBuilder(
              builder: (context, setState) => Checkbox(
                value: isTasker,
                onChanged: (value) {
                  setState(
                    () {
                      isTasker = value!;
                    },
                  );
                },
              ),
            );
          }

          Widget displaySkills() {
            return CustomTagTextField(
              tagController: tagsController,
              hintText: 'Enter your skills',
              initialList: user!.skill!
                  .split(',')
                  .map(
                    (e) => e.replaceAll(
                      RegExp(r"\p{P}", unicode: true),
                      "",
                    ),
                  )
                  .toList(),
            );
          }

          Widget displayStartTime() {
            return InkWell(
              onTap: () async {
                await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then(
                  (value) => setState(
                    () {
                      startTime = value;
                    },
                  ),
                );
              },
              child: CustomFormContainer(
                hintText: startTime?.format(context) ?? user!.activeHourStart!,
              ),
            );
          }

          Widget displayEndTime() {
            return InkWell(
              onTap: () async {
                await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then(
                  (value) => setState(
                    () {
                      endTime = value;
                    },
                  ),
                );
              },
              child: CustomFormContainer(
                hintText: endTime?.format(context) ?? user!.activeHourEnd!,
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                const CustomModalSheetDrawerIcon(),
                kHeight20,
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Professional Information',
                    style: kPurpleText16,
                  ),
                ),
                Padding(
                  padding: kPadding20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormField(
                        label: 'Select User Type',
                        child: Row(
                          children: [
                            Row(
                              children: [
                                displayClientCheckBox(),
                                const Text('Client'),
                              ],
                            ),
                            Row(
                              children: [
                                displayTaskerCheckBox(),
                                const Text('Tasker')
                              ],
                            ),
                          ],
                        ),
                      ),
                      CustomFormField(
                        label: 'Specialities',
                        child: displaySkills(),
                      ),
                      CustomFormField(
                        label: 'Experience Level',
                        child: CustomDropDownField<String>(
                          hintText:
                              user?.experienceLevel ?? 'Enter your skills',
                          list: const [
                            'Beginner (0 to 1 years experience)',
                            'Intermediate (1 to 5 years experience)',
                            'Expert (5 years experience or more)',
                          ],
                          onChanged: (value) => setState(
                            () {
                              if (value!.startsWith('Be')) {
                                experienceLevel = 'Beginner';
                              } else if (value.startsWith('In')) {
                                experienceLevel = 'Intermediate';
                              } else {
                                experienceLevel = 'Expert';
                              }
                            },
                          ),
                        ),
                      ),
                      const Text(
                        'Active Hours',
                        style: kPurpleText16,
                      ),
                      kHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sunday',
                            style: kPurpleText16,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_outline_rounded,
                              color: kColorPrimary,
                            ),
                          ),
                        ],
                      ),
                      kHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Flexible(
                            child: CustomFormContainer(
                              hintText: '08: 00 AM',
                              leadingWidget: Icon(
                                Icons.access_time_rounded,
                                color: kColorPrimary,
                              ),
                            ),
                          ),
                          kWidth10,
                          Text('To'),
                          kWidth10,
                          Flexible(
                            child: CustomFormContainer(
                              hintText: '09: 00 AM',
                              leadingWidget: Icon(
                                Icons.access_time_rounded,
                                color: kColorPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      kHeight20,
                      CustomFormField(
                        label: 'Select Day',
                        child: CustomDropDownField(
                          hintText: 'Specify the day',
                          list: const [
                            'Every day',
                            'Weekend',
                          ],
                          onChanged: (value) => setState(
                            () {
                              daySelect = value;
                            },
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: CustomFormField(
                              label: 'From',
                              child: displayStartTime(),
                            ),
                          ),
                          kWidth20,
                          Flexible(
                            child: CustomFormField(
                              label: 'To',
                              child: displayEndTime(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  callback: () async {
                    if (isClient && isTasker) {
                      userType = ["Client", "Tasker"]
                          .map((e) => '"$e"')
                          .toList()
                          .toString();
                    } else if (isClient) {
                      userType =
                          ["Client"].map((e) => '"$e"').toList().toString();
                    } else if (isTasker) {
                      userType =
                          ["Tasker"].map((e) => '"$e"').toList().toString();
                    } else {
                      userType = "";
                    }
                    final map = {
                      "user_type": userType ?? user?.userType,
                      "skill": tagsController.getTags!
                          .map((e) => '"$e"')
                          .toList()
                          .toString(),
                      "active_hour_start":
                          startTime?.format(context) ?? user?.activeHourStart,
                      "active_hour_end":
                          endTime?.format(context) ?? user?.activeHourEnd,
                      "experience_level":
                          experienceLevel ?? user?.experienceLevel,
                    };
                    context.read<UserBloc>().add(
                          UserEdited(
                            req: map,
                          ),
                        );
                  },
                  label: 'Save',
                ),
                kHeight20,
              ],
            ),
          );
        }
        return CustomElevatedButton(
          callback: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              CompleteProfilePage.routeName,
              (route) => false,
            );
          },
          label: 'Complete Profile',
        );
      },
    );
  }
}
