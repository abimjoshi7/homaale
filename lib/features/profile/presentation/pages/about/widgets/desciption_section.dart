import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        Widget displayBio() {
          if (state is UserDataLoadSuccess) {
            return Text(state.userData.bio!);
          } else {
            return const Text(
              'A professional gardener with over 10 years of experience. I specialise in Lasagna gardening, Keyhole gardening, mittleider gardening, square foot gardening, and  conventional gardening. ',
            );
          }
        }

        Widget displayUsername() {
          if (state is UserDataLoadSuccess) {
            return IconText(
              widget: Image.asset('assets/mail.png'),
              label: state.userData.user!.phone ?? state.userData.user!.email!,
            );
          } else {
            return IconText(
              widget: Image.asset('assets/mail.png'),
              label: 'harrysmith@gmail.com',
            );
          }
        }

        Widget displayActiveHours() {
          if (state is UserDataLoadSuccess) {
            return IconText(
              widget: Image.asset('assets/clock.png'),
              label:
                  'Active Hours ${state.userData.activeHourStart!.substring(0, 5)} - ${state.userData.activeHourEnd!.substring(0, 5)}',
            );
          } else {
            return IconText(
              widget: Image.asset('assets/clock.png'),
              label: 'Active Hours 12:00 am - 8:00 pm',
            );
          }
        }

        Widget displaySkill() {
          if (state is UserDataLoadSuccess) {
            return IconText(
              widget: Image.asset('assets/sparkle.png'),
              label: state.userData.skill!,
            );
          } else {
            return IconText(
              widget: Image.asset('assets/sparkle.png'),
              label: 'House Cleaning',
            );
          }
        }

        Widget displayLocation() {
          if (state is UserDataLoadSuccess) {
            return IconText(
              widget: Image.asset('assets/location.png'),
              label: state.userData.addressLine1!,
            );
          } else {
            return IconText(
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
