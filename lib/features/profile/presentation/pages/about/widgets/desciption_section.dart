import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          final x =
              state.taskerProfile?.skill?.replaceAll(RegExp(r"[^\s\w]"), '');
          final skills = x?.split(' ');
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.taskerProfile?.bio ?? ''),
                kHeight15,
                WidgetText(
                  widget: Image.asset('assets/mail.png'),
                  label: state.taskerProfile?.user?.phone ??
                      state.taskerProfile?.user?.email ??
                      '',
                ),
                WidgetText(
                  widget: Image.asset('assets/clock.png'),
                  label: "Active Hours: ${DateFormat.jm().format(
                    DateFormat('hh:mm:ss')
                        .parse(state.taskerProfile?.activeHourStart ?? ''),
                  )} - ${DateFormat.jm().format(
                    DateFormat('hh:mm:ss')
                        .parse(state.taskerProfile?.activeHourEnd ?? ''),
                  )}",
                ),
                WidgetText(
                  widget: Image.asset('assets/sparkle.png'),
                  label: skills?.join(', ') ?? 'No skills added',
                ),
                WidgetText(
                  widget: Image.asset('assets/location.png'),
                  label:
                      "${state.taskerProfile?.addressLine1}, ${state.taskerProfile?.country?.name ?? ''}",
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
