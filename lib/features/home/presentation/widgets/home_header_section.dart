import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
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
  String? location;
  late Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) async {},
      builder: (context, state) {
        Widget displayUserInfo() {
          if (state is SignInSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, ${state.userLoginRes.username ?? 'New User'}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
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
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 14,
                      ),
                      Text(
                        location ?? 'Click to access location',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                )
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        }

        return ColoredBox(
          color: kColorPrimary,
          child: Column(
            children: [
              kHeight50,
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoadSuccess) {
                    child = Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            state.user.user?.profileImage as String,
                          ),
                        ),
                      ),
                    );
                  } else {
                    child = const CircleAvatar(
                      backgroundColor: Colors.white,
                    );
                  }
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    leading: child,
                    title: displayUserInfo(),
                    trailing: BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () async {},
                          icon: const Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                            size: 30,
                          ),
                        );
                      },
                    ),
                  );
                },
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
                    hintText: 'Search here',
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
