import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/core/constants/text.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_details.dart';
import 'package:cipher/features/profile/presentation/widgets/number_count_text.dart';
import 'package:cipher/features/profile/presentation/widgets/profile_kyc_verification_section.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_about.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_task.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TaskerProfile extends StatefulWidget {
  const TaskerProfile({super.key});
  static const routeName = '/taskerProfile-profile';

  @override
  State<TaskerProfile> createState() => TaskerProfileState();
}

class TaskerProfileState extends State<TaskerProfile>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                              children: [
                                const ListTile(
                                  leading: Icon(Icons.share),
                                  title: Text('Share'),
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
              return const CircularProgressIndicator();
            }
          }

          Widget displayRating() {
            if (state.states == TheStates.success) {
              return Row(
                children: List.generate(
                  (state.tasker?.rating?.avgRating as double?)?.round() ?? 5,
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
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Root.routeName,
                        (route) => false,
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  trailingWidget: IconButton(
                    onPressed: () {},
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
                                style: kPurpleText16,
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
                        children: [
                          Text(
                            'Rs. ${state.tasker?.hourlyRate!}/hr',
                            style: kPurpleText16,
                          ),
                          kHeight8,
                          CustomElevatedButton(
                            theWidth: 91,
                            label: 'Hire me',
                            callback: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                addVerticalSpace(40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                addVerticalSpace(20),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      KycDetails.routeName,
                    );
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
                      text: 'Task',
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
                            "${state.tasker?.addressLine1}, ${state.tasker?.country!.name ?? ''}",
                        portfolio: state.tasker?.portfolio ?? [],
                        education: state.tasker?.education ?? [],
                        experience: state.tasker?.experience ?? [],
                      ),
                      TaskerTask(
                        tasks: state.entityService,
                      ),
                      Container(),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
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
