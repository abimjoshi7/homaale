// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task/presentation/pages/popular_tasker_page.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/tasker/presentation/view/tasker.dart';
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
        children: [
          SectionHeading(
            labelName: 'Popular Taskers',
            onTap: () {
              Navigator.pushNamed(
                context,
                PopularTaskerPage.routeName,
              );
            },
          ),
          BlocBuilder<TaskerCubit, TaskerState>(
            builder: (context, state) {
              if (state.states == TheStates.initial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.states == TheStates.success) {
                final data = state.taskerListRes?.result;
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        context.read<TaskerCubit>().loadSingleTasker(
                              data?[index].user?.id ?? '',
                            );
                        context.read<TaskerCubit>().loadSingleTaskerServices(
                              data?[index].user?.id ?? '',
                            );
                        context.read<TaskerCubit>().loadSingleTaskerTask(
                              data?[index].user?.id ?? '',
                            );
                        context.read<TaskerCubit>().loadSingleTaskerReviews(
                              data?[index].user?.id ?? '',
                            );

                        Navigator.pushNamed(
                          context,
                          TaskerProfileView.routeName,
                        );
                      },
                      child: TaskerCard(
                        networkImageUrl: data?[index].profileImage,
                        label: "${data?[index].user?.firstName} ${data?[index].user?.lastName}",
                        designation: data?[index].designation,
                        happyClients: data?[index].stats?.happyClients.toString(),
                        ratings:
                            "${data?[index].rating?.avgRating ?? '5'} (${data?[index].rating?.userRatingCount ?? '0'})",
                        callback: () {},
                      ),
                    ),
                    separatorBuilder: (context, index) => kWidth10,
                    itemCount: state.taskerListRes?.result?.length ?? 1,
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
