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
  void onTaskPressed({
    required TaskState state,
    required int index,
    required bool isApply,
  }) {
    context.read<TaskBloc>().add(
          SingleEntityTaskLoadInitiated(
            id: state.taskEntityServiceModel.result![index].id!,
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
                if (state.taskEntityServiceModel != null) {
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
                            isRange: state.taskEntityServiceModel.result?[index]
                                    .isRange ??
                                false,
                            id: state.taskEntityServiceModel.result?[index].id,
                            buttonLabel: state.taskEntityServiceModel
                                        .result?[index].createdBy?.id ==
                                    context
                                        .read<UserBloc>()
                                        .state
                                        .taskerProfile
                                        ?.user
                                        ?.id
                                ? 'View Details'
                                : 'Apply Now',
                            startRate:
                                '${state.taskEntityServiceModel.result?[index].budgetFrom ?? 0}',
                            endRate:
                                '${state.taskEntityServiceModel.result?[index].budgetTo ?? 0}',
                            budgetType:
                                '${state.taskEntityServiceModel.result?[index].budgetType}',
                            count: state
                                .taskEntityServiceModel.result?[index].count
                                .toString(),
                            imageUrl: state.taskEntityServiceModel
                                    .result?[index].createdBy?.profileImage ??
                                kServiceImageNImg,
                            location: state.taskEntityServiceModel
                                        .result?[index].location ==
                                    ''
                                ? 'Remote'
                                : state.taskEntityServiceModel.result?[index]
                                    .location,
                            endHour: Jiffy(
                              state.taskEntityServiceModel.result?[index]
                                  .createdAt
                                  .toString(),
                            ).jm,
                            endDate: Jiffy(
                              state
                                  .taskEntityServiceModel.result?[index].endDate
                                  .toString(),
                            ).yMMMMd,
                            taskName: state
                                .taskEntityServiceModel.result?[index].title,
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
                                isApply: state.taskEntityServiceModel
                                        .result?[index].createdBy?.id !=
                                    context
                                        .read<UserBloc>()
                                        .state
                                        .taskerProfile
                                        ?.user
                                        ?.id,
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
                      itemCount:
                          state.taskEntityServiceModel.result?.length ?? 0,
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
