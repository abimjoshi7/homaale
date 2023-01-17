import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/portfolio/presentation/cubit/tasker_education_cubit.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_certifications.dart';
import 'package:cipher/networking/models/request/tasker_education_req.dart';
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
  DateTime? issuedDate;
  DateTime? expiryDate;
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
                    const Text(
                      'School',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: 'Eg: Tribhuvan University',
                      onSaved: (p0) {
                        setState(() {
                          schoolController.text = p0!;
                        });
                      },
                    ),
                    kHeight20,
                    const Text(
                      'Description',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      maxLines: 3,
                      hintText: 'Write something...',
                      onSaved: (p0) {
                        setState(() {
                          descriptionController.text = p0!;
                        });
                      },
                    ),
                    kHeight20,
                    const Text(
                      'Degree',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: "Eg: Bachelor's",
                      onSaved: (p0) {
                        setState(() {
                          degreeController.text = p0!;
                        });
                      },
                    ),
                    kHeight20,
                    const Text(
                      'Field of Study',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: 'Eg: Business',
                      onSaved: (p0) {
                        setState(() {
                          fieldOfStudyController.text = p0!;
                        });
                      },
                    ),
                    kHeight20,
                    const Text(
                      'Location',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    CustomTextFormField(
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
                    kHeight20,
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
                              const Text(
                                'Issued Date',
                                style: kLabelPrimary,
                              ),
                              kHeight5,
                              InkWell(
                                onTap: () async {
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2010),
                                    lastDate: DateTime(2050),
                                  ).then(
                                    (value) => setState(
                                      () {
                                        issuedDate = value;
                                      },
                                    ),
                                  );
                                },
                                child: CustomFormContainer(
                                  hintText:
                                      issuedDate?.toString().substring(0, 10) ??
                                          '1999-03-06',
                                  leadingWidget: const Icon(
                                    Icons.calendar_month_rounded,
                                    color: kColorPrimary,
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
                              Row(
                                children: const [
                                  Text(
                                    'End Date',
                                    style: kLabelPrimary,
                                  ),
                                  Text(
                                    ' (Expected)',
                                    style: kHelper13,
                                  )
                                ],
                              ),
                              kHeight5,
                              InkWell(
                                onTap: () async {
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2010),
                                    lastDate: DateTime(2050),
                                  ).then(
                                    (value) => setState(
                                      () {
                                        expiryDate = value;
                                      },
                                    ),
                                  );
                                },
                                child: CustomFormContainer(
                                  hintText:
                                      expiryDate?.toString().substring(0, 10) ??
                                          '1999-06-03',
                                  leadingWidget: const Icon(
                                    Icons.calendar_month_rounded,
                                    color: kColorPrimary,
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
              if (state is TaskerEducationSuccess) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Education created successfully.'),
                  ),
                );
                await Navigator.pushNamed(
                  context,
                  AddCertifications.routeName,
                );
              } else if (state is TaskerEducationFailure) {
                if (!mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error!),
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomElevatedButton(
                callback: () {
                  _key123.currentState!.save();

                  final taskerEducationReq = TaskerEducationReq(
                    school: schoolController.text,
                    description: descriptionController.text,
                    degree: degreeController.text,
                    fieldOfStudy: fieldOfStudyController.text,
                    location: locationController.text,
                    startDate: issuedDate,
                    endDate: expiryDate,
                  );
                  context
                      .read<TaskerEducationCubit>()
                      .addTaskerEducation(taskerEducationReq);
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
