import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:cipher/features/notification/presentation/pages/notification_from_home.dart';
import 'package:cipher/features/search/presentation/pages/search_page.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) async {},
      builder: (context, state) {
        Widget displayUserInfo() {
          if (state.theStates == TheStates.success) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                    if (state.theStates == TheStates.success) {
                      return Text(
                        'Hi, ${(!CacheHelper.isLoggedIn) ? 'how are you doing today?' : userState.taskerProfile?.fullName ?? state.userLoginRes?.username ?? 'New User'}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      );
                    }
                    return Text(
                      'Hi, ${(!CacheHelper.isLoggedIn) ? 'how are you doing today?' : state.userLoginRes?.username ?? 'New User'}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
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
                            location = '${value.first.locality}, ${value.first.subAdministrativeArea}';
                            location = '${value.first.locality}, ${value.first.subAdministrativeArea}';
                          },
                        ),
                      );
                    });
                  },
                  child: Row(
                    children: <Widget>[
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
            return const Center(
              child: CardLoading(
                height: 200,
              ),
            );
          }
        }

        return ColoredBox(
          color: kColorPrimary,
          child: Column(
            children: <Widget>[
              kHeight50,
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state.theStates == TheStates.success) {
                    child = Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            state.taskerProfile?.profileImage ?? kServiceImageNImg,
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
                    trailing: BlocBuilder<NotificationBloc, NotificationState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: 50,
                          height: 40,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 5,
                                child: InkWell(
                                  onTap: () {
                                    (CacheHelper.isLoggedIn)
                                        ? Navigator.pushNamed(
                                            context,
                                            NotificationFromHome.routeName,
                                          )
                                        : null;
                                  },
                                  child: Icon(
                                    (CacheHelper.isLoggedIn)
                                        ? Icons.notifications_none
                                        : Icons.notifications_off_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              state.allNotificationList?.unreadCount != null &&
                                      state.allNotificationList?.unreadCount != 0
                                  ? Positioned(
                                      right: 13,
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                                        child: Center(
                                          child: Text(
                                            state.allNotificationList?.unreadCount.toString() ?? "0",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: CustomTextFormField(
                    readOnly: true,
                    prefixWidget: Icon(Icons.search),
                    hintText: 'Search here',
                    onTap: () => Navigator.pushNamed(
                      context,
                      SearchPage.routeName,
                    ),
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
