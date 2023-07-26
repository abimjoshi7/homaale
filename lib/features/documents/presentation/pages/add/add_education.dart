import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/data/models/tasker_education_req.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class AddEducation extends StatefulWidget {
  const AddEducation({super.key});
  static const routeName = '/add-education';

  @override
  State<AddEducation> createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  bool hasEndDate = true;
  final schoolController = TextEditingController();
  final descriptionController = TextEditingController();
  final degreeController = TextEditingController();
  final fieldOfStudyController = TextEditingController();
  final locationController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
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
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        appBarTitle: "Add Education",
      ),
      body: SingleChildScrollView(
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
                        () => schoolController.text = p0!,
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
                // CustomFormField(
                //   label: 'Location',
                //   isRequired: true,
                //   child: CustomTextFormField(
                //     validator: validateNotEmpty,
                //     prefixWidget: const Icon(
                //       Icons.location_on_outlined,
                //       color: kColorPrimary,
                //     ),
                //     hintText: 'Eg: New Baneshwor, Kathmandu',
                //     onSaved: (p0) {
                //       setState(() {
                //         locationController.text = p0!;
                //       });
                //     },
                //   ),
                // ),

                kHeight20,

                _buildDate(context),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: <Widget>[
                      CustomCheckBox(
                        isChecked: !hasEndDate,
                        onTap: () {
                          setState(
                            () {
                              hasEndDate = !hasEndDate;
                            },
                          );
                        },
                      ),
                      addHorizontalSpace(10),
                      Flexible(
                        child: Text('I am currently studying here.',
                            style: Theme.of(context).textTheme.displaySmall),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(10.0),
                BlocConsumer<TaskerEducationCubit, TaskerEducationState>(
                  listener: (context, state) async {
                    final error = await CacheHelper.getCachedString(kErrorLog);
                    if (state is TaskerAddEducationSuccess) {
                      if (!mounted) return;
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
                        if (_key123.currentState!.validate()) {
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
                        }
                        // else if (endDate!.isBefore(startDate!)) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content:
                        //           Text('Please check your start and end dates'),
                        //     ),
                        //   );
                        // }
                      },
                      label: 'Add',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDate(BuildContext context) {
    final _currentDate = DateTime.now();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: CustomFormField(
            isRequired: true,
            label: 'Start Date',
            child: CustomTextFormField(
              readOnly: true,
              controller: _startDateController,
              validator: (p0) {
                if (startDate == null) {
                  return "Required Field";
                }
                if (startDate != null && endDate != null) {
                  if (startDate!.isAfter(endDate!)) {
                    return "Cannot be greater than expiry date";
                  }
                  return null;
                }
                return null;
              },
              onTap: () async {
                await showDatePicker(
                  context: context,
                  initialDate: _currentDate,
                  firstDate: DateTime(_currentDate.year - 100),
                  lastDate: DateTime(
                    _currentDate.year + 2,
                  ),
                ).then(
                  (value) => setState(
                    () {
                      startDate = value;
                      _startDateController.text =
                          value?.toIso8601String().substring(
                                    0,
                                    10,
                                  ) ??
                              '';
                    },
                  ),
                );
              },
              prefixWidget: Icon(
                Icons.calendar_today_rounded,
                color: Colors.grey.shade800,
              ),
              hintText: 'yy/mm/dd',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey.shade900),
            ),
          ),
        ),
        addHorizontalSpace(10),
        Flexible(
          child: CustomFormField(
            label: 'End Date',
            isRequired: hasEndDate,
            child: CustomTextFormField(
              readOnly: true,
              controller: _endDateController,
              validator: (p0) {
                if (hasEndDate) {
                  if (endDate == null) {
                    return "Required Field";
                  }
                  if (startDate != null && endDate != null) {
                    if (endDate!.isBefore(startDate!)) {
                      return "Cannot be less than issued date";
                    }
                    return null;
                  }
                }
                return null;
              },
              onTap: !hasEndDate
                  ? null
                  : () async {
                      await showDatePicker(
                        context: context,
                        initialDate: startDate ?? _currentDate,
                        firstDate: startDate ?? _currentDate,
                        lastDate: DateTime(
                          _currentDate.year + 2,
                        ),
                      ).then(
                        (value) => setState(
                          () {
                            endDate = value;
                            _endDateController.text =
                                value?.toIso8601String().substring(
                                          0,
                                          10,
                                        ) ??
                                    '';
                          },
                        ),
                      );
                    },
              hintText: 'yy/mm/dd',
              theHeight: 48.0,
              theWidth: double.infinity,
              prefixWidget: Icon(
                Icons.calendar_today_rounded,
                color: hasEndDate ? Colors.grey.shade800 : Colors.grey.shade300,
              ),
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:
                      hasEndDate ? Colors.grey.shade900 : Colors.grey.shade400),
            ),
          ),
        ),
      ],
    );
  }
}
