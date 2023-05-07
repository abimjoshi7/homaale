import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/complete_profile_page.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/edit_profile_page.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget displayVerify() {
      if (CacheHelper.hasProfile == true) {
        return const Icon(
          Icons.verified,
          color: Colors.lightBlue,
        );
      } else {
        return const SizedBox.shrink();
      }
    }

    PopupMenuItem displayPopupMenu() {
      if (CacheHelper.hasProfile == true) {
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
    }

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state2) {
        if (state2.theStates == TheStates.success) {
          return ListTile(
            leading: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    state2.taskerProfile?.profileImage ?? kServiceImageNImg,
                  ),
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${state2.taskerProfile?.user?.firstName ?? ''} ${state2.taskerProfile?.user?.lastName ?? ''}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    kWidth5,
                    displayVerify(),
                  ],
                ),
                kHeight5,
                // displayDesignation(),
                // kHeight5,
                // 				  Widget displayUserType() {
                //   if (state2 is UserLoadSuccess) {

                //     if (nameList.length == 2) {
                //       return Text(
                //         '${nameList.first} | ${nameList.last}',
                //       );
                //     } else {
                //       return Text(
                //         nameList.first.toString(),
                //       );
                //     }
                //   }
                //   return const Text('Homaale Client/Tasker');
                // }

                // displayUserType(),
                kHeight5,
                Row(
                  children: List.generate(
                    (state2.taskerProfile?.rating?.avgRating as double?)?.round() ?? 5,
                    (index) => const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
            trailing: PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              itemBuilder: (context) => <PopupMenuItem<dynamic>>[
                displayPopupMenu(),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
