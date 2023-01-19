import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/complete_profile_page.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/edit_profile_page.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        PopupMenuItem displayPopupMenu() {
          if (state is SignInWithEmailSuccess) {
            if (state.userLoginRes.hasProfile == true) {
              return PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      EditProfilePage.routeName,
                    );
                  },
                  child: const Text(
                    'Edit Profile',
                  ),
                ),
              );
            }
          }

          if (state is SignInWithPhoneSuccess) {
            if (state.userLoginRes.hasProfile == true) {
              return PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      EditProfilePage.routeName,
                    );
                  },
                  child: const Text(
                    'Edit Profile',
                  ),
                ),
              );
            }
          }

          return PopupMenuItem(
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
          );
        }

        return BlocBuilder<UserDataCubit, UserDataState>(
          builder: (context, state2) {
            Widget displayName() {
              if (state2 is UserDataLoadSuccess) {
                return Text(
                  '${state2.userData.user!.firstName!} ${state2.userData.user!.lastName!}',
                );
              } else {
                return const Text('FirstName LastName');
              }
            }

            Widget displayDesignation() {
              if (state2 is UserDataLoadSuccess) {
                return Text(
                  state2.userData.designation.toString(),
                );
              } else {
                return const Text('Individual | Homaale User');
              }
            }

            Widget displayProfilePic() {
              if (state2 is UserDataLoadSuccess) {
                return Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        state2.userData.profileImage as String,
                      ),
                    ),
                  ),
                );
              } else {
                return Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                );
              }
            }

            Widget displayRating() {
              if (state2 is UserDataLoadSuccess) {
                return Row(
                  children: List.generate(
                    state2.userData.rating!.userRatingCount!,
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
              leading: displayProfilePic(),
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
                  displayPopupMenu(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
