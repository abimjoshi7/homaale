import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileConfigModalSheet extends StatefulWidget {
  const ProfileConfigModalSheet({super.key});

  @override
  State<ProfileConfigModalSheet> createState() =>
      _ProfileConfigModalSheetState();
}

class _ProfileConfigModalSheetState extends State<ProfileConfigModalSheet> {
  String? visibiltyType;
  String? taskPreferences;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomModalSheetDrawerIcon(),
        const Text(
          'Profile Configuration',
          style: kPurpleText19,
        ),
        Padding(
          padding: kPadding20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFormField(
                label: 'Visibility',
                isRequired: false,
                child: CustomDropDownField(
                  list: const [
                    'Public',
                    'Private',
                  ],
                  hintText: 'Choose one',
                  onChanged: (value) => setState(
                    () {
                      visibiltyType = value;
                    },
                  ),
                ),
              ),
              CustomFormField(
                label: 'Task Preferences',
                isRequired: false,
                child: CustomDropDownField(
                  list: const [
                    'Short term tasks',
                    'Long term tasks',
                  ],
                  hintText: 'Choose one',
                  onChanged: (value) => setState(
                    () {
                      taskPreferences = value;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        kHeight20,
        BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return CustomElevatedButton(
              label: 'Save',
              callback: () {
                if (state is UserLoadSuccess) {
                  final map = {
                    "profile_visibility": visibiltyType,
                    "task_preferences": taskPreferences,
                  };
                  // context.read<UserBloc>().editTaskeruser(map);
                }
              },
            );
          },
        )
      ],
    );
  }
}
