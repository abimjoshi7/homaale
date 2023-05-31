import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/kyc_constants.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/all_task_page.dart';
import 'package:cipher/features/task/presentation/pages/apply_task_page.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/features/user_suspend/presentation/bloc/user_suspend_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../user_suspend/presentation/pages/account_suspend_custom_tost.dart';

class TasksRecommendationSection extends StatefulWidget {
  static final taskRecoSection = GlobalKey();

  const TasksRecommendationSection({super.key});

  @override
  State<TasksRecommendationSection> createState() =>
      _TasksRecommendationSectionState();
}

class _TasksRecommendationSectionState
    extends State<TasksRecommendationSection> {
  late final user = locator<UserBloc>();
  @override
  void initState() {
    user.add(UserLoaded());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    user.close();
  }

  void onTaskPressed({
    required TaskState state,
    required int index,
    required bool isApply,
  }) {
    context.read<TaskBloc>().add(
          SingleEntityTaskLoadInitiated(
            id: state.tasksList!.result![index].id!,
          ),
        );
    if (isApply) {
      if (CacheHelper.isLoggedIn == false) {
        notLoggedInPopUp(context);
      }
      if (CacheHelper.isLoggedIn) {
        context
                    .read<UserSuspendBloc>()
                    .state
                    .userAccountSuspension
                    ?.isSuspended ==
                true
            ? showDialog(
                context: context,
                builder: (context) => AccountSuspendCustomToast(
                  heading: 'ACCOUNT SUSPENDED',
                  content: 'User is suspended',
                ),
              )
            : Navigator.pushNamed(context, ApplyTaskPage.routeName);
      }
    }
    if (!isApply) {
      Navigator.pushNamed(context, SingleTaskPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SectionHeading(
            labelName: 'Task recommendation for you',
            onTap: () {
              Navigator.pushNamed(
                context,
                AllTaskPage.routeName,
              );
            },
            showKey: TasksRecommendationSection.taskRecoSection,
            showCaseTitle: 'See All',
            showCaseDec: 'See All recommendation task from here.',
          ),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state.theState == TheStates.success) {
                if (state.tasksList != null) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => onTaskPressed(
                          state: state,
                          index: index,
                          isApply: false,
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TaskCard(
                            isRange: state.tasksList?.result?[index].isRange ??
                                false,
                            id: state.tasksList?.result?[index].id,
                            buttonLabel:
                                state.tasksList?.result?[index].createdBy?.id ==
                                        user.state.taskerProfile?.user?.id
                                    ? 'View Details'
                                    : 'Apply Now',
                            startRate:
                                '${state.tasksList?.result?[index].budgetFrom ?? 0}',
                            endRate:
                                '${state.tasksList?.result?[index].budgetTo ?? 0}',
                            budgetType:
                                '${state.tasksList?.result?[index].budgetType}',
                            count: state.tasksList?.result?[index].count
                                .toString(),
                            imageUrl: state.tasksList?.result?[index].createdBy
                                    ?.profileImage ??
                                kServiceImageNImg,
                            location:
                                state.tasksList?.result?[index].location == ''
                                    ? 'Remote'
                                    : state.tasksList?.result?[index].location,
                            endHour: Jiffy(
                              state.tasksList?.result?[index].createdAt
                                  .toString(),
                            ).jm,
                            endDate: Jiffy(
                              state.tasksList?.result?[index].endDate
                                  .toString(),
                            ).yMMMMd,
                            taskName: state.tasksList?.result?[index].title,
                            callback: () {
                              if (CacheHelper.isLoggedIn == false) {
                                notLoggedInPopUp(context);
                              }
                              if (CacheHelper.isLoggedIn == false) return;
                              if (CacheHelper.isKycVerified == false) {
                                notVerifiedPopup(context);
                              }
                              if (CacheHelper.isKycVerified == false) return;
                              onTaskPressed(
                                state: state,
                                index: index,
                                isApply: state.tasksList?.result?[index]
                                        .createdBy?.id !=
                                    user.state.taskerProfile?.user?.id,
                              );
                            },
                            onTapCallback: () {
                              if (!CacheHelper.isLoggedIn) {
                                notLoggedInPopUp(context);
                              }
                              if (!CacheHelper.isLoggedIn) return;
                            },
                          ),
                        ),
                      ),
                      itemCount: state.tasksList?.result?.length ?? 0,
                    ),
                  );
                }
                return const Center(
                  child: Text('Please try again'),
                );
              } else {
                return const Center(
                  child: CardLoading(
                    height: 200,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
