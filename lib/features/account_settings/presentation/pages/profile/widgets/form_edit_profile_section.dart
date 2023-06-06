import 'dart:developer';
import 'dart:io';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class FormEditProfileSection extends StatefulWidget {
  const FormEditProfileSection({super.key});

  @override
  State<FormEditProfileSection> createState() => _FormEditProfileSectionState();
}

class _FormEditProfileSectionState extends State<FormEditProfileSection> {
  String? firstName;
  String? middleName;
  String? lastName;
  String? designation;
  String? profilePicture;
  XFile? selectedImage;
  String? gender;
  bool isMale = true;
  bool isFemale = false;
  bool isOther = false;
  String? email;
  String? contact;
  DateTime? dob;
  String? bio;

  final _key = GlobalKey<FormState>();
  bool isCamera = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) async {
        if (state.theStates == TheStates.success) {
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              isSuccess: true,
              heading: 'Success',
              content: 'Profile was updated successfully',
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                Root.routeName,
                (route) => false,
              ),
            ),
          );
        } else if (state.theStates == TheStates.failure) {
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              isSuccess: false,
              heading: 'Failure',
              content: 'Profile cannot be updated',
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                Root.routeName,
                (route) => false,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          firstName = state.taskerProfile?.user?.firstName;
          middleName = state.taskerProfile?.user?.middleName;
          lastName = state.taskerProfile?.user?.lastName;
          gender = state.taskerProfile?.gender;
          designation = state.taskerProfile?.designation;
          profilePicture = state.taskerProfile?.profileImage;
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Form(
              key: _key,
              child: SingleChildScrollView(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addVerticalSpace(20),
                        Text('General Information',
                            style: Theme.of(context).textTheme.headlineSmall),
                        InkWell(
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    WidgetText(
                                        callback: () {
                                          setState(
                                            () {
                                              isCamera = true;
                                            },
                                          );
                                          Navigator.pop(context);
                                        },
                                        widget: Icon(Icons.camera_alt_outlined),
                                        label: "Camera"),
                                    WidgetText(
                                        callback: () {
                                          setState(
                                            () {
                                              isCamera = false;
                                            },
                                          );
                                          Navigator.pop(context);
                                        },
                                        widget: Icon(Icons.collections),
                                        label: "Gallery"),
                                  ],
                                ),
                              ),
                            ).then(
                              (value) async => await ImagePicker()
                                  .pickImage(
                                      source: isCamera
                                          ? ImageSource.camera
                                          : ImageSource.gallery)
                                  .then(
                                    (value) => setState(
                                      () {
                                        selectedImage = XFile(value!.path);
                                      },
                                    ),
                                  ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addVerticalSpace(10),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: (selectedImage == null)
                                      ? DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            profilePicture ?? kServiceImageNImg,
                                          ),
                                        )
                                      : DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            File(selectedImage!.path),
                                          )),
                                ),
                                width: 100,
                                height: 100,
                              ),
                              addVerticalSpace(
                                16,
                              ),
                              Text(
                                'Change profile photo',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                        addVerticalSpace(
                          32,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'First name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
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
                                    hintText:
                                        state.taskerProfile?.user?.firstName ??
                                            '',
                                    onSaved: (p0) => setState(
                                      () {
                                        firstName = p0;
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
                                  Text(
                                    'Middle name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  kHeight5,
                                  CustomTextFormField(
                                    hintText:
                                        state.taskerProfile?.user?.middleName ??
                                            '',
                                    onSaved: (p0) => setState(
                                      () => middleName = p0,
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
                                    children: [
                                      Text(
                                        'Last name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
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
                                    hintText:
                                        state.taskerProfile?.user?.lastName ??
                                            '',
                                    onSaved: (p0) => setState(
                                      () {
                                        lastName = p0;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        CustomFormField(
                          label: 'Email',
                          child: CustomTextFormField(
                            hintText: state.taskerProfile?.user?.email ?? '',
                            onChanged: (p0) => setState(
                              () {
                                email = p0;
                              },
                            ),
                          ),
                        ),
                        CustomFormField(
                          label: 'Contact',
                          child: CustomTextFormField(
                            textInputType: TextInputType.number,
                            hintText: state.taskerProfile?.user?.phone ?? '',
                            prefixWidget: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset('assets/nepalflag.png'),
                                  Text('+977',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                  const Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                            onChanged: (p0) => setState(
                              () {
                                contact = p0;
                              },
                            ),
                          ),
                        ),
                        CustomFormField(
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
                                    dob = value;
                                  },
                                ),
                              );
                            },
                            child: CustomFormContainer(
                              leadingWidget: const Icon(Icons.calendar_month),
                              hintText: DateFormat('yyyy-MM-dd').format(
                                dob ??
                                    state.taskerProfile?.dateOfBirth ??
                                    DateTime.now(),
                              ),
                            ),
                          ),
                        ),
                        addVerticalSpace(10),
                        _buildSelectGenderField(context),
                        CustomFormField(
                          label: 'Bio',
                          child: CustomTextFormField(
                            maxLines: 3,
                            hintText:
                                bio ?? state.taskerProfile?.bio ?? 'Enter Bio',
                            onChanged: (p0) => setState(
                              () {
                                bio = p0;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(10),
                    Center(
                      child: CustomElevatedButton(
                        callback: () async {
                          _key.currentState?.save();
                          final user = {
                            "first_name": firstName!.isEmpty
                                ? state.taskerProfile?.user!.firstName
                                : firstName,
                            "middle_name": middleName!.isEmpty
                                ? state.taskerProfile?.user!.middleName
                                : middleName,
                            "last_name": lastName!.isEmpty
                                ? state.taskerProfile?.user!.lastName
                                : lastName,
                            "gender": gender,
                            // "designation": designation!.isEmpty
                            //     ? state.taskerProfile?.designation
                            //     : designation,
                            "date_of_birth": DateFormat("yyyy-MM-dd").format(
                              dob ??
                                  state.taskerProfile?.dateOfBirth ??
                                  DateTime.now(),
                            ),
                            "bio": bio ?? state.taskerProfile?.bio ?? 'Bio',
                          };

                          context.read<UserBloc>().add(
                                UserEdited(req: user),
                              );
                        },
                        label: 'Save',
                      ),
                    ),
                    addVerticalSpace(10),
                    Center(
                      child: CustomElevatedButton(
                        callback: () async {
                          Navigator.pop(context);
                        },
                        label: 'Cancel',
                        textColor: kColorPrimary,
                        mainColor: Colors.white,
                        borderColor: kColorPrimary,
                      ),
                    ),
                    // ! TO BE IMPLEMENTED
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text(
                    //           'Task Analytics',
                    //           style: Theme.of(context).textTheme.headlineSmall,
                    //         ),
                    //         Switch(
                    //           value: false,
                    //           onChanged: (value) {},
                    //         )
                    //       ],
                    //     ),
                    //     Text(
                    //       'Do you want to enable task analytics in profile?',
                    //       style: Theme.of(context).textTheme.bodySmall,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          );
        } else if (state.theStates == TheStates.failure) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Profile is not completed.'),
                kHeight20,
                CustomElevatedButton(
                  callback: () {
                    Navigator.pushNamed(
                      context,
                      CompleteProfilePage.routeName,
                    );
                  },
                  label: 'Complete Profile',
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: CardLoading(
              height: 200,
            ),
          );
        }
      },
    );
  }

  CustomFormField _buildSelectGenderField(BuildContext context) {
    return CustomFormField(
      isRequired: true,
      label: 'Please specify your gender',
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Radio<String>(
              value: "Male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                  isMale = value == "Male";
                  isFemale = value == "Female";
                  isOther = value == "Other";
                });
              },
            ),
            const Text('Male'),
            addHorizontalSpace(10),
            Radio<String>(
              value: "Female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                  isMale = value == "Male";
                  isFemale = value == "Female";
                  isOther = value == "Other";
                });
              },
            ),
            const Text('Female'),
            addHorizontalSpace(10),
            Radio<String>(
              value: "Other",
              groupValue: gender,
              onChanged: (value) {
                gender = value;
                setState(() {
                  gender = value;
                  isMale = value == "Male";
                  isFemale = value == "Female";
                  isOther = value == "Other";
                });
              },
            ),
            const Text('Other'),
            addHorizontalSpace(10),
            // ChoiceChip(
          ],
        ),
      ),
    );
  }
}
