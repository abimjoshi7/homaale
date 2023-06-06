import 'dart:io';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/helpers.dart';
import 'package:cipher/core/image_picker/image_picker_dialog.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});
  static const routeName = '/complete-profile-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          appBarTitle: "Complete Profile", trailingWidget: SizedBox()),
      body: Column(
        children: [
          ProfileCompletionForm(),
        ],
      ),
    );
  }
}

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
  final jobProfileController = TextEditingController();
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
  DateTime? dateOfBirth;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String genderGroup = 'Male';
  String userType = 'Client';
  String experienceLevel = 'Beginner';
  String? countryName;
  String? currencyCode;
  bool isClient = false;
  bool isTasker = false;
  List<int?>? interestCodes = [];
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 10,
              children: [
                InkWell(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) => ImagePickerDialog(),
                    );
                  },
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: BlocBuilder<UploadBloc, UploadState>(
                            builder: (context, uploadState) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: uploadState.imageFileList?.length != 0
                                    ? Image.file(
                                        fit: BoxFit.cover,
                                        File(
                                          uploadState.imageFileList?.last ?? '',
                                        ),
                                      )
                                    : const Placeholder(
                                        color: kColorSecondary,
                                      ),
                              );
                            },
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Change profile photo',
                          style: kPurpleText16,
                        ),
                      ),
                    ],
                  ),
                ),
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
                  label: 'Job Profile',
                  child: CustomTextFormField(
                    hintText: 'Pilot',
                    onSaved: (p0) => setState(
                      () {
                        jobProfileController.text = p0!;
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
                  isRequired: true,
                  label: 'Date of birth',
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
                      hintText: dateOfBirth == null
                          ? "yyyy-mm-dd"
                          : DateFormat('yyyy-MM-dd').format(
                              dateOfBirth!,
                            ),
                    ),
                  ),
                ),

                // CustomFormField(
                //   label: 'Select User Type',
                //   isRequired: true,
                //   child: Row(
                //     children: [
                //       Row(
                //         children: [
                //           Checkbox(
                //             value: isClient,
                //             onChanged: (value) => setState(
                //               () {
                //                 isClient = value!;
                //               },
                //             ),
                //           ),
                //           const Text('Client')
                //         ],
                //       ),
                //       kWidth10,
                //       Row(
                //         children: [
                //           Checkbox(
                //             value: isTasker,
                //             onChanged: (value) => setState(
                //               () {
                //                 isTasker = value!;
                //               },
                //             ),
                //           ),
                //           const Text('Tasker')
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                CustomFormField(
                  label: 'Skills',
                  isRequired: true,
                  child: CustomTagTextField(tagController: tagController),
                ),
                CustomFormField(
                  label: 'Interests',
                  isRequired: true,
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
                CustomFormField(
                  label: 'Experience level',
                  isRequired: true,
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
                CustomFormField(
                  label: 'Active Hours',
                  isRequired: true,
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
                                hintText:
                                    startTime?.format(context) ?? '--:-- A.M',
                              ),
                            )
                          ],
                        ),
                      ),
                      addHorizontalSpace(
                        10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'To',
                              style: kPurpleText16,
                            ),
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
                                hintText:
                                    endTime?.format(context) ?? '--:-- P.M',
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // CustomFormField(
                //   label: 'Base Rate Per Hour',
                //   isRequired: true,
                //   child: CustomTextFormField(
                //     textInputType: TextInputType.number,
                //     hintText: 'Base Rate Per Hour',
                //     onSaved: (p0) => setState(
                //       () {
                //         baseRateController.text = p0!;
                //       },
                //     ),
                //     validator: validateNotEmpty,
                //   ),
                // ),
                CustomFormField(
                  isRequired: true,
                  label: 'Country',
                  child: BlocBuilder<CountryBloc, CountryState>(
                    builder: (context, state) {
                      if (state is CountryLoadSuccess) {
                        return DropdownSearch(
                          items: List.generate(
                            state.list.length,
                            (index) => state.list[index].name,
                          ),
                          onChanged: (p0) => setState(
                            () {
                              final x = state.list.firstWhere(
                                (element) => p0 == element.name,
                              );
                              countryName = x.code;
                            },
                          ),
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5),
                              hintText: 'Nepal',
                              hintStyle: const TextStyle(
                                color: Color(0xff9CA0C1),
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffDEE2E6)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: kColorSecondary,
                                ),
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                            ),
                            baseStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          clearButtonProps: ClearButtonProps(
                            padding: EdgeInsets.zero,
                            iconSize: 16,
                            visualDensity: VisualDensity.compact,
                            alignment: Alignment.centerRight,
                            isVisible: true,
                            color: countryName == null
                                ? Colors.white
                                : Colors.black,
                          ),
                          popupProps: PopupProps.modalBottomSheet(
                            showSearchBox: true,
                            modalBottomSheetProps: ModalBottomSheetProps(
                              useSafeArea: false,
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
                CustomFormField(
                  isRequired: true,
                  label: 'City',
                  child: BlocBuilder<CityBloc, CityState>(
                    builder: (context, state) {
                      if (state is CityLoadSuccess) {
                        return DropdownSearch(
                          selectedItem: state.list
                              .firstWhere(
                                (element) =>
                                    element.name!.startsWith("Kathmandu"),
                              )
                              .name,
                          items: List.generate(
                            state.list.length,
                            (index) => state.list[index].name,
                          ),
                          onChanged: (p0) => setState(
                            () async {
                              final x = state.list.firstWhere(
                                (element) => p0 == element.name,
                              );
                              cityCode = x.id;
                            },
                          ),
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5),
                              hintText: 'Enter Your City.',
                              hintStyle: const TextStyle(
                                color: Color(0xff9CA0C1),
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffDEE2E6)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: kColorSecondary,
                                ),
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                            ),
                            baseStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          clearButtonProps: ClearButtonProps(
                            padding: EdgeInsets.zero,
                            iconSize: 16,
                            visualDensity: VisualDensity.compact,
                            alignment: Alignment.centerRight,
                            isVisible: true,
                            color:
                                cityCode == null ? Colors.white : Colors.black,
                          ),
                          popupProps: PopupProps.modalBottomSheet(
                            showSearchBox: true,
                            modalBottomSheetProps: ModalBottomSheetProps(
                              useSafeArea: false,
                            ),
                          ),
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
                CustomFormField(
                  label: 'Address Line 2',
                  child: CustomTextFormField(
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
                ),
                CustomFormField(
                  isRequired: true,
                  label: 'Language',
                  child: BlocBuilder<LanguageBloc, LanguageState>(
                    builder: (context, state) {
                      if (state is LanguageLoadSuccess) {
                        return DropdownSearch(
                          items: List.generate(
                            state.language.length,
                            (index) => state.language[index].name,
                          ),
                          onChanged: (p0) => setState(
                            () async {
                              final x = state.language.firstWhere(
                                (element) => p0 == element.name,
                              );
                              languageController.text = x.code;
                            },
                          ),
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5),
                              hintText: 'Choose Your Language.',
                              hintStyle: const TextStyle(
                                color: Color(0xff9CA0C1),
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffDEE2E6)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: kColorSecondary,
                                ),
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                            ),
                            baseStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          clearButtonProps: ClearButtonProps(
                            padding: EdgeInsets.zero,
                            iconSize: 16,
                            visualDensity: VisualDensity.compact,
                            alignment: Alignment.centerRight,
                            isVisible: true,
                            color: languageController.text.isEmpty
                                ? Colors.white
                                : Colors.black,
                          ),
                          popupProps: PopupProps.modalBottomSheet(
                            showSearchBox: true,
                            modalBottomSheetProps: ModalBottomSheetProps(
                              useSafeArea: false,
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
                CustomFormField(
                  label: 'Currency',
                  isRequired: true,
                  child: BlocBuilder<CurrencyBloc, CurrencyState>(
                    builder: (context, state) {
                      if (state is CurrencyLoadSuccess) {
                        return DropdownSearch(
                          selectedItem: state.currencyListRes
                              .firstWhere((element) =>
                                  element.name!.startsWith("Nepalese"))
                              .name,
                          items: List.generate(
                            state.currencyListRes.length,
                            (index) => state.currencyListRes[index].name,
                          ),
                          onChanged: (p0) => setState(
                            () async {
                              final x = state.currencyListRes.firstWhere(
                                (element) => p0 == element.name,
                              );
                              currencyCode = x.code;
                            },
                          ),
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5),
                              hintText: 'NPR',
                              hintStyle: const TextStyle(
                                color: Color(0xff9CA0C1),
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffDEE2E6)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: kColorSecondary,
                                ),
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                            ),
                            baseStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          clearButtonProps: ClearButtonProps(
                            padding: EdgeInsets.zero,
                            iconSize: 16,
                            visualDensity: VisualDensity.compact,
                            alignment: Alignment.centerRight,
                            isVisible: true,
                            color: currencyCode == null
                                ? Colors.white
                                : Colors.black,
                          ),
                          popupProps: PopupProps.modalBottomSheet(
                            showSearchBox: true,
                            modalBottomSheetProps: ModalBottomSheetProps(
                              useSafeArea: false,
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                CustomFormField(
                  isRequired: true,
                  label: 'Visibility',
                  child: CustomDropDownField<String>(
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
                ),
                CustomFormField(
                  label: 'Task Preferences',
                  isRequired: true,
                  child: CustomDropDownField<String>(
                    list: kTaskPrefList,
                    onChanged: (value) => setState(
                      () {
                        taskPreferencesController.text = value!;
                      },
                    ),
                    hintText: 'Choose one',
                  ),
                ),
                addVerticalSpace(8),
                Center(
                  child: BlocConsumer<UserBloc, UserState>(
                    listener: (context, state) async {
                      final error = await CacheHelper.getCachedString(
                        kErrorLog,
                      );
                      if (state.theStates == TheStates.success) {
                        if (!mounted) return;
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
                      if (state.theStates == TheStates.failure) {
                        if (!mounted) return;
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
                          if (startTime == null && endTime == null) {
                            if (!mounted) return;
                            showDialog(
                              context: context,
                              builder: (context) => CustomToast(
                                heading: 'Error',
                                content: 'Verify your Active Hours',
                                onTap: () {},
                                isSuccess: false,
                              ),
                            );
                          }
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
                            if (!mounted) return;
                            final Map<String, dynamic> q = {
                              "city": cityCode ?? int.parse(kCityCode),
                              "country": countryName ?? 'NP',
                              "interests": interestCodes,
                              "first_name": firstNameController.text,
                              "middle_name": middleNameController.text,
                              "last_name": lastNameController.text,
                              "bio": bioController.text,
                              "designation": jobProfileController.text,
                              "gender": genderGroup,
                              "skill": tagController.getTags != null
                                  ? tagController.getTags!
                                      .map((e) => '"$e"')
                                      .toList()
                                      .toString()
                                  : '',
                              "date_of_birth":
                                  "${dateOfBirth?.year}-${dateOfBirth?.month}-${dateOfBirth?.day}",
                              "active_hour_start": startTime!.format(context),
                              "active_hour_end": endTime!.format(context),
                              "experience_level": experienceLevel,
                              "profile_visibility":
                                  visibilityController.text.isNotEmpty
                                      ? visibilityController.text
                                      : 'Public',
                              "task_preferences":
                                  taskPreferencesController.text.isNotEmpty
                                      ? taskPreferencesController.text
                                      : 'Short-Term tasks',
                              "address_line1": address1Controller.text,
                              "address_line2": address2Controller.text,
                              "charge_currency": currencyCode ?? 'NPR',
                              "remaining_points": 0,
                              "points": 0,
                              "following_count": 0,
                              "language": languageController.text,
                            };
                            if ((context
                                        .read<UploadBloc>()
                                        .state
                                        .imageFileList !=
                                    null) &&
                                (context
                                        .read<UploadBloc>()
                                        .state
                                        .imageFileList
                                        ?.isNotEmpty ??
                                    false))
                              q.addAll({
                                "profile_image": await MultipartFile.fromFile(
                                  context
                                      .read<UploadBloc>()
                                      .state
                                      .imageFileList!
                                      .last,
                                ),
                              });
                            if (!mounted) return;
                            context.read<UserBloc>().add(
                                  UserAdded(
                                    req: q,
                                  ),
                                );
                          } else {
                            if (!mounted) return;
                            showDialog(
                              context: context,
                              builder: (context) => CustomToast(
                                heading: 'Error',
                                content: 'Something went wrong.',
                                onTap: () {},
                                isSuccess: false,
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
    jobProfileController.dispose();
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
