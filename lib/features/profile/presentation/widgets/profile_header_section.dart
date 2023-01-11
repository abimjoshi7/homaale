import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
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
        if (state is UserDataLoadSuccess) {
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
                    Text(
                      '${state.userData.user!.firstName!} ${state.userData.user!.lastName!}',
                    ),
                    kWidth5,
                    if (true == state.userData.isProfileVerified)
                      const Icon(
                        Icons.verified,
                        color: Colors.lightBlue,
                      )
                  ],
                ),
                kHeight5,
                Text(state.userData.designation.toString()),
                kHeight5,
                Row(
                  children: List.generate(
                    5,
                    (index) => const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                  ),
                )
              ],
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) => <PopupMenuItem<dynamic>>[
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {},
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
            // IconButton(
            //   icon: const Icon(
            //     Icons.more_vert_outlined,
            //   ),
            //   onPressed: () {

            //   },
            // ),
          );
        } else {
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
                  children: const [
                    Text('FirstName LastName'),
                    kWidth5,
                    Icon(
                      Icons.verified,
                      color: Colors.lightBlue,
                    ),
                  ],
                ),
                kHeight5,
                const Text('Individual  |  Gardener'),
                kHeight5,
                Row(
                  children: List.generate(
                    5,
                    (index) => const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                  ),
                )
              ],
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) => <PopupMenuItem<dynamic>>[
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {},
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
            // IconButton(
            //   icon: const Icon(
            //     Icons.more_vert_outlined,
            //   ),
            //   onPressed: () {

            //   },
            // ),
          );
        }
      },
    );
  }
}
