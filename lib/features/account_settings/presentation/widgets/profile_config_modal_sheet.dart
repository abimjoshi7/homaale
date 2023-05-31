import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
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
        if (state.theStates == TheStates.success) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(10),
                Text(
                  'Profile Configuration',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                addVerticalSpace(5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      label: 'Visibility',
                      child: CustomDropDownField(
                        list: const [
                          'Public',
                          'Private',
                        ],
                        hintText: state.taskerProfile?.profileVisibility ??
                            'Choose one',
                        onChanged: (value) => setState(
                          () {
                            visibiltyType = value;
                          },
                        ),
                      ),
                    ),
                    addVerticalSpace(5),

                    CustomFormField(
                      label: 'Task Preferences',
                      child: CustomDropDownField(
                        list: kTaskPrefList,
                        hintText:
                            state.taskerProfile?.taskPreferences ?? 'Choose one',
                        onChanged: (value) => setState(
                          () {
                            taskPreferences = value;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                kHeight20,
                CustomElevatedButton(
                  label: 'Save',
                  callback: () {
                    final map = {
                      "profile_visibility":
                          visibiltyType ?? state.taskerProfile?.profileVisibility,
                      "task_preferences":
                          taskPreferences ?? state.taskerProfile?.taskPreferences,
                    };
                    context.read<UserBloc>().add(
                          UserEdited(
                            req: map,
                          ),
                        );
                  },
                ),
                kHeight10,
                CustomElevatedButton(
                  callback: () async {
                    Navigator.pop(context);
                  },
                  label: 'Cancel',
                  textColor: kColorPrimary,
                  mainColor: Colors.white,
                  borderColor: kColorPrimary,
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
