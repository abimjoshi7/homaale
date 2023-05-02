import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/features/following_followers/data/repositories/follow_follower_repository.dart';
import 'package:cipher/widgets/bottom_loader.dart';
import 'package:cipher/widgets/follow_following_widget.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'bloc/follow_follower_bloc.dart';

class FollowingSection extends StatelessWidget {
  const FollowingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) =>
            FollowFollowerBloc(followFollowersRepositroy: FollowFollowersRepositroy())..add(FetchFollowingEvent()),
        child: const FollowingList(),
      ),
    );
  }
}

class FollowingList extends StatefulWidget {
  const FollowingList({super.key});

  @override
  State<FollowingList> createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowFollowerBloc, FollowFollowerState>(
      builder: (context, state) {
        switch (state.followFollowerStatus) {
          case FollowFollowerStatus.failure:
            return const Center(child: Text('failed to fetch tasker'));
          case FollowFollowerStatus.success:
            if (state.followingList.isEmpty) {
              return const Center(child: Text('no taskers'));
            }
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemCount: state.followingHasReachedMax ? state.followingList.length : state.followingList.length + 1,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return index >= state.followingList.length
                    ? const BottomLoader()
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: FollowFollowingWidget(
                          name: state.followingList[index].fullName,
                          designation: state.followingList[index].designation,
                          profileImg: state.followingList[index].profileImage,
                          showCallbackButton: true,
                          callBackLabel: 'Unfollow',
                          callback: () {
                            context.read<FollowFollowerBloc>().add(HandleUnfollowEvent(state.followingList[index].id!));
                          },
                        ),
                      );
              },
            );
          case FollowFollowerStatus.initial:
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
    if (_isBottom) context.read<FollowFollowerBloc>().add(FetchFollowingEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
