import 'dart:convert';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/features/utilities/data/models/skill_option_model.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          final List<SkillOptionModel> skills =
              state.taskerProfile?.skills ?? [];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.taskerProfile?.bio ?? '',
              ),
              Wrap(
                direction: Axis.vertical,
                runSpacing: 4,
                spacing: 2,
                children: [
                  WidgetText(
                    widget: const Icon(
                      Icons.mail_outline_rounded,
                      color: kColorBlue,
                      size: 16,
                    ),
                    label: state.taskerProfile?.user?.phone ??
                        state.taskerProfile?.user?.email ??
                        '',
                  ),
                  WidgetText(
                    widget: const Icon(
                      Icons.watch_later_outlined,
                      color: kColorGreen,
                      size: 16,
                    ),
                    label: "Active Hours: ${DateFormat.jm().format(
                      DateFormat('hh:mm:ss')
                          .parse(state.taskerProfile?.activeHourStart ?? ''),
                    )} - ${DateFormat.jm().format(
                      DateFormat('hh:mm:ss')
                          .parse(state.taskerProfile?.activeHourEnd ?? ''),
                    )}",
                  ),
                  WidgetText(
                    widget: const Icon(
                      Icons.outlined_flag_rounded,
                      color: kColorOrange,
                      size: 16,
                    ),
                    label: skills.map((e) => e.name).toList().join(', '),
                  ),
                  WidgetText(
                    widget: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.red,
                      size: 16,
                    ),
                    label:
                        "${state.taskerProfile?.addressLine1}, ${state.taskerProfile?.country?.name ?? ''}",
                  ),
                ],
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
