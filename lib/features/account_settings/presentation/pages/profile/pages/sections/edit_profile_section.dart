import 'dart:io';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/image_picker/image_picker_dialog.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EditProfileSection extends StatefulWidget {
  const EditProfileSection({super.key});

  @override
  State<EditProfileSection> createState() => _EditProfileSectionState();
}

class _EditProfileSectionState extends State<EditProfileSection> {
  String? firstName;
  String? middleName;
  String? lastName;
  String? designation;
  String? profilePicture;
  XFile? selectedImage;
  bool isMale = true;
  bool isFemale = false;
  bool isOther = false;
  String? email;
  String? contact;
  DateTime? dob;
  String? bio;

  final _key = GlobalKey<FormState>();
  bool isCamera = false;
  late UserBloc userBloc;
  final uploadBloc = locator<UploadBloc>();
  late String? _gender;

  @override
  void initState() {
    super.initState();
    userBloc = context.read<UserBloc>();
    switch (userBloc.state.taskerProfile?.gender?.toLowerCase()) {
      case "male":
        _gender = "Male";
        break;
      case "female":
        _gender = "Female";
        break;
      default:
        _gender = "Other";
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    uploadBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      bloc: userBloc,
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
          designation = state.taskerProfile?.designation;
          profilePicture = state.taskerProfile?.profileImage;

          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Form(
              key: _key,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSpace(20),
                      Text(
                        'General Information',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      addVerticalSpace(10),
                      Stack(
                        children: [
                          BlocBuilder<UploadBloc, UploadState>(
                            bloc: uploadBloc,
                            builder: (context, state) {
                              return Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                width: 100,
                                height: 100,
                                child: state.imageFileList.length != 0
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          50,
                                        ),
                                        child: Image.file(
                                          File(
                                            state.imageFileList.last,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Image.network(
                                        profilePicture ?? kServiceImageNImg,
                                      ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 0.1,
                            right: 0.1,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => ImagePickerDialog(
                                    bloc: uploadBloc,
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent.withOpacity(
                                  0.5,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      addVerticalSpace(
                        10,
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
                                      style: Theme.of(context).textTheme.headlineSmall,
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
                                  hintText: state.taskerProfile?.user?.firstName ?? '',
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
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                kHeight5,
                                CustomTextFormField(
                                  hintText: state.taskerProfile?.user?.middleName ?? '',
                                  onSaved: (p0) => setState(
                                    () {
                                      middleName = p0;
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
                                  children: [
                                    Text(
                                      'Last name',
                                      style: Theme.of(context).textTheme.headlineSmall,
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
                                  hintText: state.taskerProfile?.user?.lastName ?? '',
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
                                Text('+977', style: Theme.of(context).textTheme.headlineSmall),
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
                              dob ?? state.taskerProfile?.dateOfBirth ?? DateTime.now(),
                            ),
                          ),
                        ),
                      ),
                      addVerticalSpace(10),
                      CustomFormField(
                        label: 'Please specify your gender',
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      value: "Male",
                                      groupValue: _gender,
                                      onChanged: (value) {
                                        setState(() {
                                          _gender = value!;
                                        });
                                      },
                                    ),
                                    addHorizontalSpace(
                                      8,
                                    ),
                                    Text("Male")
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      value: "Female",
                                      groupValue: _gender,
                                      onChanged: (value) {
                                        setState(() {
                                          _gender = value!;
                                        });
                                      },
                                    ),
                                    addHorizontalSpace(
                                      8,
                                    ),
                                    Text("Female")
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      value: "Other",
                                      groupValue: _gender,
                                      onChanged: (value) {
                                        setState(() {
                                          _gender = value!;
                                        });
                                      },
                                    ),
                                    addHorizontalSpace(
                                      8,
                                    ),
                                    Text("Other")
                                  ],
                                ),
                              ),

                              // ChoiceChip(
                              //   selected: isMale,
                              //   backgroundColor: Colors.transparent,
                              //   shape: const RoundedRectangleBorder(
                              //     side: BorderSide(color: Color(0xffDEE2E6)),
                              //   ),
                              //   onSelected: (value) {
                              //     setState(() {
                              //       isMale = value;
                              //       isFemale = !value;
                              //       isOther = !value;
                              //     });
                              //   },
                              //   label: Text(
                              //     'Male',
                              //     style: Theme.of(context).textTheme.bodySmall,
                              //   ),
                              //   selectedColor: kColorPrimary,
                              // ),
                              // ChoiceChip(
                              //   selected: isFemale,
                              //   backgroundColor: Colors.transparent,
                              //   shape: const RoundedRectangleBorder(
                              //     side: BorderSide(color: Color(0xffDEE2E6)),
                              //   ),
                              //   onSelected: (value) {
                              //     setState(() {
                              //       isFemale = value;
                              //       isMale = !value;
                              //       isOther = !value;
                              //     });
                              //   },
                              //   label: Text(
                              //     'Female',
                              //     style: Theme.of(context).textTheme.bodySmall,
                              //   ),
                              //   selectedColor: kColorPrimary,
                              // ),
                              // ChoiceChip(
                              //   selected: isOther,
                              //   backgroundColor: Colors.transparent,
                              //   shape: const RoundedRectangleBorder(
                              //     side: BorderSide(color: Color(0xffDEE2E6)),
                              //   ),
                              //   onSelected: (value) {
                              //     setState(() {
                              //       isOther = value;
                              //       isMale = !value;
                              //       isFemale = !value;
                              //     });
                              //   },
                              //   label: Text(
                              //     'Other',
                              //     style: Theme.of(context).textTheme.bodySmall,
                              //   ),
                              //   selectedColor: kColorPrimary,
                              // ),
                            ],
                          ),
                        ),
                      ),
                      CustomFormField(
                        label: 'Bio',
                        child: CustomTextFormField(
                          maxLines: 3,
                          hintText: bio ?? state.taskerProfile?.bio ?? 'Enter Bio',
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
                        final Map<String, dynamic> user = {
                          "first_name": firstName!.isEmpty ? state.taskerProfile?.user!.firstName : firstName,
                          "middle_name": middleName!.isEmpty ? state.taskerProfile?.user!.middleName : middleName,
                          "last_name": lastName!.isEmpty ? state.taskerProfile?.user!.lastName : lastName,
                          // "designation": designation!.isEmpty
                          //     ? state.taskerProfile?.designation
                          //     : designation,
                          "date_of_birth": DateFormat("yyyy-MM-dd").format(
                            dob ?? state.taskerProfile?.dateOfBirth ?? DateTime.now(),
                          ),
                          "bio": bio ?? state.taskerProfile?.bio ?? 'Bio',
                          "gender": _gender ?? state.taskerProfile?.gender ?? "Male",
                          // "profile_image": state.taskerProfile?.profileImage
                          // uploadBloc.state.imageFileList.length == 0
                          //     ? state.taskerProfile?.profileImage
                          //     : await MultipartFile.fromString(
                          //         uploadBloc.state.imageFileList.last,
                          //       )
                        };

                        if (uploadBloc.state.imageFileList.length != 0) {
                          final file = await MultipartFile.fromFile(uploadBloc.state.imageFileList.last);
                          print(file.filename);
                          user.addAll({
                            "profile_image": file,
                          });
                        }
                        if (!mounted) return;
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
                        print(uploadBloc.state.imageFileList);
                        // Navigator.pop(context);
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
}
