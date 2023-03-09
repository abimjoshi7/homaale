import 'dart:io' show Platform;
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/tax_calculator/presentation/screens/pages.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/bookings_page.dart';
import 'package:cipher/features/categories/presentation/cubit/hero_category_cubit.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/home/presentation/pages/home.dart';
import 'package:cipher/features/offers/presentation/pages/offers_page.dart';
import 'package:cipher/features/services/presentation/manager/entity_service_bloc.dart';
import 'package:cipher/features/services/presentation/pages/add_service_page.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/post_task_page.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/common_custom_floating_action_button.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({super.key});
  static const routeName = '/root';

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int pageIndex = 0;

  bool homeActive = true;
  bool offerActive = false;
  bool addActive = false;
  bool bookingsActive = false;
  bool profileActive = false;

  final pages = [
    const Home(),
    const OffersPage(),
    const BookingPages(),
    const AccountProfile(),
  ];

  void initBlocs() {
    Future.delayed(
      const Duration(microseconds: 10),
      () async {
        await context
            .read<HeroCategoryCubit>()
            .getHeroCategory()
            .then(
              (value) async =>
                  context.read<TaskerPortfolioCubit>().getPortfolio(),
            )
            .then(
              (value) async =>
                  context.read<TaskBloc>().add(AllTaskLoadInitiated()),
            )
            .then(
              (value) async =>
                  context.read<TaskerExperienceCubit>().getTaskerExperience(),
            )
            .then(
              (value) async =>
                  context.read<TaskerEducationCubit>().getTaskerEducation(),
            )
            .then(
              (value) async => context
                  .read<TaskerCertificationCubit>()
                  .getTaskerCertification(),
            )
            .then(
              (value) async => context.read<UserBloc>().add(
                    UserLoaded(),
                  ),
            )
            .then(
              (value) async => context.read<KycBloc>().add(
                    KycLoaded(),
                  ),
            )
            .then(
              (value) async => context.read<BookingsBloc>().add(
                    ServiceBookingListLoadInitiated(),
                  ),
            )
            .then(
              (value) async => context
                  .read<EntityServiceBloc>()
                  .add(const EntityServiceInitiated()),
            )
            .then(
              (value) async => context.read<TaskerCubit>().loadTaskerList(),
            );
      },
    );
  }

  @override
  void initState() {
    initBlocs();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        if (CacheHelper.hasProfile == false) {
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Welcome To Homaale',
              content: 'Get started by completing your profile',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CompleteProfilePage.routeName,
                );
              },
              isSuccess: true,
            ),
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(
          const Duration(
            microseconds: 1,
          ),
        );
        initBlocs();
      },
      child: Scaffold(
        body: Stack(
          children: [
            pages[pageIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Builder(
                builder: (context) {
                  return Stack(
                    children: [
                      Visibility(
                        visible: !addActive,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.11,
                          width: MediaQuery.of(context).size.width,
                          color: kColorPrimary,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width,
                        child: CustomPaint(
                          painter: BottomNavCustomPainter(),
                          child: Padding(
                            padding: kPadding20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomBottomNavItems(
                                  onPressed: () {
                                    setState(
                                      () {
                                        pageIndex = 0;
                                        homeActive = true;
                                        offerActive = false;
                                        addActive = false;
                                        bookingsActive = false;
                                        profileActive = false;
                                      },
                                    );
                                  },
                                  pageIndex: pageIndex,
                                  index: 0,
                                  label: 'Home',
                                  iconData: Icons.home,
                                  isActive: homeActive,
                                ),
                                CustomBottomNavItems(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 1;
                                      homeActive = false;
                                      offerActive = true;
                                      addActive = false;
                                      bookingsActive = false;
                                      profileActive = false;
                                    });
                                  },
                                  pageIndex: pageIndex,
                                  index: 1,
                                  label: 'Offers',
                                  iconData: Icons.wallet_giftcard_rounded,
                                  isActive: offerActive,
                                ),

                                // commented this lines cause of changes this functionality by applying floating acton button
                                CustomBottomNavItems(
                                  onPressed: () {
                                    if (addActive) {
                                      setState(() {
                                        homeActive = pageIndex == 0;
                                        offerActive = pageIndex == 1;
                                        addActive = false;
                                        bookingsActive = pageIndex == 2;
                                        profileActive = pageIndex == 3;
                                      });
                                    } else {
                                      setState(() {
                                        homeActive = false;
                                        offerActive = false;
                                        addActive = true;
                                        bookingsActive = false;
                                        profileActive = false;
                                      });
                                    }
                                  },
                                  pageIndex: pageIndex,
                                  //random index so that it is not active
                                  index: 5,
                                  label: 'Add',
                                  iconData: Icons.add_circle_outline,
                                  isActive: addActive,
                                ),
                                CustomBottomNavItems(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 2;
                                      homeActive = false;
                                      offerActive = false;
                                      addActive = false;
                                      bookingsActive = true;
                                      profileActive = false;
                                    });
                                  },
                                  pageIndex: pageIndex,
                                  index: 2,
                                  label: 'Bookings',
                                  iconData: Icons.edit_calendar_rounded,
                                  isActive: bookingsActive,
                                ),
                                CustomBottomNavItems(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 3;
                                      homeActive = false;
                                      offerActive = false;
                                      addActive = false;
                                      bookingsActive = false;
                                      profileActive = true;
                                    });
                                  },
                                  pageIndex: pageIndex,
                                  index: 3,
                                  label: 'Profile',
                                  iconData: Icons.account_circle_outlined,
                                  isActive: profileActive,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Visibility(
              visible: addActive,
              child: Positioned(
                bottom: MediaQuery.of(context).size.height * 0.09,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(
                    painter: FloatingOptionsCustomPainter(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: AddPopupButton(
                            label: 'Post a Task',
                            icon: Icons.comment_bank_rounded,
                            callback: () {
                              setState(() {
                                homeActive = pageIndex == 0;
                                offerActive = pageIndex == 1;
                                addActive = false;
                                bookingsActive = pageIndex == 2;
                                profileActive = pageIndex == 3;
                              });
                              Navigator.pushNamed(
                                context,
                                PostTaskPage.routeName,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: AddPopupButton(
                            label: 'Add a Service',
                            icon: Icons.home_repair_service_rounded,
                            callback: () {
                              setState(() {
                                homeActive = pageIndex == 0;
                                offerActive = pageIndex == 1;
                                addActive = false;
                                bookingsActive = pageIndex == 2;
                                profileActive = pageIndex == 3;
                              });
                              Navigator.pushNamed(
                                context,
                                AddServicePage.routeName,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
