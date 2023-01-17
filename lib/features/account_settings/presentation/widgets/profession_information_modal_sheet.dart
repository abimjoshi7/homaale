import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
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
                        Radio(
                          groupValue: userType,
                          value: 'Client',
                          onChanged: (value) {},
                        ),
                        const Text('Client')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          groupValue: userType,
                          value: 'Tasker',
                          onChanged: (value) {},
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
                  list: [
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
                children: [
                  Flexible(
                    child: CustomFormField(
                      label: 'From',
                      child: CustomFormContainer(
                        hintText: '08: 00 AM',
                      ),
                      isRequired: false,
                    ),
                  ),
                  kWidth20,
                  Flexible(
                    child: CustomFormField(
                      label: 'To',
                      child: CustomFormContainer(
                        hintText: '09: 00 AM',
                      ),
                      isRequired: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomElevatedButton(
          callback: () {},
          label: 'Save',
        )
      ],
    );
  }
}
