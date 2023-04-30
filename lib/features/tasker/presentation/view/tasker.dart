import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/core/constants/text.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_details.dart';
import 'package:cipher/features/profile/presentation/widgets/number_count_text.dart';
import 'package:cipher/features/profile/presentation/widgets/profile_kyc_verification_section.dart';
import 'package:cipher/features/search/presentation/pages/search_page.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_about.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_review_section.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_service.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_task.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TaskerProfileView extends StatefulWidget {
  const TaskerProfileView({super.key});
  static const routeName = '/taskerProfile-profile';

  @override
  State<TaskerProfileView> createState() => TaskerProfileViewState();
}

class TaskerProfileViewState extends State<TaskerProfileView>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: BlocBuilder<TaskerCubit, TaskerState>(
        builder: (context, state) {
          String profilePicUrl() {
            if (state.states == TheStates.success) {
              return state.tasker?.profileImage.toString() ??
                  'https://www.seekpng.com/ima/u2q8u2w7e6y3a9a9/';
            }
            return 'https://www.seekpng.com/ima/u2q8u2w7e6y3a9a9/';
          }

          Widget displayTaskerHeader() {
            if (state.states == TheStates.success) {
              return SizedBox(
                height: 160,
                child: Stack(
                  children: [
                    Container(
                      height: 120,
                      width: double.infinity,
                      color: kColorGrey,
                    ),
                    Positioned(
                      top: 50,
                      left: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              profilePicUrl(),
                            ),
                          ),
                        ),
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: 16,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () async {
                                    Navigator.pop(context);
                                    if (CacheHelper.isLoggedIn == false) {
                                      await notLoggedInPopUp(context);
                                    }
                                    if (CacheHelper.isLoggedIn == true) {
                                      final box = context.findRenderObject()
                                          as RenderBox?;
                                      Share.share(
                                        "Share this Hommale with friends.",
                                        sharePositionOrigin:
                                            box!.localToGlobal(Offset.zero) &
                                                box.size,
                                      );
                                    }
                                  },
                                  child: const ListTile(
                                    leading: Icon(Icons.share),
                                    title: Text('Share'),
                                  ),
                                ),
                                const ListTile(
                                  leading: Icon(Icons.report),
                                  title: Text('Report'),
                                ),
                                addVerticalSpace(16)
                              ],
                            ),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.more_vert),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CardLoading(
                  height: 200,
                ),
              );
            }
          }

          Widget displayRating() {
            if (state.states == TheStates.success) {
              return Row(
                children: List.generate(
                  (state.tasker?.rating?.avgRating)?.round() ?? 5,
                  (index) => const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amber,
                  ),
                ),
              );
            } else {
              return Row(
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amber,
                  ),
                ),
              );
            }
          }

          Widget buildTaskSuccessRate() {
            if (state.states == TheStates.success) {
              return NumberCountText(
                numberText:
                    state.tasker?.stats!.successRate!.toStringAsFixed(0) ?? '0',
                textColor: kColorGreen,
              );
            } else {
              return const NumberCountText(
                numberText: '0',
                textColor: kColorGreen,
              );
            }
          }

          Widget buildTaskHappyClients() {
            if (state.states == TheStates.success) {
              return NumberCountText(
                numberText:
                    state.tasker?.stats!.happyClients!.toStringAsFixed(0) ??
                        '0',
                textColor: kColorPurple,
              );
            } else {
              return const NumberCountText(
                numberText: '0',
                textColor: kColorPurple,
              );
            }
          }

          Widget buildTaskCompleted() {
            if (state.states == TheStates.success) {
              return NumberCountText(
                numberText:
                    state.tasker?.stats!.taskCompleted!.toStringAsFixed(0) ??
                        '0',
                textColor: kColorOrange,
              );
            } else {
              return const NumberCountText(
                numberText: '0',
                textColor: kColorOrange,
              );
            }
          }

          if (state.states == TheStates.success) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight50,
                CustomHeader(
                  leadingWidget: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  trailingWidget: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        SearchPage.routeName,
                      );
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  child: const Text('Profile'),
                ),
                const CustomHorizontalDivider(),
                displayTaskerHeader(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${state.tasker?.user!.firstName!} ${state.tasker?.user!.lastName!}',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              kWidth5,
                              if (state.tasker?.isProfileVerified! == true)
                                const Icon(
                                  Icons.verified,
                                  color: Colors.lightBlue,
                                ),
                            ],
                          ),
                          kHeight5,
                          Text(
                            state.tasker?.designation?.toString() ??
                                'Homaale User',
                          ),
                          kHeight5,
                          displayRating(),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          kHeight8,
                          CustomElevatedButton(
                            theWidth: 91,
                            label: 'Hire me',
                            callback: () {
                              if (CacheHelper.isLoggedIn == false) {
                                notLoggedInPopUp(context);
                              }
                              if (CacheHelper.isLoggedIn) {}
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                addVerticalSpace(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            buildTaskSuccessRate(),
                            addHorizontalSpace(4),
                            const Text('Success Rate'),
                          ],
                        ),
                        Row(
                          children: [
                            buildTaskHappyClients(),
                            addHorizontalSpace(4),
                            const Text('Happy Clients'),
                          ],
                        ),
                        Row(
                          children: [
                            buildTaskCompleted(),
                            addHorizontalSpace(4),
                            const Text('Task Completed'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                addVerticalSpace(20),
                InkWell(
                  onTap: () {
                    if (CacheHelper.isLoggedIn == false) {
                      notLoggedInPopUp(context);
                    }
                    if (!CacheHelper.isLoggedIn) return;
                    // Navigator.pushNamed(
                    //   context,
                    //   KycDetails.routeName,
                    // );
                  },
                  child: const ProfileKycVerifySection(),
                ),
                TabBar(
                  controller: tabController,
                  tabs: const [
                    Tab(
                      text: 'About',
                    ),
                    Tab(
                      text: 'Services',
                    ),
                    Tab(
                      text: 'Tasks',
                    ),
                    Tab(
                      text: 'Reviews',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      TaskerAboutSection(
                        bio: state.tasker?.bio,
                        contact: state.tasker?.user!.phone?.toString() ??
                            state.tasker?.user!.email!,
                        activeHourStart: state.tasker?.activeHourStart ?? '',
                        activeHourEnd: state.tasker?.activeHourEnd ?? '',
                        skills: state.tasker?.skill,
                        location:
                            "${state.tasker?.addressLine1}, ${state.tasker?.country?.name ?? ''}",
                        portfolio: state.tasker?.portfolio ?? [],
                        education: state.tasker?.education ?? [],
                        experience: state.tasker?.experience ?? [],
                      ),
                      TaskerService(
                        service: state.service,
                      ),
                      TaskerTask(
                        tasks: state.task,
                      ),
                      TaskerReviewSection(
                        taskerReviewsResponse: state.taskerReviewsResponse,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CardLoading(
                // cardLoadingTheme: CardLoadingTheme(
                //   colorOne: Theme.of(context).cardColor,
                //   colorTwo: Theme.of(context).cardColor,
                // ),
                height: 200,
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
