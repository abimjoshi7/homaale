import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/features/tasker/data/repositories/tasker_repositories.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/tasker/presentation/view/tasker.dart';
import 'package:cipher/widgets/bottom_loader.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../tasker/presentation/bloc/tasker_bloc.dart';

class PopularTaskerNew extends StatelessWidget {
  static const routeName = '/popular-tasker-page-new';
  const PopularTaskerNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Tasker',
      ),
      body: BlocProvider(
        create: (_) => TaskerBloc(taskerRepositories: TaskerRepositories())..add(TaskerFetched()),
        child: const TaskerList(),
      ),
    );
  }
}

class TaskerList extends StatefulWidget {
  const TaskerList({super.key});

  @override
  State<TaskerList> createState() => _TaskerListState();
}

class _TaskerListState extends State<TaskerList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskerBloc, TaskerState>(
      builder: (context, state) {
        switch (state.status) {
          case TaskerStatus.failure:
            return const Center(child: Text('failed to fetch tasker'));
          case TaskerStatus.success:
            if (state.tasker.isEmpty) {
              return const Center(child: Text('no taskers'));
            }
            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: state.hasReachedMax ? state.tasker.length : state.tasker.length + 1,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return index >= state.tasker.length
                    ? const BottomLoader()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            context.read<TaskerCubit>().loadSingleTasker(
                                  state.tasker[index].user?.id ?? '',
                                );
                            context.read<TaskerCubit>().loadSingleTaskerServices(
                                  state.tasker[index].user?.id ?? '',
                                );
                            context.read<TaskerCubit>().loadSingleTaskerTask(
                                  state.tasker[index].user?.id ?? '',
                                );
                            context.read<TaskerCubit>().loadSingleTaskerReviews(
                                  state.tasker[index].user?.id ?? '',
                                );
                            Navigator.pushNamed(
                              context,
                              TaskerProfileView.routeName,
                            );
                          },
                          child: TaskerCard(
                            id: state.tasker[index].user?.id.toString() ?? '',
                            networkImageUrl: state.tasker[index].profileImage,
                            label: "${state.tasker[index].user?.firstName} ${state.tasker[index].user?.lastName}",
                            designation: state.tasker[index].designation,
                            happyClients: state.tasker[index].stats?.happyClients.toString(),
                            ratings:
                                "${state.tasker[index].rating?.avgRating?.toStringAsFixed(2) ?? '5'} (${state.tasker[index].rating?.userRatingCount ?? '0'})",
                            rate: "Rs. ${state.tasker[index].hourlyRate}",
                            callbackLabel: state.tasker[index].isFollowed ?? false ? 'Following' : 'Follow',
                            isFollowed: state.tasker[index].isFollowed ?? false,
                            callback: () {
                              if (CacheHelper.isLoggedIn == false) {
                                notLoggedInPopUp(context);
                              } else {
                                if (state.tasker[index].isFollowed ?? false) {
                                  context
                                      .read<TaskerCubit>()
                                      .handleFollowUnFollow(id: state.tasker[index].user?.id ?? '', follow: false);
                                } else {
                                  context
                                      .read<TaskerCubit>()
                                      .handleFollowUnFollow(id: state.tasker[index].user?.id ?? '', follow: true);
                                }
                                context.read<TaskerBloc>().add(SetInitial());
                              }
                            },
                            onFavouriteTapped: () {},
                          ),
                        ),
                      );
              },
            );
          case TaskerStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<TaskerBloc>().add(TaskerFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
