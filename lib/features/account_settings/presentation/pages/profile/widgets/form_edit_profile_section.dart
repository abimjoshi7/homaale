import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
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
          designation = state.taskerProfile?.designation;
          profilePicture = state.taskerProfile?.profileImage;
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Form(
              key: _key,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
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
                                        widget: Icon(Icons.camera_alt_outlined),
                                        label: "Gallery"),
                                  ],
                                ),
                              ),
                            )
                                // .then(
                                //   (value) async => await MultimediaPickHelper()
                                //       .(
                                //     isCamera: isCamera,
                                //   )
                                //       .then(
                                //     (value) {
                                //       if (value != null) {
                                //         setState(
                                //           () {
                                //             selectedImage = value;
                                //           },
                                //         );
                                //       }
                                //     },
                                //   ),
                                // )
                                ;
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addVerticalSpace(10),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      profilePicture ?? kServiceImageNImg,
                                    ),
                                  ),
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
                        CustomFormField(
                          label: 'Please specify your gender',
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ChoiceChip(
                                selected: isMale,
                                backgroundColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xffDEE2E6)),
                                ),
                                onSelected: (value) {
                                  setState(() {
                                    isMale = value;
                                    isFemale = !value;
                                    isOther = !value;
                                  });
                                },
                                label: Text(
                                  'Male',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                selectedColor: kColorPrimary,
                              ),
                              ChoiceChip(
                                selected: isFemale,
                                backgroundColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xffDEE2E6)),
                                ),
                                onSelected: (value) {
                                  setState(() {
                                    isFemale = value;
                                    isMale = !value;
                                    isOther = !value;
                                  });
                                },
                                label: Text(
                                  'Female',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                selectedColor: kColorPrimary,
                              ),
                              ChoiceChip(
                                selected: isOther,
                                backgroundColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xffDEE2E6)),
                                ),
                                onSelected: (value) {
                                  setState(() {
                                    isOther = value;
                                    isMale = !value;
                                    isFemale = !value;
                                  });
                                },
                                label: Text(
                                  'Other',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                selectedColor: kColorPrimary,
                              ),
                            ],
                          ),
                        ),
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
