import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/models/tasker_education_req.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EditEducation extends StatefulWidget {
  const EditEducation({super.key, required this.id});
  final int id;

  @override
  State<EditEducation> createState() => _EditEducationState();
}

class _EditEducationState extends State<EditEducation> {
  final schoolController = TextEditingController();
  final descriptionController = TextEditingController();
  final degreeController = TextEditingController();
  final fieldOfStudyController = TextEditingController();
  final locationController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  Education? education;

  @override
  void dispose() {
    schoolController.dispose();
    descriptionController.dispose();
    degreeController.dispose();
    fieldOfStudyController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskerEducationCubit, TaskerEducationState>(
      listener: (context, state) async {
        final error = await CacheHelper.getCachedString(kErrorLog);
        if (state is TaskerEditEducationSuccess) {
          if (!mounted) return;
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Success',
              content: 'Education edited successfully',
              onTap: () async {
                context.read<TaskerEducationCubit>().getTaskerEducation();
                if (!mounted) return;
                Navigator.pop(context);
              },
              isSuccess: true,
            ),
          );
        }
        if (state is TaskerEditEducationFailure) {
          if (!mounted) return;
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Failure',
              content: error ?? "Education couldn't be edited",
              onTap: () async {
                await context.read<TaskerEducationCubit>().getTaskerEducation();
                if (!mounted) return;
                Navigator.pop(context);
              },
              isSuccess: false,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is TaskerGetEducationSuccess) {
          for (final x in state.taskerEducationRes) {
            if (x.id == widget.id) {
              education = x;
            }
          }
          return Column(
            children: [
              const CustomModalSheetDrawerIcon(),
              const Center(
                child: Text(
                  'Edit Education',
                  style: kPurpleText16,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) => Padding(
                    padding: kPadding20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormField(
                          label: 'School',
                          isRequired: true,
                          child: CustomTextFormField(
                            hintText: schoolController.text.isNotEmpty
                                ? schoolController.text
                                : education?.school ??
                                    'Eg: Tribhuvan University',
                            onChanged: (p0) {
                              setState(
                                () {
                                  schoolController.text = p0!;
                                },
                              );
                            },
                          ),
                        ),
                        CustomFormField(
                          label: 'Description',
                          isRequired: true,
                          child: CustomTextFormField(
                            maxLines: 3,
                            hintText: descriptionController.text.isNotEmpty
                                ? descriptionController.text
                                : education?.description ??
                                    'Write something...',
                            onChanged: (p0) {
                              setState(() {
                                descriptionController.text = p0!;
                              });
                            },
                          ),
                        ),
                        CustomFormField(
                          label: 'Degree',
                          isRequired: true,
                          child: CustomTextFormField(
                            hintText: degreeController.text.isNotEmpty
                                ? degreeController.text
                                : education?.degree ?? "Eg: Bachelor's",
                            onChanged: (p0) {
                              setState(() {
                                degreeController.text = p0!;
                              });
                            },
                          ),
                        ),
                        CustomFormField(
                          label: 'Field of Study',
                          isRequired: true,
                          child: CustomTextFormField(
                            hintText: fieldOfStudyController.text.isNotEmpty
                                ? fieldOfStudyController.text
                                : education?.fieldOfStudy ?? 'Eg: Business',
                            onChanged: (p0) {
                              setState(() {
                                fieldOfStudyController.text = p0!;
                              });
                            },
                          ),
                        ),
                        CustomFormField(
                          label: 'Location',
                          isRequired: true,
                          child: CustomTextFormField(
                            prefixWidget: const Icon(
                              Icons.location_on_outlined,
                              color: kColorPrimary,
                            ),
                            hintText: locationController.text.isNotEmpty
                                ? locationController.text
                                : education?.location ??
                                    'Eg: New Baneshwor, Kathmandu',
                            onChanged: (p0) {
                              setState(() {
                                locationController.text = p0!;
                              });
                            },
                          ),
                        ),
                        Row(
                          children: [
                            CustomCheckBox(
                              onTap: () {},
                              boxColor: const Color(0xff0693E3),
                              isChecked: true,
                            ),
                            kWidth10,
                            const Text('Save as location'),
                          ],
                        ),
                        kHeight20,
                        Row(
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFormField(
                                    label: 'Start Date',
                                    isRequired: true,
                                    child: InkWell(
                                      onTap: () async {
                                        await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2010),
                                          lastDate: DateTime(2050),
                                        ).then(
                                          (value) => setState(
                                            () {
                                              startDate = value;
                                            },
                                          ),
                                        );
                                      },
                                      child: CustomFormContainer(
                                        hintText: startDate
                                                ?.toString()
                                                .substring(0, 10) ??
                                            education?.startDate
                                                ?.toString()
                                                .substring(0, 10) ??
                                            '1999-03-06',
                                        leadingWidget: const Icon(
                                          Icons.calendar_month_rounded,
                                          color: kColorPrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            kWidth20,
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFormField(
                                    label: 'End Date',
                                    isRequired: true,
                                    child: InkWell(
                                      onTap: () async {
                                        await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2010),
                                          lastDate: DateTime(2050),
                                        ).then(
                                          (value) => setState(
                                            () {
                                              endDate = value;
                                            },
                                          ),
                                        );
                                      },
                                      child: CustomFormContainer(
                                        hintText: endDate
                                                ?.toString()
                                                .substring(0, 10) ??
                                            education?.endDate
                                                ?.toString()
                                                .substring(0, 10) ??
                                            '1999-06-03',
                                        leadingWidget: const Icon(
                                          Icons.calendar_month_rounded,
                                          color: kColorPrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: CustomElevatedButton(
                            callback: () {
                              setState(
                                () {
                                  startDate ??= education!.startDate;
                                  endDate ??= education!.endDate;
                                },
                              );
                              if (startDate!.isAfter(endDate!)) {
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomToast(
                                    heading: 'Error',
                                    content: 'Please verify your dates',
                                    onTap: () {},
                                    isSuccess: false,
                                  ),
                                );
                              } else {
                                context
                                    .read<TaskerEducationCubit>()
                                    .editTaskerEducation(
                                      TaskerEducationReq(
                                        school: schoolController.text.isNotEmpty
                                            ? schoolController.text
                                            : education!.school!,
                                        description: descriptionController
                                                .text.isNotEmpty
                                            ? descriptionController.text
                                            : education!.description!,
                                        degree: degreeController.text.isNotEmpty
                                            ? degreeController.text
                                            : education!.degree!,
                                        fieldOfStudy: fieldOfStudyController
                                                .text.isNotEmpty
                                            ? fieldOfStudyController.text
                                            : education!.fieldOfStudy!,
                                        location:
                                            locationController.text.isNotEmpty
                                                ? locationController.text
                                                : education!.location!,
                                        startDate: startDate!,
                                        endDate: endDate,
                                      ),
                                      widget.id,
                                    );
                              }
                            },
                            label: 'Save',
                          ),
                        ),
                      ],
                    ),
                  ),
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
