import 'dart:async';
import 'package:cipher/core/app/initial_data_fetch.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/kyc_constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/profile.dart';
import 'package:cipher/features/bookings/presentation/pages/my_bookings_page.dart';
import 'package:cipher/features/box/presentation/pages/box.dart';
import 'package:cipher/features/error_pages/no_internet_page.dart';
import 'package:cipher/features/home/presentation/pages/home.dart';
import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:cipher/features/services/presentation/pages/post_service_page.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/features/task/presentation/pages/post_task_page.dart';
import 'package:cipher/features/user_suspend/presentation/bloc/user_suspend_state.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../features/categories/presentation/pages/sections/categories_section.dart';
import '../../features/user_suspend/presentation/bloc/user_suspend_bloc.dart';
import '../../features/user_suspend/presentation/pages/account_suspend_custom_tost.dart';
import '../network_info/network_bloc.dart';
import '../network_info/network_event.dart';

class Root extends StatefulWidget {
  static const routeName = '/root';

  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  bool enableShowcase = false;

  @override
  void initState() {
    super.initState();
    checkShowcase();
  }

  void checkShowcase() async {
    final showcase = await CacheHelper.getCachedString(kShowcase) ?? 'not-shown';
    if (showcase == 'not-shown') {
      setState(() {
        enableShowcase = true;
      });
    } else {
      setState(() {
        enableShowcase = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return ShowCaseWidget(
      onFinish: () {
        CacheHelper.setCachedString(kShowcase, 'done');
      },
      autoPlay: true,
      enableShowcase: enableShowcase,
      builder: Builder(
        builder: (context) => CalledRootClass(
          showcase: enableShowcase,
          passedIndex: routeArgs?["index"] as int?,
        ),
      ),
    );
  }
}

class CalledRootClass extends StatefulWidget {
  const CalledRootClass({Key? key, required this.showcase, this.passedIndex}) : super(key: key);
  final bool showcase;
  final int? passedIndex;

  @override
  State<CalledRootClass> createState() => _CalledRootClassState();
}

Future notLoggedInPopUp(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => CustomToast(
      heading: 'Attention',
      content: 'But first log in or register.',
      isSuccess: true,
      buttonLabel: 'Log in',
      onTap: () => Navigator.pushNamedAndRemoveUntil(
        context,
        SignInPage.routeName,
        (route) => false,
      ),
    ),
  );
}

class _CalledRootClassState extends State<CalledRootClass> with SingleTickerProviderStateMixin {
  int pageIndex = 0;

  bool homeActive = true;
  bool boxActive = false;
  bool addActive = false;
  bool bookingsActive = false;
  bool profileActive = false;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();
  final GlobalKey _six = Home.notificationKey;
  final GlobalKey _seven = CategoriesSection.catKey;
  final GlobalKey _eight = TrendingServicesSection.pServiceKey;
  final GlobalKey _nine = TasksRecommendationSection.taskRecoSection;
  final scrollController = ScrollController();

  final pages = <Widget>[
    const Home(),
    const BoxPage(),
    const MyBookingsPage(),
    const AccountSettings(),
  ];

  void initBlocs() {
    if (CacheHelper.isLoggedIn) {
      context.read<NotificationBloc>().add(MyNotificationListInitiated());
    }
    if (widget.passedIndex == null) return;
    switch (widget.passedIndex) {
      case 0:
        homeActive = true;
        boxActive = false;
        addActive = false;
        bookingsActive = false;
        profileActive = false;
        break;
      case 1:
        homeActive = false;
        boxActive = true;
        addActive = false;
        bookingsActive = false;
        profileActive = false;
        break;
      case 2:
        homeActive = false;
        boxActive = false;
        addActive = true;
        bookingsActive = false;
        profileActive = false;
        break;
      case 3:
        homeActive = false;
        boxActive = false;
        addActive = false;
        bookingsActive = true;
        profileActive = false;
        break;
      case 4:
        homeActive = false;
        boxActive = false;
        addActive = false;
        bookingsActive = false;
        profileActive = true;
        break;
      default:
    }
  }

  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  getConnectivity() => subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );
  // bool canback = false;
  Future<bool> _onWillPop() async {
    if (homeActive == true) {
      showCupertinoDialog<String>(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Do you want to exit App ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        pageIndex = 0;
        homeActive = true;
        boxActive = false;
        addActive = false;
        bookingsActive = false;
        profileActive = false;
      });
    }
    Timer(Duration(seconds: 1), () {
      setState(() {
        homeActive = true;
      });
    });
    return false;
  }

