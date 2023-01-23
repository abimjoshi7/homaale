// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:cipher/core/validations/validations.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/utilities/presentation/bloc/city_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/country_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/currency_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/interests_bloc.dart';
import 'package:cipher/networking/models/request/tasker_profile_create_req.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:textfield_tags/textfield_tags.dart';

class ProfileCompletionForm extends StatefulWidget {
  const ProfileCompletionForm({
    super.key,
  });

  @override
  State<ProfileCompletionForm> createState() => _ProfileCompletionFormState();
}

class _ProfileCompletionFormState extends State<ProfileCompletionForm> {
  List<int?>? interestCodes = [];
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final bioController = TextEditingController();
  final designationController = TextEditingController();
  final genderController = TextEditingController();
  DateTime? dateOfBirth = DateTime.now();
  final userTypeController = TextEditingController();
  final skillsController = TextEditingController();
  final experienceController = TextEditingController();
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  final baseRateController = TextEditingController();
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
  XFile? selectedImage;
  bool isClient = false;
  bool isTasker = false;
  List<Map<String, dynamic>> map = [];
  int? cityCode;
  String? countryName;
  final tagController = TextfieldTagsController();
  String? currencyCode;

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
                InkWell(
                  onTap: () async {
                    await ImagePickHelper().pickImagePath().then(
                          (value) => setState(
                            () {
                              selectedImage = value;
                            },
                          ),
                        );
                  },
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.file(
                            fit: BoxFit.contain,
                            File(
                              selectedImage?.path ?? '',
                            ),
                          ),
                        ),
                      ),
                      kHeight15,
                      const Text(
                        'Change profile photo',
                        style: kPurpleText16,
                      ),
                    ],
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
                            validator: validateNotEmpty,
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
                            validator: validateNotEmpty,
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
                  validator: validateNotEmpty,
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
                    hintText: DateFormat('yyyy-MM-dd')
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
                        Checkbox(
                          value: isClient,
                          onChanged: (value) => setState(
                            () {
                              isClient = value!;
                            },
                          ),
                        ),
                        // Radio(
                        //   value: 'Client',
                        //   groupValue: userType,
                        //   onChanged: (value) => setState(
                        //     () {
                        //       userType = value!;
                        //     },
                        //   ),
                        // ),
                        const Text('Client')
                      ],
                    ),
                    kWidth20,
                    Row(
                      children: [
                        Checkbox(
                          value: isTasker,
                          onChanged: (value) => setState(
                            () {
                              isTasker = value!;
                            },
                          ),
                        ),
                        // Radio(
                        //   value: 'Tasker',
                        //   groupValue: userType,
                        //   onChanged: (value) => setState(
                        //     () {
                        //       userType = value!;
                        //     },
                        //   ),
                        // ),
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
                CustomTagTextField(tagController: tagController),
                kHeight20,
                const Text(
                  'Interests',
                  style: kPurpleText16,
                ),
                kHeight5,
                BlocBuilder<InterestsBloc, InterestsState>(
                  builder: (context, state) {
                    if (state is InterestsLoadSuccess) {
                      return MultiSelectDialogField(
                        items: List.generate(
                          state.taskCategoryListRes.length,
                          (index) => MultiSelectItem(
                            state.taskCategoryListRes[index].id.toString(),
                            state.taskCategoryListRes[index].name.toString(),
                          ),
                        ),
                        onConfirm: (p0) {
                          setState(
                            () {
                              interestCodes =
                                  p0.map((e) => int.parse(e)).toList();
                            },
                          );
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
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
                                hintText: '${startTime ?? '--:-- A.M'}',
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
                                hintText: '${endTime ?? '--:-- P.M'}',
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
                  validator: validateNotEmpty,
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
                BlocBuilder<CountryBloc, CountryState>(
                  builder: (context, state) {
                    if (state is CountryLoadSuccess) {
                      return CustomDropDownField(
                        list: List.generate(
                          state.list.length,
                          (index) => state.list[index].name,
                        ),
                        hintText: 'Enter your country',
                        onChanged: (p0) => setState(
                          () async {
                            final x = state.list.firstWhere(
                              (element) => p0 == element.name,
                            );
                            countryName = x.name;
                          },
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                kHeight20,
                const Text(
                  'City',
                  style: kPurpleText16,
                ),
                kHeight5,
                BlocBuilder<CityBloc, CityState>(
                  builder: (context, state) {
                    if (state is CityLoadSuccess) {
                      return CustomDropDownField(
                        list: List.generate(
                          state.list.length,
                          (index) => state.list[index].name,
                        ),
                        hintText: 'Enter your city',
                        onChanged: (p0) => setState(
                          () async {
                            final x = state.list.firstWhere(
                              (element) => p0 == element.name,
                            );
                            cityCode = x.id;
                          },
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
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
                  validator: validateNotEmpty,
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
                BlocBuilder<CurrencyBloc, CurrencyState>(
                  builder: (context, state) {
                    if (state is CurrencyLoadSuccess) {
                      return CustomDropDownField(
                        list: List.generate(
                          state.currencyListRes.length,
                          (index) => state.currencyListRes[index].name,
                        ),
                        hintText: 'Enter your Currency',
                        onChanged: (p0) => setState(
                          () async {
                            final x = state.currencyListRes.firstWhere(
                              (element) => p0 == element.name,
                            );
                            currencyCode = x.code;
                          },
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
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
                  hintText: 'Choose one',
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
                    'full-Time',
                    'part-Time',
                  ],
                  onChanged: (value) => setState(
                    () {
                      taskPreferencesController.text = value!;
                    },
                  ),
                  hintText: 'Choose one',
                ),
                kHeight20,
                kHeight50,
                Center(
                  child: BlocConsumer<UserDataCubit, UserDataState>(
                    listener: (context, state) async {
                      final error = await CacheHelper.getCachedString(
                        kErrorLog,
                      );
                      if (state is UserDataCreateSuccess) {
                        await showDialog(
                          context: context,
                          builder: (context) => CustomToast(
                            isSuccess: true,
                            heading: 'Success',
                            content: 'Your profile is completed successfully.',
                            onTap: () => Navigator.pushNamedAndRemoveUntil(
                              context,
                              Root.routeName,
                              (route) => false,
                            ),
                          ),
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (context) => CustomToast(
                            isSuccess: false,
                            heading: 'Failure',
                            content: error ??
                                'Your profile cannot be completed. Please try again.',
                            onTap: () {},
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        callback: () async {
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                            if (isClient && isTasker) {
                              userType = ["Client", "Tasker"].toString();
                            } else if (isClient) {
                              userType = "Client";
                            } else if (isTasker) {
                              userType = "Tasker";
                            } else {
                              userType = "";
                            }
                            await context
                                .read<UserDataCubit>()
                                .postTaskerUserData(
                                  TaskerProfileCreateReq(
                                    city: cityCode,
                                    country: countryName,
                                    interests: interestCodes,
                                    firstName: firstNameController.text,
                                    middleName: middleNameController.text,
                                    lastName: lastNameController.text,
                                    bio: bioController.text,
                                    designation: designationController.text,
                                    gender: genderGroup,
                                    skill: tagController.getTags.toString(),
                                    dateOfBirth: dateOfBirth,
                                    activeHourStart: startTime!.format(context),
                                    activeHourEnd: endTime!.format(context),
                                    experienceLevel: experienceLevel,
                                    userType: userType,
                                    hourlyRate:
                                        int.parse(baseRateController.text),
                                    profileVisibility:
                                        visibilityController.text,
                                    taskPreferences:
                                        taskPreferencesController.text,
                                    addressLine1: address1Controller.text,
                                    addressLine2: address2Controller.text,
                                    chargeCurrency: currencyCode,
                                    // chargeCurrency: 'NPR',
                                    remainingPoints: 0,
                                    points: 0,
                                    followingCount: 0,
                                    profileImage: await MultipartFile.fromFile(
                                      selectedImage?.path ??
                                          'assets/homaale_logo_title_light.png',
                                    ),
                                  ),
                                );
                          }
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
    experienceController.dispose();
    baseRateController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    languageController.dispose();
    visibilityController.dispose();
    taskPreferencesController.dispose();
    tagController.dispose();
    super.dispose();
  }
}
