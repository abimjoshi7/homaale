import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/networking/models/request/tasker_profile_create_req.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatelessWidget {
  static const routeName = '/edit-profile-page';
  const EditProfilePage({super.key});

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
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            child: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(
                  0xff212529,
                ),
              ),
            ),
          ),
          const Divider(),
          const Expanded(
            child: FormEditProfileSection(),
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Additional account setting',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                AdditionalAccountInfoPage.routeName,
              );
            },
          ),
          kHeight10,
        ],
      ),
    );
  }
}

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
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoadSuccess) {
          firstName = state.userData.user!.firstName;
          middleName = state.userData.user!.middleName;
          lastName = state.userData.user!.lastName;
          designation = state.userData.designation.toString();

          return Padding(
            padding: kPadding20,
            child: Form(
              key: _key,
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
                      callback: () {
                        _key.currentState!.save();

                        final userData = {
                          "first_name": firstName ?? '',
                          "middle_name": middleName ?? '',
                          "last_name": lastName ?? '',
                          "designation": designation ?? '',
                        };

                        // context
                        //     .read<UserDataCubit>()
                        //     .editTaskerUserData(userData);
                      },
                      label: 'Save',
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
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
        }
      },
    );
  }
}
