// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/tasker/presentation/bloc/tasker_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/tasker/presentation/view/tasker.dart';
import 'package:cipher/features/task/presentation/pages/popular_tasker_page_new.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class PopularTaskerSection extends StatelessWidget {
  const PopularTaskerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: <Widget>[
          SectionHeading(
            labelName: 'Popular Taskers',
            onTap: () {
              Navigator.pushNamed(
                context,
                PopularTaskerNew.routeName,
              );
            },
          ),
          BlocBuilder<TaskerCubit, TaskerState>(
            builder: (context, state) {
              if (state.status == TaskerStatus.initial) {
                return const Center(
                  child: CardLoading(
                    height: 200,
                  ),
                );
              }
              if (state.status == TaskerStatus.success) {
                final data = state.taskerListRes.result;
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        context
                            .read<TaskerCubit>()
                            .loadSingleTasker(data?[index].user?.id ?? '');

                        Navigator.pushNamed(
                          context,
                          TaskerProfileView.routeName,
                        );
                      },
                      child: TaskerCard(
                        badgeImage: data?[index].badge?.image,
                        shareLinked:
                            '$kShareLinks/tasker/${state.singleTasker.user?.id}',
                        rewardPercentage: data?[index]
                                .stats
                                ?.successRate
                                ?.toInt()
                                .toString() ??
                            '0',
                        id: data?[index].user?.id,
                        networkImageUrl: data?[index].profileImage,
                        label:
                            "${data?[index].user?.firstName} ${data?[index].user?.lastName}",
                        designation: data?[index].designation,
                        happyClients:
                            data?[index].stats?.happyClients.toString(),
                        ratings:
                            '${data?[index].rating?.userRatingCount?.toStringAsFixed(1) ?? '0'}',
                        // ${data?[index].rating?.avgRating?.toStringAsFixed(2) ?? '5'}
                        callbackLabel: CacheHelper.isLoggedIn &&
                                data?[index].isFollowed == true
                            ? 'Following'
                            : 'Follow',
                        isFollowed: data?[index].isFollowed ?? false,
                        buttonWidth: MediaQuery.of(context).size.width,
                        callback: () {
                          if (CacheHelper.isLoggedIn == false) {
                            notLoggedInPopUp(context);
                          } else {
                            if (data?[index].isFollowed ?? false) {
                              context.read<TaskerCubit>().handleFollowUnFollow(
                                  id: data?[index].user?.id ?? '',
                                  follow: false);
                            } else {
                              context.read<TaskerCubit>().handleFollowUnFollow(
                                  id: data?[index].user?.id ?? '',
                                  follow: true);
                            }
                          }
                        },
                        onFavouriteTapped: () {
                          if (CacheHelper.isLoggedIn == false) {
                            notLoggedInPopUp(context);
                          }
                        },
                      ),
                    ),
                    separatorBuilder: (context, index) => kWidth10,
                    itemCount: state.taskerListRes.result?.length ?? 1,
                  ),
                );
              }
              return const Center(
                child: Text('Something went wrong. Please try again.'),
              );
            },
          )
        ],
      ),
    );
  }
}
