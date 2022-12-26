import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/about_profile.dart';
import 'package:cipher/features/profile/presentation/pages/documents/documents_profile.dart';
import 'package:cipher/features/profile/presentation/pages/reviews/reviews_profile.dart';
import 'package:cipher/features/profile/presentation/pages/services/services_profile.dart';
import 'package:cipher/features/profile/presentation/widgets/number_count_text.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static const routeName = "/profile";
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
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
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  Text("Profile"),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
              CustomHorizontalDivider(),
              ListTile(
                leading: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent, shape: BoxShape.circle),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("FirstName LastName"),
                        kWidth5,
                        Icon(
                          Icons.verified,
                          color: Colors.lightBlue,
                        ),
                      ],
                    ),
                    kHeight5,
                    Text("Individual  |  Gardener"),
                    kHeight5,
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                        ),
                      ),
                    )
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.more_vert_outlined,
                  ),
                  onPressed: () {},
                ),
              ),
              kHeight10,
              CustomHorizontalDivider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        NumberCountText(
                          numberText: "400",
                          textColor: kColorBlueText,
                        ),
                        Text("Task Created")
                      ],
                    ),
                    Column(
                      children: [
                        NumberCountText(
                            numberText: "30", textColor: kColorAmberText),
                        Text("Task in Progress")
                      ],
                    ),
                    Column(
                      children: [
                        NumberCountText(
                          numberText: "400",
                          textColor: kColorGreenText,
                        ),
                        Text("Success Rate")
                      ],
                    ),
                  ],
                ),
              ),
              CustomHorizontalDivider(),
              TabBar(
                labelColor: Colors.amber,
                indicatorColor: Colors.amber,
                unselectedLabelColor: Colors.grey,
                controller: tabController,
                tabs: const [
                  Tab(
                    text: "About",
                  ),
                  Tab(
                    text: "Services",
                  ),
                  Tab(
                    text: "Documents",
                  ),
                  Tab(
                    text: "Reviews",
                  ),
                ],
              ),
              SizedBox(
                height: MediaQueryHelper.theHeight(context) * 0.67,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    AboutProfile(),
                    ServicesProfile(),
                    DocumentsProfile(),
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
