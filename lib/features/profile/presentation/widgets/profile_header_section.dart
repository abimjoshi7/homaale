import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/complete_profile_page.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        Widget displayName() {
          if (state is UserDataLoadSuccess) {
            return Text(
              '${state.userData.user!.firstName!} ${state.userData.user!.lastName!}',
            );
          } else {
            return const Text('FirstName LastName');
          }
        }

        Widget displayDesignation() {
          if (state is UserDataLoadSuccess) {
            return Text(
              state.userData.designation.toString(),
            );
          } else {
            return const Text('Individual | Homaale User');
          }
        }

        Widget displayRating() {
          if (state is UserDataLoadSuccess) {
            return Row(
              children: List.generate(
                state.userData.rating!.userRatingCount!,
                (index) => const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
              ),
            );
          } else {
            return Row(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
              ),
            );
          }
        }

        return ListTile(
          leading: Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  displayName(),
                  kWidth5,
                  const Icon(
                    Icons.verified,
                    color: Colors.lightBlue,
                  ),
                ],
              ),
              kHeight5,
              displayDesignation(),
              kHeight5,
              displayRating()
            ],
          ),
          trailing: PopupMenuButton(
            itemBuilder: (context) => <PopupMenuItem<dynamic>>[
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      CompleteProfilePage.routeName,
                    );
                  },
                  child: const Text(
                    'Complete Profile',
                  ),
                ),
              ),
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AddPortfolio.routeName,
                    );
                  },
                  child: const Text(
                    'Add Portfolio',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
