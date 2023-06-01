import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/edit_profile_page.dart';
import 'package:cipher/features/profile/presentation/widgets/profile_kyc_verification_section.dart';
import 'package:cipher/features/search/presentation/pages/search_page.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/features/support/presentation/widgets/report_page.dart';
import 'package:cipher/features/tasker/presentation/bloc/tasker_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_about.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_review_section.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_service.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_task.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/label_count.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../support/presentation/bloc/support_ticket_type_options_bloc.dart';
import '../../../support/presentation/bloc/support_ticket_type_options_event.dart';

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
    super.initState();
    context.read<UserBloc>().add(UserLoaded());
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<TaskerCubit, TaskerState>(
          builder: (context, state) {
            switch (state.status) {
              case TaskerStatus.success:
                String profilePicUrl() {
                  return state.singleTasker.profileImage.toString();
                }

                Widget displayRating() {
                  return Row(
                    children: List.generate(
                      (state.singleTasker.rating?.avgRating)?.round() ?? 5,
                      (index) => const Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                      ),
                    ),
                  );
                }

                Widget displayTaskerHeader() {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        profilePicUrl(),
                                      ),
                                    ),
                                  ),
                                  width: 80,
                                  height: 80,
                                ),
                                addHorizontalSpace(8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${state.singleTasker.user!.firstName!} ${state.singleTasker.user!.lastName!}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        kWidth5,
                                        if (state.singleTasker
                                                .isProfileVerified! ==
                                            true)
                                          const Icon(
                                            Icons.verified,
                                            color: Colors.lightBlue,
                                          ),
                                      ],
                                    ),
                                    Text(
                                      state.singleTasker.designation
                                              ?.toString() ??
                                          'Homaale User',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    displayRating(),
                                  ],
                                ),
                              ],
                            ),
                            InkWell(
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
                                            final box =
                                                context.findRenderObject()
                                                    as RenderBox?;
                                            Share.share(
                                              "https://sandbox.homaale.com/bookings/${state.singleTasker.id}",
                                              subject:
                                                  state.singleTasker.fullName,
                                              sharePositionOrigin: box!
                                                      .localToGlobal(
                                                          Offset.zero) &
                                                  box.size,
                                            );
                                          }
                                        },
                                        child: const ListTile(
                                          leading: Icon(Icons.share),
                                          title: Text('Share'),
                                        ),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          context
                                              .read<
                                                  SupportTicketTypeOptionsBloc>()
                                              .add(
                                                  SupportTicketTypeOptionsLoaded(
                                                      target: 'user'));
                                          Navigator.pushNamed(
                                            context,
                                            CommonReportPage.routeName,
                                            arguments: {
                                              'isType': 'isReportUser',
                                              'model': 'user',
                                              'objectId':
                                                  state.singleTasker.user!.id,
                                            },
                                          );
                                        },
                                        leading: Icon(Icons.report),
                                        title: Text('Report'),
                                      ),
                                      addVerticalSpace(16)
                                    ],
                                  ),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(Icons.more_vert),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }

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
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, userState) {
                        if (userState.taskerProfile?.user?.id ==
                            state.singleTasker.user?.id) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomElevatedButton(
                                  theWidth:
                                      MediaQuery.of(context).size.width * 0.45,
                                  theHeight: 40,
                                  borderRadius: 10,
                                  label: 'Edit Profile',
                                  callback: () {
                                    Navigator.pushNamed(
                                      context,
                                      EditProfilePage.routeName,
                                    );
                                  },
                                ),
                                BuildLabelCount(
                                    count: userState
                                            .taskerProfile?.followersCount
                                            ?.toString() ??
                                        '0',
                                    label: 'Followers'),
                                BuildLabelCount(
                                    count: userState
                                            .taskerProfile?.followingCount
                                            ?.toString() ??
                                        '0',
                                    label: 'Followings'),
                              ],
                            ),
                          );
                        } else {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Center(
                              child: CustomElevatedButton(
                                theWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                                theHeight: 40,
                                borderRadius: 30,
                                textColor:
                                    state.singleTasker.isFollowed ?? false
                                        ? kColorPrimary
                                        : Colors.white,
                                borderColor:
                                    state.singleTasker.isFollowed ?? false
                                        ? kColorPrimary
                                        : Colors.white,
                                mainColor:
                                    state.singleTasker.isFollowed ?? false
                                        ? Colors.white
                                        : kColorPrimary,
                                label: state.singleTasker.isFollowed ?? false
                                    ? 'Following'
                                    : 'Follow',
                                callback: () {
                                  if (CacheHelper.isLoggedIn == false) {
                                    notLoggedInPopUp(context);
                                  } else {
                                    if (state.singleTasker.isFollowed ??
                                        false) {
                                      context
                                          .read<TaskerCubit>()
                                          .handleFollowUnFollow(
                                              id: state.singleTasker.user?.id ??
                                                  '',
                                              follow: false);
                                    } else {
                                      context
                                          .read<TaskerCubit>()
                                          .handleFollowUnFollow(
                                              id: state.singleTasker.user?.id ??
                                                  '',
                                              follow: true);
                                    }
                                  }
                                },
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    addVerticalSpace(16),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildLabelCount(
                            count: state.singleTasker.stats!.successRate!
                                .toStringAsFixed(0),
                            textColor: kColorBlue,
                            label: 'Success Rate',
                          ),
                          BuildLabelCount(
                            count: state.singleTasker.stats!.happyClients!
                                .toStringAsFixed(0),
                            textColor: kColorAmber,
                            label: 'Happy Clients',
                          ),
                          BuildLabelCount(
                            count: state.singleTasker.stats!.taskCompleted!
                                .toStringAsFixed(0),
                            textColor: kColorGreen,
                            label: 'Task Completed',
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        if (CacheHelper.isLoggedIn == false) {
                          notLoggedInPopUp(context);
                        }
                        if (!CacheHelper.isLoggedIn) return;
                      },
                      child: const ProfileKycVerifySection(),
                    ),
                    TabBar(
                      controller: tabController,
                      indicatorColor: kColorSecondary,
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
                            bio: state.singleTasker.bio,
                            contact:
                                state.singleTasker.user!.phone?.toString() ??
                                    state.singleTasker.user!.email!,
                            activeHourStart:
                                state.singleTasker.activeHourStart ?? '',
                            activeHourEnd:
                                state.singleTasker.activeHourEnd ?? '',
                            skills: state.singleTasker.skill,
                            location:
                                "${state.singleTasker.addressLine1}, ${state.singleTasker.country?.name ?? ''}",
                            portfolio: state.singleTasker.portfolio ?? [],
                            education: state.singleTasker.education ?? [],
                            experience: state.singleTasker.experience ?? [],
                          ),
                          TaskerService(),
                          TaskerTask(),
                          TaskerReviewSection(),
                        ],
                      ),
                    ),
                  ],
                );
              case TaskerStatus.failure:
                return Center(
                  child:
                      Text("Couldn't fetch tasker profile. Try again later!"),
                );
              default:
                return Center(child: CircularProgressIndicator());
            }
          },
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
