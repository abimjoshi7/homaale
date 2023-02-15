import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/pages.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/bookings_page.dart';
import 'package:cipher/features/categories/presentation/cubit/hero_category_cubit.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/home/presentation/pages/home.dart';
import 'package:cipher/features/services/presentation/pages/add_service_page.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
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
    const Page1(),
    const BookingPages(),
    const AccountProfile(),
  ];

  @override
  void initState() {
    context.read<UserBloc>().add(
          UserLoaded(),
        );
    context.read<TaskerPortfolioCubit>().getPortfolio();
    context.read<TaskerExperienceCubit>().getTaskerExperience();
    context.read<TaskerEducationCubit>().getTaskerEducation();
    context.read<TaskerCertificationCubit>().getTaskerCertification();
    context.read<KycBloc>().add(
          KycLoaded(),
        );
    context.read<BookingsBloc>().add(
          ServiceBookingListInitiated(),
        );
    Future.delayed(
      const Duration(microseconds: 10),
      () async => context.read<HeroCategoryCubit>().getHeroCategory(),
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
        setState(() {});
      },
      child: Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: buildMyNavBar(context),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        // borderRadius: BorderRadius.circular(25),
        color: Color(0xff211D4F),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? Image.asset(
                          'assets/bottomNavigationItems/home.png',
                          color: const Color(0xffFFCA6A),
                        )
                      : Image.asset(
                          'assets/bottomNavigationItems/home.png',
                        ),
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    color: pageIndex == 0
                        ? const Color(0xffFFCA6A)
                        : const Color(0xff9CA0C1),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? Image.asset(
                          'assets/bottomNavigationItems/2.png',
                          color: const Color(0xffFFCA6A),
                        )
                      : Image.asset(
                          'assets/bottomNavigationItems/2.png',
                        ),
                ),
                Text(
                  'Search',
                  style: TextStyle(
                    color: pageIndex == 1
                        ? const Color(0xffFFCA6A)
                        : const Color(0xff9CA0C1),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AddServicePage.routeName,
                    );
                  },
                  icon: pageIndex == 2
                      ? Image.asset(
                          'assets/bottomNavigationItems/3.png',
                          color: const Color(0xffFFCA6A),
                        )
                      : Image.asset(
                          'assets/bottomNavigationItems/3.png',
                        ),
                ),
                Text(
                  'Add',
                  style: TextStyle(
                    color: pageIndex == 2
                        ? const Color(0xffFFCA6A)
                        : const Color(0xff9CA0C1),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: pageIndex == 3
                      ? Image.asset(
                          'assets/bottomNavigationItems/1.png',
                          color: const Color(0xffFFCA6A),
                        )
                      : Image.asset(
                          'assets/bottomNavigationItems/1.png',
                        ),
                ),
                Text(
                  'Bookings',
                  style: TextStyle(
                    color: pageIndex == 3
                        ? const Color(0xffFFCA6A)
                        : const Color(0xff9CA0C1),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 4;
                    });
                  },
                  icon: pageIndex == 4
                      ? Image.asset(
                          'assets/bottomNavigationItems/4.png',
                          color: const Color(0xffFFCA6A),
                        )
                      : Image.asset(
                          'assets/bottomNavigationItems/4.png',
                        ),
                ),
                Text(
                  'Account',
                  style: TextStyle(
                    color: pageIndex == 4
                        ? const Color(0xffFFCA6A)
                        : const Color(0xff9CA0C1),
                  ),
                ),
              ],
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

class CustomPaintHelper extends CustomPainter {
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate.shouldRebuildSemantics(oldDelegate);
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(0, 1),
      20,
      Paint(),
    );
    // TODO: implement paint
  }
}
