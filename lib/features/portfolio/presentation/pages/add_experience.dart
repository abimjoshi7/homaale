import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/portfolio/presentation/cubit/tasker_experience_cubit.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_education.dart';
import 'package:cipher/networking/models/request/tasker_experience_req.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
                    const Text(
                      'Title',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: 'Please enter the title',
                      onSaved: (p0) {
                        setState(() {
                          titleController.text = p0!;
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
                      'Employment Type',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: 'Please select.',
                        hintStyle: const TextStyle(
                          color: Color(0xff9CA0C1),
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffDEE2E6)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffDEE2E6)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      items: val.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          employmentController.text = value!;
                        });
                      },
                    ),
                    kHeight20,
                    const Text(
                      'Company Name',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: 'Eg: Cagtu',
                      onSaved: (p0) {
                        setState(() {
                          companyNameController.text = p0!;
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
                      hintText: 'Eg: New Baneshwor, Kathmandu',
                      prefixWidget: const Icon(
                        Icons.location_on_outlined,
                        color: kColorPrimary,
                      ),
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
                                  hintText:
                                      issuedDate?.toString().substring(0, 10) ??
                                          '1998-01-01',
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
                              const Text(
                                'Expiry Date',
                                style: kLabelPrimary,
                              ),
                              kHeight5,
                              InkWell(
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
                                    leadingWidget: Icon(
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
          BlocConsumer<TaskerExperienceCubit, TaskerExperienceState>(
            listener: (context, state) async {
              final error = await CacheHelper.getCachedString(kErrorLog);
              if (state is TaskerExperienceSuccess) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Experience created successfully.'),
                  ),
                );
                await Navigator.pushNamed(
                  context,
                  AddEducation.routeName,
                );
              } else if (state is TaskerExperienceFailure) {
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
                callback: () async {
                  _key.currentState!.save();
                  final taskerExperience = TaskerExperienceReq(
                    title: titleController.text,
                    description: descriptionController.text,
                    companyName: companyNameController.text,
                    currentlyWorking: true,
                    employmentType: employmentController.text,
                    location: locationController.text,
                    startDate: issuedDate,
                    endDate: expiryDate,
                  );

                  await context
                      .read<TaskerExperienceCubit>()
                      .addTaskerExperience(
                        taskerExperience,
                      );
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
