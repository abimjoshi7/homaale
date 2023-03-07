import 'package:cipher/core/constants/constants.dart';
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
        Widget displayBio() {
          if (state is UserLoadSuccess) {
            return Text(state.user.bio!);
          } else {
            return const Text(
              'A professional gardener with over 10 years of experience. I specialise in Lasagna gardening, Keyhole gardening, mittleider gardening, square foot gardening, and  conventional gardening. ',
            );
          }
        }

        Widget displayUsername() {
          if (state is UserLoadSuccess) {
            return WidgetText(
              widget: Image.asset('assets/mail.png'),
              label: state.user.user!.phone ?? state.user.user!.email!,
            );
          } else {
            return WidgetText(
              widget: Image.asset('assets/mail.png'),
              label: 'harrysmith@gmail.com',
            );
          }
        }

        Widget displayActiveHours() {
          if (state is UserLoadSuccess) {
            return WidgetText(
              widget: Image.asset('assets/clock.png'),
              label: "Active Hours: ${DateFormat.jm().format(
                DateFormat('hh:mm:ss').parse(state.user.activeHourStart ?? ''),
              )} - ${DateFormat.jm().format(
                DateFormat('hh:mm:ss').parse(state.user.activeHourEnd ?? ''),
              )}",
            );
          } else {
            return WidgetText(
              widget: Image.asset('assets/clock.png'),
              label: 'Active Hours: 12:00 am - 8:00 pm',
            );
          }
        }

        Widget displaySkill() {
          if (state is UserLoadSuccess) {
            final x = state.user.skill?.replaceAll(RegExp(r"[^\s\w]"), '');
            final skills = x?.split(' ');
            return WidgetText(
              widget: Image.asset('assets/sparkle.png'),
              label: skills?.join(', ') ?? 'No skills added',
            );
          } else {
            return WidgetText(
              widget: Image.asset('assets/sparkle.png'),
              label: 'No skills added',
            );
          }
        }

        Widget displayLocation() {
          if (state is UserLoadSuccess) {
            return WidgetText(
              widget: Image.asset('assets/location.png'),
              label:
                  "${state.user.addressLine1}, ${state.user.country?["name"] ?? ''}",
            );
          } else {
            return WidgetText(
              widget: Image.asset('assets/location.png'),
              label: 'New baneshwor, Kathmandu, Nepal',
            );
          }
        }

        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              displayBio(),
              kHeight15,
              displayUsername(),
              displayActiveHours(),
              displaySkill(),
              displayLocation(),
            ],
          ),
        );
      },
    );
  }
}
