import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:cipher/networking/models/request/tasker_profile_create_req.dart';
import 'package:cipher/networking/models/tasker_user_data.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeHeaderSection extends StatefulWidget {
  const HomeHeaderSection({
    super.key,
  });

  @override
  State<HomeHeaderSection> createState() => _HomeHeaderSectionState();
}

class _HomeHeaderSectionState extends State<HomeHeaderSection> {
  String? location = 'Buddhanagar, Kathmandu';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInCubitState>(
      listener: (context, state) async {
        if (state is SignInSuccess) {}
      },
      builder: (context, state) {
        if (state is SignInSuccess) {
          return ColoredBox(
            color: const Color(0xff3D3F7D),
            child: Column(
              children: [
                kHeight50,
                ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Profile.routeName,
                      );
                    },
                    child: const CircleAvatar(),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi, ${state.userLoginRes.username ?? 'User'}'),
                      kHeight5,
                      InkWell(
                        onTap: () async {
                          await Geolocator.checkPermission().then(
                            (value) async {
                              if (value == LocationPermission.denied ||
                                  value == LocationPermission.deniedForever ||
                                  value ==
                                      LocationPermission.unableToDetermine) {
                                await Geolocator.requestPermission();
                                if (!mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please provide location access from app settings.',
                                    ),
                                  ),
                                );
                              }
                            },
                          );

                          await Geolocator.getCurrentPosition()
                              .then((value) async {
                            await placemarkFromCoordinates(
                              value.latitude,
                              value.longitude,
                            ).then(
                              (value) => setState(
                                () {
                                  location =
                                      '${value.first.locality}, ${value.first.subAdministrativeArea}';
                                },
                              ),
                            );
                          });
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.location_on_outlined),
                            Text(location!),
                            // const Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      )
                    ],
                  ),
                  trailing: BlocBuilder<UserDataCubit, UserDataState>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () async {
                          final x =
                              await CacheHelper.getCachedString(kAccessTokenP);
                          log(x.toString());
                          final user = TaskerProfileCreateReq(
                            firstName: 'James',
                            middleName: '',
                            lastName: 'Hetfield',
                            bio: 'LEGEND. Everyone take a bow.',
                            gender: 'Male',
                            skill: 'Frontman',
                            dateOfBirth: DateTime.parse('2000-02-27'),
                            activeHourStart: '12:30',
                            activeHourEnd: '22:00',
                            experienceLevel: 'Expert',
                            userType: 'Client',
                            hourlyRate: 121,
                            profileVisibility: 'Private',
                            taskPreferences: 'full-time',
                            addressLine1: 'new york, usa',
                            chargeCurrency: 'NPR',
                            remainingPoints: 0,
                            points: 0,
                            followingCount: 0,
                          );
                          // await context
                          //     .read<UserDataCubit>()
                          //     .postTaskerUserData(user);
                          await context
                              .read<UserDataCubit>()
                              .getTaskerUserData();
                        },
                        icon: const Icon(
                          Icons.notifications_none,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    child: const CustomTextFormField(
                      prefixWidget: Icon(Icons.search),
                      hintText: 'search here',
                    ),
                  ),
                )
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
