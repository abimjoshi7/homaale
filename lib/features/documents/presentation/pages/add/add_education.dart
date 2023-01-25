import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/validations/validate_not_empty.dart';
import 'package:cipher/features/documents/models/tasker_education_req.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEducation extends StatefulWidget {
  const AddEducation({super.key});
  static const routeName = '/add-education';

  @override
  State<AddEducation> createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  final schoolController = TextEditingController();
  final descriptionController = TextEditingController();
  final degreeController = TextEditingController();
  final fieldOfStudyController = TextEditingController();
  final locationController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  final _key123 = GlobalKey<FormState>();

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            trailingWidget: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
            child: const Text(
              'Add Education',
            ),
          ),
          const CustomHorizontalDivider(),
          Expanded(
            child: Form(
              key: _key123,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      label: 'School',
                      isRequired: true,
                      child: CustomTextFormField(
                        validator: validateNotEmpty,
                        hintText: 'Eg: Tribhuvan University',
                        onSaved: (p0) {
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
                        validator: validateNotEmpty,
                        maxLines: 3,
                        hintText: 'Write something...',
                        onSaved: (p0) {
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
                        validator: validateNotEmpty,
                        hintText: "Eg: Bachelor's",
                        onSaved: (p0) {
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
                        validator: validateNotEmpty,
                        hintText: 'Eg: Business',
                        onSaved: (p0) {
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
                        validator: validateNotEmpty,
                        prefixWidget: const Icon(
                          Icons.location_on_outlined,
                          color: kColorPrimary,
                        ),
                        hintText: 'Eg: New Baneshwor, Kathmandu',
                        onSaved: (p0) {
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
                                    hintText:
                                        endDate?.toString().substring(0, 10) ??
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
                  ],
                ),
              ),
            ),
          ),
          BlocConsumer<TaskerEducationCubit, TaskerEducationState>(
            listener: (context, state) async {
              final error = await CacheHelper.getCachedString(kErrorLog);
              if (state is TaskerAddEducationSuccess) {
                if (!mounted) return;
                // await context.read<UserBloc>().getTaskeruser();

                showDialog(
                  context: context,
                  builder: (context) => CustomToast(
                    heading: 'Success',
                    content: 'Education added successfully',
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      Root.routeName,
                      (route) => false,
                    ),
                    isSuccess: true,
                  ),
                );
              } else if (state is TaskerAddEducationFailure) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error ?? "Education couldn't be added"),
                  ),
                );
                showDialog(
                  context: context,
                  builder: (context) => CustomToast(
                    heading: 'Failure',
                    content: error ?? "Education couldn't be added",
                    onTap: () => Navigator.pop(context),
                    isSuccess: false,
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomElevatedButton(
                callback: () {
                  if (_key123.currentState!.validate() &&
                      startDate!.isBefore(endDate!)) {
                    _key123.currentState!.save();
                    final taskerEducationReq = TaskerEducationReq(
                      school: schoolController.text,
                      description: descriptionController.text,
                      degree: degreeController.text,
                      fieldOfStudy: fieldOfStudyController.text,
                      location: locationController.text,
                      startDate: startDate ?? DateTime.now(),
                      endDate: endDate,
                    );
                    context
                        .read<TaskerEducationCubit>()
                        .addTaskerEducation(taskerEducationReq);
                  } else if (endDate!.isBefore(startDate!)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please check your start and end dates'),
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
    );
  }
}
