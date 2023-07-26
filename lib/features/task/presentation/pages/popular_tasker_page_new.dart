import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/tasker/data/repositories/tasker_repositories.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/tasker/presentation/view/tasker.dart';
import 'package:cipher/widgets/widgets.dart';

import '../../../tasker/presentation/bloc/tasker_bloc.dart';

class PopularTaskerNew extends StatelessWidget {
  static const routeName = '/popular-tasker-page-new';
  const PopularTaskerNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Tasker',
        trailingWidget: SizedBox.shrink(),
        // IconButton(
        //   onPressed: () async => showSearch(
        //     context: context,
        //     delegate: SearchHelper(
        //       context: context,
        //       searchBloc: locator<SearchBloc>(),
        //     ),
        //   ),
        //   icon: Icon(Icons.search),
        // ),
      ),
      body: BlocProvider(
        create: (_) => TaskerBloc(taskerRepositories: TaskerRepositories())
          ..add(TaskerFetched()),
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
  final _searchController = TextEditingController();

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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.filter_alt_outlined,
                            color: kColorSilver,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          height: 40,
                          child: CustomTextFormField(
                            hintText: "Search",
                            controller: _searchController,
                            inputAction: TextInputAction.done,
                            onFieldSubmitted: (p0) {
                              if (p0!.length >= 3) {
                                context.read<TaskerBloc>().add(
                                      TaskerFetched(
                                        newFetch: true,
                                        searchQuery: _searchController.text,
                                      ),
                                    );
                              }
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            setState(() {
                              _searchController.clear();
                            });
                            context.read<TaskerBloc>().add(
                                  TaskerFetched(
                                    newFetch: true,
                                  ),
                                );
                          },
                          icon: Icon(
                            Icons.clear,
                            color: kColorSilver,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: state.hasReachedMax
                        ? state.tasker.length
                        : state.tasker.length + 1,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return index >= state.tasker.length
                          ? const BottomLoader()
                          : InkWell(
                              onTap: () {
                                context.read<TaskerCubit>().loadSingleTasker(
                                      state.tasker[index].user?.id ?? '',
                                    );
                                context
                                    .read<TaskerCubit>()
                                    .loadSingleTaskerServices(
                                      state.tasker[index].user?.id ?? '',
                                    );
                                context
                                    .read<TaskerCubit>()
                                    .loadSingleTaskerTask(
                                      state.tasker[index].user?.id ?? '',
                                    );
                                context
                                    .read<TaskerCubit>()
                                    .loadSingleTaskerReviews(
                                      state.tasker[index].user?.id ?? '',
                                    );
                                Navigator.pushNamed(
                                  context,
                                  TaskerProfileView.routeName,
                                );
                              },
                              child: TaskerCard(
                                isOwner: state.tasker[index].user?.id ==
                                    context
                                        .read<UserBloc>()
                                        .state
                                        .taskerProfile
                                        ?.user
                                        ?.id,
                                rewardPercentage: state
                                        .tasker[index].stats?.successRate
                                        ?.toInt()
                                        .toString() ??
                                    '0',
                                shareLinked:
                                    '$kShareLinks/tasker/${state.tasker[index].user?.id}',
                                id: state.tasker[index].user?.id.toString() ??
                                    '',
                                networkImageUrl:
                                    state.tasker[index].profileImage,
                                label:
                                    "${state.tasker[index].user?.firstName} ${state.tasker[index].user?.lastName}",
                                designation: state.tasker[index].designation,
                                happyClients: state
                                    .tasker[index].stats?.happyClients
                                    .toString(),
                                ratings:
                                    // "${state.tasker[index].rating?.avgRating?.toStringAsFixed(2) ?? '5'} "
                                    "${state.tasker[index].rating?.userRatingCount?.toStringAsFixed(1) ?? '0'}",
                                rate: "Rs. ${state.tasker[index].hourlyRate}",
                                callbackLabel:
                                    state.tasker[index].isFollowed ?? false
                                        ? 'Following'
                                        : 'Follow',
                                isFollowed:
                                    state.tasker[index].isFollowed ?? false,
                                buttonWidth: MediaQuery.of(context).size.width,
                                callback: () {
                                  if (CacheHelper.isLoggedIn == false) {
                                    notLoggedInPopUp(context);
                                  } else {
                                    if (state.tasker[index].isFollowed ??
                                        false) {
                                      context
                                          .read<TaskerCubit>()
                                          .handleFollowUnFollow(
                                              id: state
                                                      .tasker[index].user?.id ??
                                                  '',
                                              follow: false);
                                    } else {
                                      context
                                          .read<TaskerCubit>()
                                          .handleFollowUnFollow(
                                              id: state
                                                      .tasker[index].user?.id ??
                                                  '',
                                              follow: true);
                                    }
                                    context
                                        .read<TaskerBloc>()
                                        .add(SetInitial());
                                  }
                                },
                                onFavouriteTapped: () {},
                              ),
                            );
                    },
                  ),
                ),
              ],
            );
          case TaskerStatus.initial:
            return const Center(child: CardLoading(height: 400));
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom)
      context.read<TaskerBloc>().add(TaskerFetched(
            searchQuery: _searchController.text,
          ));
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

void some1(String port) {
  int sum = 0;
  for (int i = 1; i < 10000; i++) {
    sum += i;
    print("$sum$port");
  }
}
