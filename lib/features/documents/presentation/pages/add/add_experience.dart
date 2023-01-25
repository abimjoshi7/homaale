import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/validations/validate_not_empty.dart';
import 'package:cipher/features/documents/models/tasker_experience_req.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExperience extends StatefulWidget {
  const AddExperience({super.key});
  static const routeName = '/add-experience';

  @override
  State<AddExperience> createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final employmentController = TextEditingController();
  final companyNameController = TextEditingController();
  final locationController = TextEditingController();
  final _key = GlobalKey<FormState>();
  DateTime? issuedDate;
  DateTime? expiryDate;
  static const val = [
    'Part Time',
    'Full Time',
  ];

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
              'Add Experience',
            ),
          ),
          const CustomHorizontalDivider(),
          Expanded(
            child: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      label: 'Title',
                      isRequired: true,
                      child: CustomTextFormField(
                        validator: validateNotEmpty,
                        hintText: 'Please enter the title',
                        onSaved: (p0) {
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
                        hintText: 'Write something...',
                        onSaved: (p0) {
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
                        hintText: 'Please select',
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
                        hintText: 'Eg: Cagtu',
                        onSaved: (p0) {
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
                        hintText: 'Eg: New Baneshwor, Kathmandu',
                        prefixWidget: const Icon(
                          Icons.location_on_outlined,
                          color: kColorPrimary,
                        ),
                        onSaved: (p0) {
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
                                    setState(() async {
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
          ),
          BlocConsumer<TaskerExperienceCubit, TaskerExperienceState>(
            listener: (context, state) async {
              final error = await CacheHelper.getCachedString(kErrorLog);
              if (state is TaskerAddExperienceSuccess) {
                if (!mounted) return;
                // await context.read<UserBloc>().getTaskeruser();

                showDialog(
                  context: context,
                  builder: (context) => CustomToast(
                    heading: 'Success',
                    content: 'Experience added successfully',
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      Root.routeName,
                      (route) => false,
                    ),
                    isSuccess: true,
                  ),
                );
              } else if (state is TaskerAddExperienceFailure) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error ?? "Failed to add experience."),
                  ),
                );
                showDialog(
                  context: context,
                  builder: (context) => CustomToast(
                    heading: 'Failure',
                    content: error ?? "Experience couldn't be added",
                    onTap: () => Navigator.pop(context),
                    isSuccess: false,
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomElevatedButton(
                callback: () async {
                  if (_key.currentState!.validate() &&
                      issuedDate!.isBefore(expiryDate!)) {
                    _key.currentState!.save();

                    await context
                        .read<TaskerExperienceCubit>()
                        .addTaskerExperience(
                          TaskerExperienceReq(
                            title: titleController.text,
                            description: descriptionController.text,
                            companyName: companyNameController.text,
                            currentlyWorking: true,
                            employmentType: employmentController.text,
                            location: locationController.text,
                            startDate: issuedDate ?? DateTime.now(),
                            endDate: expiryDate,
                          ),
                        )
                        .then(
                          (value) => context.read<UserBloc>().add(
                                UserLoaded(),
                              ),
                        );
                  } else if (expiryDate!.isBefore(issuedDate!)) {
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
          kHeight50
        ],
      ),
    );
  }
}
