import 'dart:io';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/helpers.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:cipher/core/validations/validations.dart';
import 'package:cipher/features/user/data/models/tasker_profile_create_req.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
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
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final bioController = TextEditingController();
  final designationController = TextEditingController();
  final genderController = TextEditingController();
  final userTypeController = TextEditingController();
  final experienceController = TextEditingController();
  final baseRateController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final languageController = TextEditingController();
  final currencyController = TextEditingController();
  final visibilityController = TextEditingController();
  final taskPreferencesController = TextEditingController();
  final tagController = TextfieldTagsController();
  int? cityCode;
  DateTime? dateOfBirth = DateTime.now();
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String genderGroup = 'Male';
  String userType = 'Client';
  String experienceLevel = 'Beginner';
  String? countryName;
  String? currencyCode;
  XFile? selectedImage;
  File? selectedFile;
  bool isClient = false;
  bool isTasker = false;
  List<Map<String, dynamic>> map = [];
  List<int?>? interestCodes = [];
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Padding(
            padding: kPadding10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    // await FilePickHelper.filePicker().then(
                    //   (value) => setState(
                    //     () {
                    //       selectedFile = value;
                    //       print(selectedFile);
                    //     },
                    //   ),
                    // );
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
                addVerticalSpace(30),
                Row(
                  children: [
                    Flexible(
                      child: CustomFormField(
                        label: 'First Name',
                        isRequired: true,
                        child: CustomTextFormField(
                          hintText: 'Harry',
                          onSaved: (p0) => setState(
                            () {
                              firstNameController.text = p0!;
                            },
                          ),
                          validator: validateNotEmpty,
                        ),
                      ),
                    ),
                    addHorizontalSpace(10),
                    Flexible(
                      child: CustomFormField(
                        label: 'Middle Name',
                        isRequired: false,
                        child: CustomTextFormField(
                          hintText: 'Prasad',
                          onSaved: (p0) => setState(
                            () {
                              middleNameController.text = p0!;
                            },
                          ),
                        ),
                      ),
                    ),
                    addHorizontalSpace(10),
                    Flexible(
                      child: CustomFormField(
                        label: 'Last Name',
                        isRequired: true,
                        child: CustomTextFormField(
                          hintText: 'Smith',
                          onSaved: (p0) => setState(
                            () {
                              lastNameController.text = p0!;
                            },
                          ),
                          validator: validateNotEmpty,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomFormField(
                  label: 'Bio',
                  isRequired: true,
                  child: CustomTextFormField(
                    hintText: 'Write something...',
                    maxLines: 3,
                    onSaved: (p0) => setState(
                      () {
                        bioController.text = p0!;
                      },
                    ),
                    validator: validateNotEmpty,
                  ),
                ),
                CustomFormField(
                  label: 'Designation',
                  isRequired: false,
                  child: CustomTextFormField(
                    hintText: 'Pilot',
                    onSaved: (p0) => setState(
                      () {
                        designationController.text = p0!;
                      },
                    ),
                  ),
                ),
                CustomFormField(
                  label: 'Gender',
                  isRequired: true,
                  child: Row(
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
                ),
                CustomFormField(
                  label: 'Date of birth',
                  isRequired: false,
                  child: InkWell(
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
                ),
                const Divider(),
                const Text(
                  'Professional Information',
                  style: kText17,
                ),
                CustomFormField(
                  label: 'Select User Type',
                  isRequired: true,
                  child: Row(
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
                ),
                CustomFormField(
                  label: 'Skills',
                  isRequired: true,
                  child: CustomTagTextField(tagController: tagController),
                ),
                CustomFormField(
                  label: 'Interests',
                  isRequired: false,
                  child: BlocBuilder<InterestsBloc, InterestsState>(
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
                ),
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
                CustomFormField(
                  label: 'Currency',
                  isRequired: true,
                  child: BlocBuilder<CurrencyBloc, CurrencyState>(
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
                ),
                const Divider(),
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
                    'Long-Term Tasks',
                    'Short-Term Tasks',
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
                  child: BlocConsumer<UserBloc, UserState>(
                    listener: (context, state) async {
                      final error = await CacheHelper.getCachedString(
                        kErrorLog,
                      );
                      if (state is UserAddSuccess) {
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
                      }
                      if (state is UserAddFailure) {
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
                          final image = await getImageFileFromAssets(
                              'avatar-ga3c7ddeec_640.png');
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                            if (isClient && isTasker) {
                              userType = ["Client", "Tasker"]
                                  .map((e) => '"$e"')
                                  .toList()
                                  .toString();
                            } else if (isClient) {
                              userType = ["Client"]
                                  .map((e) => '"$e"')
                                  .toList()
                                  .toString();
                            } else if (isTasker) {
                              userType = ["Tasker"]
                                  .map((e) => '"$e"')
                                  .toList()
                                  .toString();
                            } else {
                              userType = "";
                            }

                            final q = TaskerProfileCreateReq(
                              city: cityCode,
                              country: countryName,
                              interests: interestCodes,
                              firstName: firstNameController.text,
                              middleName: middleNameController.text,
                              lastName: lastNameController.text,
                              bio: bioController.text,
                              designation: designationController.text,
                              gender: genderGroup,
                              skill: tagController.getTags != null
                                  ? tagController.getTags!
                                      .map((e) => '"$e"')
                                      .toList()
                                      .toString()
                                  : '',
                              dateOfBirth: dateOfBirth,
                              activeHourStart: startTime!.format(context),
                              activeHourEnd: endTime!.format(context),
                              experienceLevel: experienceLevel,
                              userType: userType,
                              hourlyRate: int.parse(baseRateController.text),
                              profileVisibility: visibilityController.text,
                              taskPreferences: taskPreferencesController.text,
                              addressLine1: address1Controller.text,
                              addressLine2: address2Controller.text,
                              chargeCurrency: currencyCode ?? 'NPR',
                              remainingPoints: 0,
                              points: 0,
                              followingCount: 0,
                              profileImage: await MultipartFile.fromFile(
                                selectedImage?.path ?? image.path,
                              ),
                            );
                            if (!mounted) return;
                            context.read<UserBloc>().add(
                                  UserAdded(
                                    req: q,
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
    experienceController.dispose();
    baseRateController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    languageController.dispose();
    currencyController.dispose();
    visibilityController.dispose();
    taskPreferencesController.dispose();
    tagController.dispose();

    super.dispose();
  }
}
