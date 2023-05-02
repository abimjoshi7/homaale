import 'package:cipher/features/following_followers/data/repositories/follow_follower_repository.dart';
import 'package:cipher/widgets/bottom_loader.dart';
import 'package:cipher/widgets/follow_following_widget.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'bloc/follow_follower_bloc.dart';

class FollowerSection extends StatelessWidget {
  const FollowerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) =>
            FollowFollowerBloc(followFollowersRepositroy: FollowFollowersRepositroy())..add(FetchFollowerEvent()),
        child: const FollowerList(),
      ),
    );
  }
}

class FollowerList extends StatefulWidget {
  const FollowerList({super.key});

  @override
  State<FollowerList> createState() => _FollowerListState();
}

class _FollowerListState extends State<FollowerList> {
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
            if (state.followerList.isEmpty) {
              return const Center(child: Text('no taskers'));
            }
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.followersHasReachedMax ? state.followerList.length : state.followerList.length + 1,
              controller: _scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return index >= state.followerList.length
                    ? const BottomLoader()
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: FollowFollowingWidget(
                          name: state.followerList[index].fullName,
                          designation: state.followerList[index].designation,
                          profileImg: state.followerList[index].profileImage,
                          showCallbackButton: false,
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
    if (_isBottom) context.read<FollowFollowerBloc>().add(FetchFollowerEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
