// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cipher/core/helpers/search_helper.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/account_view.dart';
import 'package:cipher/features/google_maps/presentation/cubit/user_location_cubit.dart';
import 'package:cipher/features/home/presentation/pages/home.dart';
import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:cipher/features/notification/presentation/pages/notification_home.dart';
import 'package:cipher/features/search/presentation/bloc/search_bloc.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/features/user_location/presentation/choose_location_page.dart';
import 'package:cipher/widgets/widgets.dart';

import '../../../wallet/presentation/bloc/wallet_bloc.dart';

class HomeHeaderSection extends StatefulWidget {
  const HomeHeaderSection({super.key});

  @override
  State<HomeHeaderSection> createState() => _HomeHeaderSectionState();
}

class _HomeHeaderSectionState extends State<HomeHeaderSection> {
  String? location;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) async {},
      builder: (context, state) {
        Widget displayUserInfo() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BlocBuilder<UserBloc, UserState>(
                builder: (context, userState) {
                  if (userState.theStates == TheStates.success) {
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
                      if (value == LocationPermission.always ||
                          value == LocationPermission.whileInUse) {
                        if (!mounted) return;
                        context.read<UserLocationCubit>().removeTempLocation();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChooseLocationPage(),
                            ));
                      }
                    },
                  );
                  // await Geolocator.getCurrentPosition().then((value) async {
                  //   await cacheUserLocation(LatLng(value.latitude, value.longitude));
                  // });
                },
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 14,
                    ),
                    BlocBuilder<UserLocationCubit, UserLocationState>(
                      builder: (_, userLocationState) {
                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 20.0,
                            maxWidth: MediaQuery.of(context).size.width * 0.55,
                          ),
                          child: AutoSizeText(
                            userLocationState.address ??
                                'Click to access location',
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 12.0,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontSize: 13.0),
                          ),
                        );
                      },
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 16,
                    )
                  ],
                ),
              )
            ],
          );
        }

        return ColoredBox(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: <Widget>[
              kHeight50,
              BlocBuilder<UserBloc, UserState>(
                builder: (context, userState) {
                  if (userState.theStates == TheStates.success) {
                    child = Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: (CacheHelper.isLoggedIn)
                              ? NetworkImage(
                                  userState.taskerProfile?.profileImage ??
                                      kDefaultAvatarNImg,
                                )
                              : NetworkImage(
                                  kDefaultAvatarNImg,
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
                    leading: _buildAccountAvatar(context),
                    title: displayUserInfo(),
                    trailing: _buildNotificationIcon(),
                  );
                },
              ),
              _buildSearchBox(),
            ],
          ),
        );
      },
    );
  }

  InkWell _buildAccountAvatar(BuildContext context) {
    return InkWell(
      onTap: () {
        if (CacheHelper.isLoggedIn) {
          context.read<WalletBloc>().add(WalletLoaded());
          Navigator.pushNamed(
            context,
            AccountView.routeName,
          );
        } else {
          return;
        }
      },
      child: child,
    );
  }

  BlocBuilder<NotificationBloc, NotificationState> _buildNotificationIcon() {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        if (state.notificationStatus == NotificationStatus.success) {
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
                    child: CommonShowCase(
                      position: TooltipPosition.bottom,
                      showKey: Home.notificationKey,
                      showCaseTitle: 'Notifications',
                      showCaseDec: 'See all notifications from here.',
                      child: Icon(
                        (CacheHelper.isLoggedIn)
                            ? Icons.notifications_none
                            : Icons.notifications_off_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                if (CacheHelper.isLoggedIn)
                  state.allNotificationList.unreadCount != null &&
                          state.allNotificationList.unreadCount != 0
                      ? Positioned(
                          right: 13,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            child: Center(
                              child: Text(
                                state.allNotificationList.unreadCount
                                    .toString(),
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
        }
        return SizedBox(
          width: 50,
          height: 40,
          child: Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 30,
          ),
        );
      },
    );
  }

  Widget _buildSearchBox() {
    return Padding(
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
          prefixWidget: Icon(
            Icons.search,
            color: Colors.black45,
          ),
          hintText: 'Search here',
          hintStyle: TextStyle(color: Colors.black45),
          onTap: () async => await showSearch(
            context: context,
            delegate: SearchHelper(
              context: context,
              searchBloc: locator<SearchBloc>(),
            ),
          ),
        ),
      ),
    );
  }
}
