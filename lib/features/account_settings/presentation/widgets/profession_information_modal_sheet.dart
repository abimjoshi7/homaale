import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/pages.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfessionalInformationModalSheet extends StatefulWidget {
  const ProfessionalInformationModalSheet({super.key});

  @override
  State<ProfessionalInformationModalSheet> createState() =>
      _ProfessionalInformationModalSheetState();
}

class _ProfessionalInformationModalSheetState
    extends State<ProfessionalInformationModalSheet> {
  String? userType;
  String? specialities;
  String? experienceLevel;
  TimeOfDay? issuedTime;
  TimeOfDay? completeTime;
  String? daySelect;
  TaskerProfileRetrieveRes? user;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is UserLoadSuccess) {
          user = state.user;
          // Widget displayUserType() {
          //   if(user?.userType == 'Client')
          //   return Checkbox(
          //     value: user?.userType == ,
          //     onChanged: (value) {
          //       setState(
          //         () {
          //           // userType = value;
          //         },
          //       );
          //     },
          //   );
          // }

          return Column(
            children: [
              const CustomModalSheetDrawerIcon(),
              const Text(
                'Professional Information',
                style: kPurpleText16,
              ),
              Padding(
                padding: kPadding20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      isRequired: false,
                      label: 'Select User Type',
                      child: Row(
                        children: [
                          Row(
                            children: [
                              // displayUserType(),
                              const Text('Client'),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                groupValue: userType,
                                value: 'Tasker',
                                onChanged: (value) {
                                  setState(() {
                                    userType = value;
                                  });
                                },
                              ),
                              const Text('Tasker')
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomFormField(
                      label: 'Specialities',
                      isRequired: false,
                      child: CustomTextFormField(
                        hintText: 'Enter your skills',
                        onChanged: (p0) => setState(
                          () {
                            specialities = p0;
                          },
                        ),
                      ),
                    ),
                    // CustomFormField(
                    //   label: 'Experience Level',
                    //   isRequired: false,
                    //   child: CustomDropDownField(
                    //     hintText: 'Enter your skills',
                    //     list: [
                    //       'Beginner(0 to 1 years experience)'
                    //           'Intermediate(1 to 5 years experience)'
                    //           'Expert(5 years experience or more)'
                    //     ],
                    //     onSaved: (value) => setState(() {}),
                    //   ),
                    // ),
                    kHeight20,
                    const Text(
                      'Active Hours',
                      style: kPurpleText16,
                    ),
                    kHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sunday',
                          style: kPurpleText16,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outline_rounded,
                            color: kColorPrimary,
                          ),
                        ),
                      ],
                    ),
                    kHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Flexible(
                          child: CustomFormContainer(
                            hintText: '08: 00 AM',
                            leadingWidget: Icon(
                              Icons.access_time_rounded,
                              color: kColorPrimary,
                            ),
                          ),
                        ),
                        kWidth10,
                        Text('To'),
                        kWidth10,
                        Flexible(
                          child: CustomFormContainer(
                            hintText: '09: 00 AM',
                            leadingWidget: Icon(
                              Icons.access_time_rounded,
                              color: kColorPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    kHeight20,
                    CustomFormField(
                      label: 'Select Day',
                      isRequired: false,
                      child: CustomDropDownField(
                        hintText: 'Specify the day',
                        list: const [
                          'Every day',
                          'Weekend',
                        ],
                        onChanged: (value) => setState(
                          () {
                            daySelect = value;
                          },
                        ),
                      ),
                    ),
                    Row(
                      children: const [
                        Flexible(
                          child: CustomFormField(
                            label: 'From',
                            isRequired: false,
                            child: CustomFormContainer(
                              hintText: '08: 00 AM',
                            ),
                          ),
                        ),
                        kWidth20,
                        Flexible(
                          child: CustomFormField(
                            label: 'To',
                            isRequired: false,
                            child: CustomFormContainer(
                              hintText: '09: 00 AM',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomElevatedButton(
                callback: () async {},
                label: 'Save',
              )
            ],
          );
        }
        return CustomElevatedButton(
          callback: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              CompleteProfilePage.routeName,
              (route) => false,
            );
          },
          label: 'Complete Profile',
        );
      },
    );
  }
}
