import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/paddings.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/account_profile.dart';
import 'package:cipher/features/bookings/presentation/pages/bookings_page.dart';
import 'package:cipher/features/home/presentation/pages/home.dart';
import 'package:cipher/features/offers/presentation/pages/offers_page.dart';
import 'package:cipher/features/services/presentation/pages/add_service_page.dart';
import 'package:cipher/features/task/presentation/pages/post_task_page.dart';
import 'package:cipher/widgets/add_pop_up_button.dart';
import 'package:cipher/widgets/custom_bottom_nav_items.dart';
import 'package:cipher/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';


class CommonNavigationBar extends StatefulWidget {
  const CommonNavigationBar({super.key});

  @override
  State<CommonNavigationBar> createState() => _CommonNavigationBarState();
}

class _CommonNavigationBarState extends State<CommonNavigationBar> {
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

  @override
  Widget build(BuildContext context) {
    return  Stack(
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
    );
  }
}
