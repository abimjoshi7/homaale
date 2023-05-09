import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
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
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
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
                            children: [
                              Center(
                                child: Container(
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
                              ),
                              addVerticalSpace(
                                16,
                              ),
                              Center(
                                child: Text(
                                  'Change profile photo',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
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
                        addVerticalSpace(
                          32,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Designation',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            kHeight5,
                            CustomTextFormField(
                              hintText: state.taskerProfile?.designation ?? '',
                              onSaved: (p0) => setState(
                                () {
                                  designation = p0;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                          "designation": designation!.isEmpty
                              ? state.taskerProfile?.designation
                              : designation,
                        };

                        context.read<UserBloc>().add(
                              UserEdited(req: user),
                            );
                      },
                      label: 'Save',
                    ),
                  ),
                  addVerticalSpace(
                    16,
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
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      CompleteProfilePage.routeName,
                      (route) => false,
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
