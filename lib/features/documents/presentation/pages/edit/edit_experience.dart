import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/data/models/tasker_experience_req.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditExperience extends StatefulWidget {
  final int id;
  const EditExperience({super.key, required this.id});

  @override
  State<EditExperience> createState() => _EditExperienceState();
}

class _EditExperienceState extends State<EditExperience> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final employmentController = TextEditingController();
  final companyNameController = TextEditingController();
  final locationController = TextEditingController();
  DateTime? issuedDate;
  DateTime? expiryDate;
  static const val = [
    'Part Time',
    'Full Time',
  ];
  Experience? experience;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    employmentController.dispose();
    companyNameController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskerExperienceCubit, TaskerExperienceState>(
      listener: (context, state) async {
        final error = await CacheHelper.getCachedString(kErrorLog);
        if (state is TaskerEditExperienceSuccess) {
          if (!mounted) return;
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Success',
              content: 'Experience edited successfully',
              onTap: () async {
                context.read<TaskerExperienceCubit>().getTaskerExperience();
                if (!mounted) return;
                Navigator.pop(context);
              },
              isSuccess: true,
            ),
          );
        }
        if (state is TaskerEditExperienceFailure) {
          if (!mounted) return;
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Failure',
              content: error ?? "Experience couldn't be edited",
              onTap: () async {
                await context
                    .read<TaskerExperienceCubit>()
                    .getTaskerExperience();
                if (!mounted) return;
                Navigator.pop(context);
              },
              isSuccess: false,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is TaskerGetExperienceSuccess) {
          for (final x in state.taskerExperienceRes) {
            if (x.id == widget.id) {
              experience = x;
            }
          }
          return Column(
            children: [
              const CustomModalSheetDrawerIcon(),
              const Center(
                child: Text(
                  'Edit Experience',
                  style: kPurpleText16,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      CustomFormField(
                        label: 'Title',
                        isRequired: true,
                        child: CustomTextFormField(
                          validator: validateNotEmpty,
                          hintText: titleController.text.isNotEmpty
                              ? titleController.text
                              : experience?.title ?? 'Please enter the title',
                          onChanged: (p0) {
                            setState(
                              () {
                                titleController.text = p0!;
                              },
                            );
                          },
                        ),
                      ),
                      CustomFormField(
                        label: 'Description',
                        isRequired: true,
                        child: CustomTextFormField(
                          validator: validateNotEmpty,
                          maxLines: 3,
                          hintText: descriptionController.text.isNotEmpty
                              ? descriptionController.text
                              : experience?.description ?? 'Write something...',
                          onChanged: (p0) {
                            setState(
                              () {
                                descriptionController.text = p0!;
                              },
                            );
                          },
                        ),
                      ),
                      CustomFormField(
                        label: 'Employment Type',
                        isRequired: true,
                        child: CustomDropDownField(
                          list: val,
                          hintText: employmentController.text.isNotEmpty
                              ? employmentController.text
                              : experience?.employmentType ?? 'Please select',
                          onChanged: (value) => setState(
                            () {
                              employmentController.text = value!;
                            },
                          ),
                        ),
                      ),
                      CustomFormField(
                        label: 'Company Name',
                        isRequired: true,
                        child: CustomTextFormField(
                          validator: validateNotEmpty,
                          hintText: companyNameController.text.isNotEmpty
                              ? companyNameController.text
                              : experience?.companyName ?? 'Eg: Cagtu',
                          onChanged: (p0) {
                            setState(
                              () {
                                companyNameController.text = p0!;
                              },
                            );
                          },
                        ),
                      ),
                      CustomFormField(
                        label: 'Location',
                        isRequired: true,
                        child: CustomTextFormField(
                          validator: validateNotEmpty,
                          hintText: locationController.text.isNotEmpty
                              ? locationController.text
                              : experience?.location ??
                                  'Eg: New Baneshwor, Kathmandu',
                          prefixWidget: const Icon(
                            Icons.location_on_outlined,
                            color: kColorPrimary,
                          ),
                          onChanged: (p0) {
                            setState(
                              () {
                                locationController.text = p0!;
                              },
                            );
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
                                      setState(() {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2002),
                                          lastDate: DateTime(
                                            2050,
                                          ),
                                        ).then(
                                          (value) => setState(
                                            () {
                                              issuedDate = value;
                                            },
                                          ),
                                        );
                                      });
                                    },
                                    child: CustomFormContainer(
                                      hintText: issuedDate
                                              ?.toString()
                                              .substring(0, 10) ??
                                          experience?.startDate
                                              ?.toString()
                                              .substring(0, 10) ??
                                          '1998-01-01',
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
                                    onTap: () {},
                                    child: InkWell(
                                      onTap: () async {
                                        await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2002),
                                          lastDate: DateTime(
                                            2050,
                                          ),
                                        ).then(
                                          (value) => setState(
                                            () {
                                              expiryDate = value;
                                            },
                                          ),
                                        );
                                      },
                                      child: CustomFormContainer(
                                        hintText: expiryDate
                                                ?.toString()
                                                .substring(0, 10) ??
                                            experience?.endDate
                                                ?.toString()
                                                .substring(0, 10) ??
                                            '1999-01-18',
                                        leadingWidget: const Icon(
                                          Icons.calendar_month_rounded,
                                          color: kColorPrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CustomElevatedButton(
                callback: () async {
                  setState(
                    () {
                      issuedDate ??= experience!.startDate;
                      expiryDate ??= experience!.endDate;
                    },
                  );
                  if (issuedDate!.isAfter(expiryDate!)) {
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
                    await context
                        .read<TaskerExperienceCubit>()
                        .editTaskerExperience(
                          TaskerExperienceReq(
                            title: titleController.text.isNotEmpty
                                ? titleController.text
                                : experience!.title!,
                            description: descriptionController.text.isNotEmpty
                                ? descriptionController.text
                                : experience!.description!,
                            companyName: companyNameController.text.isNotEmpty
                                ? companyNameController.text
                                : experience!.companyName!,
                            currentlyWorking: true,
                            employmentType: employmentController.text.isNotEmpty
                                ? employmentController.text
                                : experience!.employmentType!,
                            location: locationController.text.isNotEmpty
                                ? locationController.text
                                : experience!.location!,
                            startDate: issuedDate!,
                            endDate: expiryDate,
                          ),
                          widget.id,
                        );
                  }
                },
                label: 'Add',
              ),
              kHeight50
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
