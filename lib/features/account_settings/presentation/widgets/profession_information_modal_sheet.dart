import 'dart:convert';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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
  final tagsController = TextfieldTagsController();
  bool isClient = false;
  bool isTasker = false;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) async {
        if (state.theStates == TheStates.success && state.isEdited == true) {
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Success',
              content: 'Profile edited succesfully',
              onTap: () {
                Navigator.pop(context);
              },
              isSuccess: true,
            ),
          );
        }
        if (state.theStates == TheStates.failure && state.isEdited == false) {
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Failure',
              content: 'Profile edit cannot be completed',
              onTap: () {},
              isSuccess: false,
            ),
          );
        }
      },
      builder: (context, state) {
        final list = state.taskerProfile?.skills ?? [];
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(10),
                const Text(
                  'Professional Information',
                  style: kPurpleText16,
                ),
                addVerticalSpace(5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      label: 'Specialities',
                      child: CustomTagTextField(
                        tagController: tagsController,
                        hintText: 'Enter your skills',
                        initialList: list,
                      ),
                    ),
                    addVerticalSpace(5),

                    CustomFormField(
                      label: 'Experience Level',
                      child: CustomDropDownField<String>(
                        hintText: state.taskerProfile?.experienceLevel ??
                            'Enter your skills',
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
                    addVerticalSpace(5),

                    const Text(
                      'Active Hours',
                      style: kPurpleText16,
                    ),
                    // kHeight10,
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
                            child: InkWell(
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
                                hintText: startTime?.format(context) ??
                                    state.taskerProfile!.activeHourStart!,
                              ),
                            ),
                          ),
                        ),
                        kWidth20,
                        Flexible(
                          child: CustomFormField(
                            label: 'To',
                            child: InkWell(
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
                                hintText: endTime?.format(context) ??
                                    state.taskerProfile!.activeHourEnd!,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                addVerticalSpace(8),
              ],
            ),
            CustomElevatedButton(
              callback: () async {
                final map = {
                  // "user_type": userType ?? state.taskerProfile?.userType,
                  "skill": tagsController.getTags!
                      .map((e) => '"$e"')
                      .toList()
                      .toString(),
                  "active_hour_start": startTime?.format(context) ??
                      state.taskerProfile?.activeHourStart,
                  "active_hour_end": endTime?.format(context) ??
                      state.taskerProfile?.activeHourEnd,
                  "experience_level":
                      experienceLevel ?? state.taskerProfile?.experienceLevel,
                };
                context.read<UserBloc>().add(
                      UserEdited(
                        req: map,
                      ),
                    );
              },
              label: 'Save',
            ),
            addVerticalSpace(8),
            CustomElevatedButton(
              callback: () async {
                Navigator.pop(context);
              },
              label: 'Cancel',
              textColor: kColorPrimary,
              mainColor: Colors.white,
              borderColor: kColorPrimary,
            ),
          ]),
        );
      },
    );
  }
}
