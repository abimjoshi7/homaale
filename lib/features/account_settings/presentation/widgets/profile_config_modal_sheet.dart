import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoadSuccess) {
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
                      child: CustomDropDownField(
                        list: const [
                          'Public',
                          'Private',
                        ],
                        hintText: state.user.profileVisibility ?? 'Choose one',
                        onChanged: (value) => setState(
                          () {
                            visibiltyType = value;
                          },
                        ),
                      ),
                    ),
                    CustomFormField(
                      label: 'Task Preferences',
                      child: CustomDropDownField(
                        list: const [
                          'Short term tasks',
                          'Long term tasks',
                        ],
                        hintText: state.user.taskPreferences ?? 'Choose one',
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
              CustomElevatedButton(
                label: 'Save',
                callback: () {
                  final map = {
                    "profile_visibility":
                        visibiltyType ?? state.user.profileVisibility,
                    "task_preferences":
                        taskPreferences ?? state.user.taskPreferences,
                  };
                  context.read<UserBloc>().add(
                        UserEdited(
                          req: map,
                        ),
                      );
                },
              )
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
