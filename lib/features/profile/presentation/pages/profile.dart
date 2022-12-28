import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_portfolio.dart';
import 'package:cipher/features/profile/presentation/pages/about/about_profile.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/icontext.dart';
import 'package:cipher/features/profile/presentation/pages/activites/activities_profile.dart';
import 'package:cipher/features/profile/presentation/pages/documents/documents_profile.dart';
import 'package:cipher/features/profile/presentation/pages/offers/offers_profile.dart';
import 'package:cipher/features/profile/presentation/pages/reviews/reviews_profile.dart';
import 'package:cipher/features/profile/presentation/pages/rewards/rewards_profile.dart';
import 'package:cipher/features/profile/presentation/pages/services/services_profile.dart';
import 'package:cipher/features/profile/presentation/widgets/number_count_text.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static const routeName = '/profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController tabController;
  final user = 'self';
  bool isKycVerified = false;

  @override
  void initState() {
    tabController = TabController(length: user == 'self' ? 7 : 4, vsync: this);
    // tabController.addListener(() {
    //   setState(() {
    //     selectedIndex = tabController.index;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  const Text('Profile'),
                  IconButton(
                    onPressed: () async {
                      try {} catch (e) {
                        rethrow;
                      }
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
              const CustomHorizontalDivider(),
              ListTile(
                leading: Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text('FirstName LastName'),
                        kWidth5,
                        Icon(
                          Icons.verified,
                          color: Colors.lightBlue,
                        ),
                      ],
                    ),
                    kHeight5,
                    const Text('Individual  |  Gardener'),
                    kHeight5,
                    Visibility(
                      visible: user != 'self',
                      child: Row(
                        children: List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.more_vert_outlined,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AddPortfolio.routeName,
                    );
                  },
                ),
              ),
              kHeight10,
              Visibility(
                visible: user == 'self',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 150,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '0',
                                style: kHeading2,
                              ),
                              kHeight5,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: IconText(
                                  label: 'Reward Points',
                                  widget: Image.asset(
                                    'assets/3.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: 150,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Rs 0.00',
                                style: kHeading2,
                              ),
                              kHeight5,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: IconText(
                                  label: 'Account Balance',
                                  widget: Image.asset(
                                    'assets/1.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              kHeight10,
              const CustomHorizontalDivider(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        NumberCountText(
                          numberText: '400',
                          textColor: kColorBlueText,
                        ),
                        Text('Task Created')
                      ],
                    ),
                    Column(
                      children: const [
                        NumberCountText(
                          numberText: '30',
                          textColor: kColorAmberText,
                        ),
                        Text('Task in Progress')
                      ],
                    ),
                    Column(
                      children: const [
                        NumberCountText(
                          numberText: '400',
                          textColor: kColorGreenText,
                        ),
                        Text('Success Rate')
                      ],
                    ),
                  ],
                ),
              ),
              const CustomHorizontalDivider(),
              Visibility(
                visible: isKycVerified == false,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    decoration: const BoxDecoration(
                      color: Color(0xffFFF5E5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.info_outline_rounded,
                                size: 20,
                                color: Colors.amber,
                              ),
                              kWidth5,
                              Text('Get your KYC verified now'),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TabBar(
                isScrollable: true,
                labelColor: Colors.amber,
                indicatorColor: Colors.amber,
                unselectedLabelColor: Colors.grey,
                controller: tabController,
                tabs: const [
                  Tab(
                    text: 'About',
                  ),
                  Tab(
                    text: 'Services',
                  ),
                  Tab(
                    text: 'Documents',
                  ),
                  Tab(
                    text: 'Activities',
                  ),
                  Tab(
                    text: 'Rewards',
                  ),
                  Tab(
                    text: 'My Offers',
                  ),
                  Tab(
                    text: 'Reviews',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQueryHelper.theHeight(context) * 0.42,
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    AboutProfile(),
                    ServicesProfile(),
                    DocumentsProfile(),
                    ActivitiesProfile(),
                    RewardsProfile(),
                    OffersProfile(),
                    ReviewsProfile(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
