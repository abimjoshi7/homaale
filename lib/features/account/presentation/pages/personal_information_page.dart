import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_modal_sheet_drawer_icon.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomModalSheetDrawerIcon(),
          Text(
            'Personal Information',
            style: kHeading2,
          ),
          kHeight50,
          Text('Full Name'),
          kHeight5,
          CustomTextFormField(
            hintText: 'Harry Smith',
          ),
          kHeight20,
          Text('Email'),
          kHeight5,
          CustomTextFormField(
            hintText: 'harrysmith@gmail.com',
          ),
          kHeight20,
          Text('Contact'),
          kHeight5,
          CustomTextFormField(
            textInputType: TextInputType.number,
            hintText: 'Mobile Number',
            prefixWidget: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/nepalflag.png'),
                  const Text(
                    '+977',
                    style: kBodyText1,
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          kHeight20,
          Text('Date of birth'),
          kHeight5,
          CustomTextFormField(
            hintText: '03/06/1999',
          ),
          kHeight20,
          Text('Please specify your gender'),
          kHeight5,
          Wrap(
            children: [
              Chip(
                label: Text('Male'),
              ),
              Chip(
                label: Text('Female'),
              ),
              Chip(
                label: Text('Other'),
              ),
            ],
          ),
          kHeight20,
          Text('Bio'),
          kHeight5,
          CustomTextFormField(
            maxLines: 3,
            hintText: 'Add your bio',
          ),
          kHeight20,
          CustomElevatedButton(
            callback: () {},
            label: 'Save',
          )
        ],
      ),
    );
  }
}
