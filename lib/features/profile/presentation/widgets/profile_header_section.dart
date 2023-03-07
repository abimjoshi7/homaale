import 'dart:convert';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/complete_profile_page.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/edit_profile_page.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        PopupMenuItem displayPopupMenu() {
          if (state is SignInSuccess) {
            if (state.userLoginRes.hasProfile == true) {
              return PopupMenuItem(
                onTap: () async {
                  await Future.delayed(const Duration(milliseconds: 10)).then(
                    (value) => Navigator.pushNamed(
                      context,
                      EditProfilePage.routeName,
                    ),
                  );
                },
                child: const Text(
                  'Edit Profile',
                ),
              );
            } else {
              return PopupMenuItem(
                onTap: () async {
                  await Future.delayed(const Duration(milliseconds: 10)).then(
                    (value) => Navigator.pushNamed(
                      context,
                      CompleteProfilePage.routeName,
                    ),
                  );
                },
                child: const Text(
                  'Complete Profile',
                ),
              );
            }
          } else {
            return const PopupMenuItem(child: SizedBox.shrink());
          }
        }

        return BlocBuilder<UserBloc, UserState>(
          builder: (context, state2) {
            Widget displayName() {
              if (state2 is UserLoadSuccess) {
                return Text(
                  '${state2.user.user?.firstName ?? ''} ${state2.user.user?.lastName ?? ''}',
                  style: kPurpleText16,
                );
              } else {
                return const Text('New User');
              }
            }

            Widget displayProfilePic() {
              if (state2 is UserLoadSuccess) {
                return Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        state2.user.profileImage as String,
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
              if (state2 is UserLoadSuccess) {
                return Row(
                  children: List.generate(
                    (state2.user.rating?.avgRating as double?)?.round() ?? 5,
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

            Widget displayVerify() {
              if (state is SignInSuccess) {
                if (state.userLoginRes.isVerified == true) {
                  return const Icon(
                    Icons.verified,
                    color: Colors.lightBlue,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              } else {
                return const SizedBox.shrink();
              }
            }

            Widget displayUserType() {
              if (state2 is UserLoadSuccess) {
                final List<dynamic> nameList =
                    jsonDecode(state2.user.userType ?? '[Client, Tasker]')
                        as List<dynamic>;
                if (nameList.length == 2) {
                  return Text(
                    '${nameList.first} | ${nameList.last}',
                  );
                } else {
                  return Text(
                    nameList.first.toString(),
                  );
                }

                // return Text(
                //   state2.user.userType
                //           ?.replaceAll(RegExp(r"\p{P}", unicode: true), "\t") ??
                //       '',
                //   // style: kText15,
                // );
              }
              return const Text('Homaale Client/Tasker');
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
                      displayVerify(),
                    ],
                  ),
                  kHeight5,
                  // displayDesignation(),
                  // kHeight5,
                  displayUserType(),
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
