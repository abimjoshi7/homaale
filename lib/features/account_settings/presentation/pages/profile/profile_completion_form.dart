import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/networking/models/request/tasker_profile_create_req.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ProfileCompletionForm extends StatefulWidget {
  const ProfileCompletionForm({
    super.key,
  });

  @override
  State<ProfileCompletionForm> createState() => _ProfileCompletionFormState();
}

class _ProfileCompletionFormState extends State<ProfileCompletionForm> {
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final bioController = TextEditingController();
  final designationController = TextEditingController();
  final genderController = TextEditingController();
  DateTime? dateOfBirth = DateTime.now();
  final userTypeController = TextEditingController();
  final skillsController = TextEditingController();
  final interestsController = TextEditingController();
  final experienceController = TextEditingController();
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  final baseRateController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final languageController = TextEditingController();
  final currencyController = TextEditingController();
  final visibilityController = TextEditingController();
  final taskPreferencesController = TextEditingController();
  String genderGroup = 'Male';
  String userType = 'Client';
  String experienceLevel = 'Beginner';
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                  ),
                ),
                kHeight15,
                const Center(
                  child: Text(
                    'Change profile photo',
                    style: kPurpleText16,
                  ),
                ),
                kHeight50,
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'First name',
                                style: kPurpleText16,
                              ),
                              kWidth5,
                              Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                          kHeight5,
                          CustomTextFormField(
                            hintText: 'Harry',
                            onSaved: (p0) => setState(
                              () {
                                firstNameController.text = p0!;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    kWidth10,
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Middle name',
                            style: kPurpleText16,
                          ),
                          kHeight5,
                          CustomTextFormField(
                            hintText: 'Prasad',
                            onSaved: (p0) => setState(
                              () {
                                middleNameController.text = p0!;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    kWidth10,
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Last name',
                                style: kPurpleText16,
                              ),
                              kWidth5,
                              Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                          kHeight5,
                          CustomTextFormField(
                            hintText: 'Smith',
                            onSaved: (p0) => setState(
                              () {
                                lastNameController.text = p0!;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                kHeight20,
                Row(
                  children: const [
                    Text(
                      'Bio',
                      style: kPurpleText16,
                    ),
                    kWidth5,
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                kHeight5,
                CustomTextFormField(
                  hintText: 'Write something...',
                  maxLines: 3,
                  onSaved: (p0) => setState(
                    () {
                      bioController.text = p0!;
                    },
                  ),
                ),
                kHeight20,
                const Text(
                  'Designation',
                  style: kPurpleText16,
                ),
                kHeight5,
                CustomTextFormField(
                  hintText: 'Pilot',
                  onSaved: (p0) => setState(
                    () {
                      designationController.text = p0!;
                    },
                  ),
                ),
                kHeight20,
                Row(
                  children: const [
                    Text(
                      'Please specify your gender',
                      style: kPurpleText16,
                    ),
                    kWidth5,
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                kHeight5,
                Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Male',
                          groupValue: genderGroup,
                          onChanged: (value) => setState(
                            () {
                              genderGroup = value!;
                            },
                          ),
                        ),
                        const Text('Male'),
                      ],
                    ),
                    kWidth20,
                    Row(
                      children: [
                        Radio(
                          value: 'Female',
                          groupValue: genderGroup,
                          onChanged: (value) => setState(
                            () {
                              genderGroup = value!;
                            },
                          ),
                        ),
                        const Text('Female'),
                      ],
                    ),
                    kWidth20,
                    Row(
                      children: [
                        Radio(
                          value: 'Other',
                          groupValue: genderGroup,
                          onChanged: (value) => setState(
                            () {
                              genderGroup = value!;
                            },
                          ),
                        ),
                        const Text('Other'),
                      ],
                    ),
                  ],
                ),
                kHeight20,
                const Text(
                  'Date of birth',
                  style: kPurpleText16,
                ),
                kHeight5,
                InkWell(
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1800),
                      lastDate: DateTime(2080),
                    ).then(
                      (value) => setState(
                        () {
                          dateOfBirth = value;
                        },
                      ),
                    );
                  },
                  child: CustomFormContainer(
                    leadingWidget: const Icon(
                      Icons.calendar_month_rounded,
                      color: kColorPrimary,
                    ),
                    label: DateFormat('yyyy-MM-dd')
                        .format(dateOfBirth as DateTime),
                  ),
                ),
                kHeight10,
                const Divider(),
                kHeight10,
                const Text(
                  'Professional Information',
                  style: kText20,
                ),
                kHeight20,
                Row(
                  children: const [
                    Text(
                      'Select User Type',
                      style: kPurpleText16,
                    ),
                    kWidth5,
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                kHeight5,
                Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Client',
                          groupValue: userType,
                          onChanged: (value) => setState(
                            () {
                              userType = value!;
                            },
                          ),
                        ),
                        const Text('Client')
                      ],
                    ),
                    kWidth20,
                    Row(
                      children: [
                        Radio(
                          value: 'Tasker',
                          groupValue: userType,
                          onChanged: (value) => setState(
                            () {
                              userType = value!;
                            },
                          ),
                        ),
                        const Text('Tasker')
                      ],
                    ),
                  ],
                ),
                kHeight20,
                Row(
                  children: const [
                    Text(
                      'Skills',
                      style: kPurpleText16,
                    ),
                    kWidth5,
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                kHeight5,
                CustomTextFormField(
                  hintText: 'Select Skills',
                  onSaved: (p0) => setState(
                    () {
                      skillsController.text = p0!;
                    },
                  ),
                ),
                kHeight20,
                const Text(
                  'Interests',
                  style: kPurpleText16,
                ),
                kHeight5,
                CustomTextFormField(
                  hintText: 'Enter your interests',
                  onSaved: (p0) => setState(
                    () {
                      interestsController.text = p0!;
                    },
                  ),
                ),
                kHeight20,
                Row(
                  children: const [
                    Text(
                      'Experience level',
                      style: kPurpleText16,
                    ),
                    kWidth5,
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Beginner',
                      groupValue: experienceLevel,
                      onChanged: (value) => setState(
                        () {
                          experienceLevel = value!;
                        },
                      ),
                    ),
                    const Text('Beginner (0 to 1 year experience)')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Intermediate',
                      groupValue: experienceLevel,
                      onChanged: (value) => setState(
                        () {
                          experienceLevel = value!;
                        },
                      ),
                    ),
                    const Text('Intermediate (2 to 4 years experience)')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Expert',
                      groupValue: experienceLevel,
                      onChanged: (value) => setState(
                        () {
                          experienceLevel = value!;
                        },
                      ),
                    ),
                    const Text('Expert (5 or more years experience)')
                  ],
                ),
                kHeight10,
                Row(
                  children: const [
                    Text(
                      'Active Hours',
                      style: kPurpleText16,
                    ),
                    kWidth5,
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'From',
                              style: kPurpleText16,
                            ),
                            kHeight10,
                            InkWell(
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
                                label: '${startTime ?? '--:-- A.M'}',
                              ),
                            )
                          ],
                        ),
                      ),
                      kWidth20,
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'To',
                              style: kPurpleText16,
                            ),
                            kHeight10,
                            InkWell(
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
                                label: '${endTime ?? '--:-- P.M'}',
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                kHeight10,
                Row(
                  children: const [
                    Text(
                      'Base Rate Per Hour',
                      style: kPurpleText16,
                    ),
                    kWidth5,
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                kHeight5,
                CustomTextFormField(
                  hintText: 'Base Rate Per Hour',
                  onSaved: (p0) => setState(
                    () {
                      baseRateController.text = p0!;
                    },
                  ),
                ),
                kHeight20,
                const Text(
                  'Address',
                  style: kText20,
                ),
                kHeight20,
                const Text(
                  'Country',
                  style: kPurpleText16,
                ),
                kHeight5,
                CustomTextFormField(
                  hintText: 'Select your country',
                  onSaved: (p0) => setState(
                    () {
                      countryController.text = p0!;
                    },
                  ),
                ),
                kHeight20,
                const Text(
                  'City',
                  style: kPurpleText16,
                ),
                kHeight5,
                CustomTextFormField(
                  hintText: 'Select your city',
                  onSaved: (p0) => setState(
                    () {
                      cityController.text = p0!;
                    },
                  ),
                ),
                kHeight20,
                Row(
                  children: const [
                    Text(
                      'Address Line 1',
                      style: kPurpleText16,
                    ),
                    kWidth5,
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                kHeight5,
                CustomTextFormField(
                  hintText: 'Enter your primary address',
                  prefixWidget: const Icon(
                    Icons.location_on_outlined,
                    color: kColorPrimary,
                  ),
                  onSaved: (p0) => setState(
                    () {
                      address1Controller.text = p0!;
                    },
                  ),
                ),
                kHeight20,
                const Text(
                  'Address Line 2',
                  style: kPurpleText16,
                ),
                kHeight5,
                CustomTextFormField(
                  hintText: 'Enter your secondary address',
                  prefixWidget: const Icon(
                    Icons.location_on_outlined,
                    color: kColorPrimary,
                  ),
                  onSaved: (p0) => setState(
                    () {
                      address2Controller.text = p0!;
                    },
                  ),
                ),
                kHeight20,
                const Text(
                  'Language',
                  style: kPurpleText16,
                ),
                kHeight5,
                CustomTextFormField(
                  hintText: 'Nepali',
                  onSaved: (p0) => setState(
                    () {
                      languageController.text = p0!;
                    },
                  ),
                ),
                kHeight20,
                Row(
                  children: const [
                    Text(
                      'Currency',
                      style: kPurpleText16,
                    ),
                    kWidth5,
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                kHeight5,
                CustomTextFormField(
                  hintText: 'NPR',
                  onSaved: (p0) => setState(
                    () {
                      currencyController.text = p0!;
                    },
                  ),
                ),
                kHeight10,
                const Divider(),
                kHeight10,
                const Text(
                  'Profile Configurations',
                  style: kText20,
                ),
                kHeight20,
                Row(
                  children: const [
                    Text(
                      'Visibility',
                      style: kPurpleText16,
                    ),
                    kWidth5,
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                kHeight5,
                CustomDropDownField<String>(
                  hintext: 'Choose one',
                  list: const [
                    'Private',
                    'Public',
                  ],
                  onChanged: (value) => setState(
                    () {
                      visibilityController.text = value!;
                    },
                  ),
                ),
                kHeight20,
                Row(
                  children: const [
                    Text(
                      'Task Preferences',
                      style: kPurpleText16,
                    ),
                    kWidth5,
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                kHeight5,
                CustomDropDownField<String>(
                  list: const [
                    'Full-Time',
                    'Part-Time',
                  ],
                  onChanged: (value) => setState(
                    () {
                      taskPreferencesController.text = value!;
                    },
                  ),
                  hintext: 'Choose one',
                ),
                kHeight20,
                kHeight50,
                Center(
                  child: BlocConsumer<UserDataCubit, UserDataState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return CustomElevatedButton(
                        callback: () async {
                          _key.currentState!.save();
                          final user = TaskerProfileCreateReq(
                            firstName: firstNameController.text,
                            middleName: middleNameController.text,
                            lastName: lastNameController.text,
                            bio: bioController.text,
                            gender: genderGroup,
                            skill: skillsController.text,
                            dateOfBirth: DateTime.parse('2000-02-27'),
                            activeHourStart: startTime!.format(context),
                            activeHourEnd: endTime!.format(context),
                            experienceLevel: experienceLevel,
                            userType: userType,
                            hourlyRate: int.parse(baseRateController.text),
                            profileVisibility: 'Private',
                            taskPreferences: 'full-time',
                            addressLine1: address1Controller.text,
                            addressLine2: address2Controller.text,
                            chargeCurrency: 'NPR',
                            remainingPoints: 0,
                            points: 0,
                            followingCount: 0,
                          );
                          await context
                              .read<UserDataCubit>()
                              .postTaskerUserData(user);
                        },
                        label: 'Save',
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    bioController.dispose();
    designationController.dispose();
    genderController.dispose();
    userTypeController.dispose();
    skillsController.dispose();
    interestsController.dispose();
    experienceController.dispose();
    baseRateController.dispose();
    countryController.dispose();
    cityController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    languageController.dispose();
    countryController.dispose();
    visibilityController.dispose();
    taskPreferencesController.dispose();
    super.dispose();
  }
}
