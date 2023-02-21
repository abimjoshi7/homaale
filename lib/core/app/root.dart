import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/tax_calculator/presentation/screens/pages.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/bookings_page.dart';
import 'package:cipher/features/categories/presentation/cubit/hero_category_cubit.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/home/presentation/pages/home.dart';
import 'package:cipher/features/services/presentation/manager/professional_service_bloc/professional_service_bloc.dart';
import 'package:cipher/features/services/presentation/pages/add_service_page.dart';
import 'package:cipher/features/task/presentation/pages/post_task_page.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Root extends StatefulWidget {
  const Root({super.key});
  static const routeName = '/root';

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int pageIndex = 0;

  final pages = [
    const Home(),
    const Page1(),
    const SizedBox.shrink(),
    const BookingPages(),
    const AccountProfile(),
  ];

  void initBlocs() {
    Future.delayed(
      const Duration(microseconds: 10),
      () async {
        await context.read<HeroCategoryCubit>().getHeroCategory();
        await context.read<TaskerPortfolioCubit>().getPortfolio();
        await context.read<TaskerExperienceCubit>().getTaskerExperience();
        await context.read<TaskerEducationCubit>().getTaskerEducation();
        await context.read<TaskerCertificationCubit>().getTaskerCertification();
        context.read<UserBloc>().add(
              UserLoaded(),
            );
        context.read<KycBloc>().add(
              KycLoaded(),
            );
        context.read<BookingsBloc>().add(
              ServiceBookingListInitiated(),
            );
        context.read<ProfessionalServiceBloc>().add(
              ProfessionalLoadInitated(),
            );
      },
    );
  }

  @override
  void initState() {
    initBlocs();
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
                        visible: pageIndex != 2,
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
                                      },
                                    );
                                  },
                                  pageIndex: pageIndex,
                                  index: 0,
                                  label: 'Home',
                                  iconData: Icons.home,
                                ),
                                CustomBottomNavItems(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 1;
                                    });
                                  },
                                  pageIndex: pageIndex,
                                  index: 1,
                                  label: 'Search',
                                  iconData: Icons.search,
                                ),
                                CustomBottomNavItems(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 2;
                                    });
                                  },
                                  pageIndex: pageIndex,
                                  index: 2,
                                  label: 'Add',
                                  iconData: Icons.add_circle_outline_rounded,
                                ),
                                CustomBottomNavItems(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 3;
                                    });
                                  },
                                  pageIndex: pageIndex,
                                  index: 3,
                                  label: 'Bookings',
                                  iconData: Icons.collections_bookmark_outlined,
                                ),
                                CustomBottomNavItems(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 4;
                                    });
                                  },
                                  pageIndex: pageIndex,
                                  index: 4,
                                  label: 'Account',
                                  iconData:
                                      Icons.miscellaneous_services_rounded,
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
              visible: pageIndex == 2,
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
                        AddPopupButton(
                          label: 'Post a Task',
                          icon: Icons.comment_bank_rounded,
                          callback: () {
                            Navigator.pushNamed(
                              context,
                              PostTaskPage.routeName,
                            );
                          },
                        ),
                        addHorizontalSpace(40),
                        AddPopupButton(
                          label: 'Add a Service',
                          icon: Icons.home_repair_service_rounded,
                          callback: () {
                            Navigator.pushNamed(
                              context,
                              AddServicePage.routeName,
                            );
                          },
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

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          'Page Number 1',
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