  int _assignPageIndexValue(int? passedIndex) {
    if (passedIndex == null) return 0;
    if (passedIndex >= 3) return passedIndex - 1;
    return passedIndex;
  }

  @override
  void initState() {
    initBlocs();
    pageIndex = _assignPageIndexValue(widget.passedIndex);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        getConnectivity();
        if (CacheHelper.hasProfile == false) {
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: CustomToast(
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
            ),
          );
        }
      },
    );
    if (widget.showcase) {
      startShowCase();
    }
    super.initState();
  }

  startShowCase() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ShowCaseWidget.of(context).startShowCase([_one, _two, _three, _four, _five, _six, _seven, _eight, _nine]);
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    scrollController.dispose();
    super.dispose();
  }

  showDialogBox() => showCupertinoDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: CupertinoAlertDialog(
            title: const Text('No Connection'),
            content: const CommonErrorContainer(
              assetsPath: 'assets/no_internet_connection.png',
              errorTile: 'Oops, No Internet Connection.',
              errorDes: "Make sure Wi-Fi or cellular data is turned on and then try again.",
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'Cancel');
                  setState(() => isAlertSet = false);
                  isDeviceConnected = await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected && isAlertSet == false) {
                    showDialogBox();
                    setState(() => isAlertSet = true);
                  }
                },
                child: const Text('Try Again !'),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        initBlocs();
        initialFetch(context);
      },
      child: BlocProvider(
        create: (context) => NetworkBloc()..add(NetworkObserve()),
        child: WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            key: _scaffoldkey,
            body: Stack(
              children: <Widget>[
                pages[pageIndex],
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Builder(builder: (context) {
                    return Stack(
                      children: <Widget>[
                        Visibility(
                          visible: !addActive,
                          child: Container(
                            // margin: const EdgeInsets.symmetric(horizontal: 50),
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 78,
                          width: MediaQuery.of(context).size.width,
                          child: CustomPaint(
                            painter: BottomNavCustomPainter(color: Theme.of(context).primaryColor),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CustomBottomNavItems(
                                    showCaseTitle: 'Home',
                                    showCaseDec: 'Tap “Home” to see all details.',
                                    showKey: _one,
                                    onPressed: () {
                                      setState(
                                        () {
                                          pageIndex = 0;
                                          homeActive = true;
                                          boxActive = false;
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
                                    showCaseTitle: 'Box',
                                    showCaseDec: 'Tap “Box” to view your Bookings Payments list. ',
                                    showKey: _two,
                                    onPressed: () {
                                      if (CacheHelper.isLoggedIn == false) {
                                        notLoggedInPopUp(context);
                                      }
                                      if (CacheHelper.isLoggedIn) {
                                        setState(() {
                                          pageIndex = 1;
                                          homeActive = false;
                                          boxActive = true;
                                          addActive = false;
                                          bookingsActive = false;
                                          profileActive = false;
                                        });
                                      }
                                    },
                                    pageIndex: pageIndex,
                                    index: 1,
                                    label: 'Box',
                                    iconData: Icons.shopping_basket_outlined,
                                    isActive: boxActive,
                                  ),
                                  CustomBottomNavItems(
                                    showCaseTitle: 'Add',
                                    showCaseDec: 'Tap “Add” to add your tasks & services.',
                                    showKey: _three,
                                    onPressed: () {
                                      // if (CacheHelper.isLoggedIn == false) {
                                      //   notLoggedInPopUp(context);
                                      // }
                                      // if (CacheHelper.isLoggedIn == false) return;
                                      if (addActive) {
                                        setState(() {
                                          homeActive = pageIndex == 0;
                                          boxActive = pageIndex == 1;
                                          addActive = false;
                                          bookingsActive = pageIndex == 2;
                                          profileActive = pageIndex == 3;
                                        });
                                      } else {
                                        setState(() {
                                          homeActive = false;
                                          boxActive = false;
                                          addActive = true;
                                          bookingsActive = false;
                                          profileActive = false;
                                        });
                                      }
                                    },
                                    pageIndex: pageIndex,
                                    //random index so that it is not active
                                    index: 5,
                                    label: 'Post',
                                    iconData: Icons.add_circle_outline,
                                    isActive: addActive,
                                  ),
                                  CustomBottomNavItems(
                                    showCaseTitle: 'Bookings',
                                    showCaseDec: 'Tap “Bookings” to book services.',
                                    showKey: _four,
                                    onPressed: () {
                                      if (CacheHelper.isLoggedIn == false) {
                                        notLoggedInPopUp(context);
                                      }
                                      if (CacheHelper.isLoggedIn) {
                                        setState(() {
                                          pageIndex = 2;
                                          homeActive = false;
                                          boxActive = false;
                                          addActive = false;
                                          bookingsActive = true;
                                          profileActive = false;
                                        });
                                      }
                                    },
                                    pageIndex: pageIndex,
                                    index: 2,
                                    label: 'Bookings',
                                    iconData: Icons.edit_calendar_rounded,
                                    isActive: bookingsActive,
                                  ),
                                  CustomBottomNavItems(
                                    showCaseTitle: 'Profile',
                                    showCaseDec: 'Tap “Profile” to setup your account.',
                                    showKey: _five,
                                    onPressed: () {
                                      if (CacheHelper.isLoggedIn == false) {
                                        notLoggedInPopUp(context);
                                      }
                                      if (CacheHelper.isLoggedIn) {
                                        setState(() {
                                          pageIndex = 3;
                                          homeActive = false;
                                          boxActive = false;
                                          addActive = false;
                                          bookingsActive = false;
                                          profileActive = true;
                                        });
                                      }
                                    },
                                    pageIndex: pageIndex,
                                    index: 3,
                                    label: 'Account',
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
                  }),
                ),
                BlocBuilder<UserSuspendBloc, UserSuspendState>(builder: (context, stateUS) {
                  return Visibility(
                    visible: addActive,
                    child: Positioned(
                      bottom: 70,
                      child: SizedBox(
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        child: CustomPaint(
                          painter: FloatingOptionsCustomPainter(color: Theme.of(context).primaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              AddPopupButton(
                                label: '  Post a Task',
                                icon: Icons.comment_bank_rounded,
                                callback: () {
                                  if (CacheHelper.isLoggedIn == false) {
                                    notLoggedInPopUp(context);
                                  }
                                  if (CacheHelper.isLoggedIn == false) return;
                                  if (CacheHelper.isKycVerified == false) notVerifiedPopup(context);
                                  if (CacheHelper.isKycVerified == false) return;
                                  setState(() {
                                    homeActive = pageIndex == 0;
                                    boxActive = pageIndex == 1;
                                    addActive = false;
                                    bookingsActive = pageIndex == 2;
                                    profileActive = pageIndex == 3;
                                  });
                                  (stateUS.userAccountSuspension?.isSuspended == true)
                                      ? showDialog(
                                          context: context,
                                          builder: (context) => AccountSuspendCustomToast(
                                            heading: 'ACCOUNT SUSPENDED',
                                            content: 'User is suspended',
                                          ),
                                        )
                                      : Navigator.pushNamed(
                                          context,
                                          PostTaskPage.routeName,
                                        );
                                },
                              ),
                              addHorizontalSpace(55),
                              AddPopupButton(
                                label: 'Post a Service ',
                                icon: Icons.home_repair_service_rounded,
                                callback: () {
                                  if (CacheHelper.isLoggedIn == false) {
                                    notLoggedInPopUp(context);
                                  }
                                  if (CacheHelper.isLoggedIn == false) return;
                                  if (CacheHelper.isKycVerified == false) {
                                    notVerifiedPopup(context);
                                  }
                                  if (CacheHelper.isKycVerified == false) return;
                                  setState(() {
                                    homeActive = pageIndex == 0;
                                    boxActive = pageIndex == 1;
                                    addActive = false;
                                    bookingsActive = pageIndex == 2;
                                    profileActive = pageIndex == 3;
                                  });
                                  (stateUS.userAccountSuspension?.isSuspended == true)
                                      ? showDialog(
                                          context: context,
                                          builder: (context) => AccountSuspendCustomToast(
                                            heading: 'ACCOUNT SUSPENDED',
                                            content: 'User is suspended',
                                          ),
                                        )
                                      : Navigator.pushNamed(
                                          context,
                                          PostServicePage.routeName,
                                        );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
