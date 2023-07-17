import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/kyc_constants.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/all_task_page.dart';
import 'package:cipher/features/task/presentation/pages/apply_task_page.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/edit_task_entity_service_page.dart';
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
  /// On task pressed
  void onTaskPressed({
    required TaskState state,
    required int index,
    required bool isApply,
  }) {
    context.read<TaskBloc>().add(
          SingleEntityTaskLoadInitiated(
            id: state.taskEntityServiceModel.result![index].id!,
            userId:
                context.read<UserBloc>().state.taskerProfile?.user?.id ?? '',
          ),
        );

    context.read<TaskEntityServiceBloc>().add(
          FetchRecommendedSimilar(
            id: state.taskEntityServiceModel.result?[index].id ?? '',
          ),
        );
    context.read<RatingReviewsBloc>().add(
          SetToInitial(
            id: state.taskEntityServiceModel.result?[index].id ?? '',
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
                  content: 'User is Suspended',
                ),
              )
            : Navigator.pushNamed(context, ApplyTaskPage.routeName);
      }
    } else {
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
                if (state.taskEntityServiceModel.count != null) {
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
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: TaskCard(
                            shareLinked:
                                '$kShareLinks/tasks/${state.taskEntityServiceModel.result?[index].id}',
                            isRange: state.taskEntityServiceModel.result?[index]
                                    .isRange ??
                                false,
                            id: state.taskEntityServiceModel.result?[index].id,
                            isBookmarked: state.taskEntityServiceModel
                                .result?[index].isBookmarked,
                            isOwner: state.taskEntityServiceModel.result?[index]
                                    .createdBy?.id ==
                                context
                                    .read<UserBloc>()
                                    .state
                                    .taskerProfile
                                    ?.user
                                    ?.id,
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
                            state.taskEntityServiceModel
                                .result?[index].createdBy?.id ==
                                context
                                    .read<UserBloc>()
                                    .state
                                    .taskerProfile
                                    ?.user
                                    ?.id ?  '${state.taskEntityServiceModel.result?[index].payableFrom ?? 0}':'${state.taskEntityServiceModel.result?[index].budgetFrom ?? 0}',
                            endRate:
                            state.taskEntityServiceModel
                                .result?[index].createdBy?.id ==
                                context
                                    .read<UserBloc>()
                                    .state
                                    .taskerProfile
                                    ?.user
                                    ?.id ?

                                '${state.taskEntityServiceModel.result?[index].payableTo ?? 0}':'${state.taskEntityServiceModel.result?[index].budgetTo ?? 0}',
                            budgetType:
                                '${state.taskEntityServiceModel.result?[index].budgetType}',
                            count: state
                                .taskEntityServiceModel.result?[index].count
                                .toString(),
                            imageUrl: state.taskEntityServiceModel
                                    .result?[index].createdBy?.profileImage ??
                                kHomaaleImg,
                            createdByName:
                                '${state.taskEntityServiceModel.result?[index].createdBy?.fullName}',
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
                            editCallback: () {
                              if (CacheHelper.isLoggedIn == false) {
                                notLoggedInPopUp(context);
                              }
                              if (CacheHelper.isLoggedIn == false) return;
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                      left: 8,
                                      right: 8,
                                      top: 8),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        EditTaskEntityServiceForm(
                                          id: state.taskEntityServiceModel
                                                  .result?[index].id ??
                                              "",
                                          isRequested: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
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
                return CardLoading(
                  height: 200,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
