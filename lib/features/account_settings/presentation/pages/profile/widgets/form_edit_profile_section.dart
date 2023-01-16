import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDataCubit, UserDataState>(
      listener: (context, state) async {
        if (state is UserDataEditSuccess) {
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              isSuccess: true,
              heading: 'Success',
              content: 'Profile was edited successfully',
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                Root.routeName,
                (route) => false,
              ),
            ),
          );
        } else if (state is UserDataEditFailure) {
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              isSuccess: false,
              heading: 'Failure',
              content: 'Profile cannot be edited',
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
        if (state is UserDataLoadSuccess) {
          firstName = state.userData.user!.firstName;
          middleName = state.userData.user!.middleName;
          lastName = state.userData.user!.lastName;
          designation = state.userData.designation.toString();
          profilePicture = state.userData.profileImage.toString();
          return Padding(
            padding: kPadding20,
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      await ImagePickHelper().pickImagePath().then(
                        (value) {
                          if (value != null) {
                            setState(
                              () {
                                selectedImage = value;
                              },
                            );
                          }
                        },
                      );
                      await MultipartFile.fromFile(selectedImage!.path).then(
                        (value) {
                          context.read<UserDataCubit>().editProfilePic(
                            {
                              "profile_image": value,
                            },
                          );
                        },
                      );
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
                                  profilePicture ??
                                      'https://www.seekpng.com/ima/u2q8u2w7e6y3a9a9/',
                                ),
                              ),
                            ),
                            width: 100,
                            height: 100,
                          ),
                        ),
                        kHeight15,
                        const Center(
                          child: Text(
                            'Change profile photo',
                            style: kPurpleText16,
                          ),
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
                              hintText: state.userData.user!.firstName!,
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
                            const Text(
                              'Middle name',
                              style: kPurpleText16,
                            ),
                            kHeight5,
                            CustomTextFormField(
                              hintText: state.userData.user!.middleName!,
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
                              hintText: state.userData.user!.lastName!,
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
                  kHeight20,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Designation',
                        style: kPurpleText16,
                      ),
                      kHeight5,
                      CustomTextFormField(
                        hintText: state.userData.designation.toString(),
                        onSaved: (p0) => setState(
                          () {
                            designation = p0;
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Task Analytics',
                            style: kPurpleText16,
                          ),
                          Switch(
                            value: false,
                            onChanged: (value) {},
                          )
                        ],
                      ),
                      const Text(
                        'Do you want to enable task analytics in profile?',
                        style: kHelper13,
                      ),
                    ],
                  ),
                  kHeight50,
                  Center(
                    child: CustomElevatedButton(
                      callback: () async {
                        _key.currentState!.save();

                        final userData = {
                          "first_name": firstName!.isEmpty
                              ? state.userData.user!.firstName
                              : firstName,
                          "middle_name": middleName!.isEmpty
                              ? state.userData.user!.middleName
                              : middleName,
                          "last_name": lastName!.isEmpty
                              ? state.userData.user!.lastName
                              : lastName,
                          "designation": designation!.isEmpty
                              ? state.userData.designation
                              : designation,
                        };

                        await context
                            .read<UserDataCubit>()
                            .editTaskerUserData(userData);
                      },
                      label: 'Save',
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (state is UserDataLoadFailure) {
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
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
