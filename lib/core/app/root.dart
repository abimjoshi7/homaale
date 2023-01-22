import 'package:cipher/features/account_settings/presentation/pages/pages.dart';
import 'package:cipher/features/home/presentation/pages/home.dart';
import 'package:flutter/material.dart';

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
    const Page1(),
    const AccountProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        // borderRadius: BorderRadius.circular(25),
        color: Color(0xff211D4F),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
