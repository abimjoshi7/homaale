import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
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
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) async {},
      builder: (context, state) {
        Widget displayUserInfo() {
          if (state is SignInWithEmailSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi, ${state.userLoginRes.username}'),
                kHeight5,
                InkWell(
                  onTap: () async {
                    await Geolocator.checkPermission().then(
                      (value) async {
                        if (value == LocationPermission.denied ||
                            value == LocationPermission.deniedForever ||
                            value == LocationPermission.unableToDetermine) {
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

                    await Geolocator.getCurrentPosition().then((value) async {
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
            );
          } else if (state is SignInWithPhoneSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi, ${state.userLoginRes.username}'),
                kHeight5,
                InkWell(
                  onTap: () async {
                    await Geolocator.checkPermission().then(
                      (value) async {
                        if (value == LocationPermission.denied ||
                            value == LocationPermission.deniedForever ||
                            value == LocationPermission.unableToDetermine) {
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

                    await Geolocator.getCurrentPosition().then((value) async {
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
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Text('Hi, User');
          }
        }

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
                title: displayUserInfo(),
                trailing: BlocBuilder<UserDataCubit, UserDataState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () async {
                        final x =
                            await CacheHelper.getCachedString(kAccessTokenP);
                        final x1 =
                            await CacheHelper.getCachedString(kAccessToken);
                        log(x.toString());
                        log(x1.toString());
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
              ),
            ],
          ),
        );
      },
    );
  }
}
