import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/bloc/rewards_bloc.dart';
import 'package:cipher/widgets/bottom_loader.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RewardsProfile extends StatelessWidget {
  const RewardsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RewardsBloc()..add(FetchRewardsEvent()),
      child: RewardsList(),
    );
  }
}

class RewardsList extends StatefulWidget {
  const RewardsList({super.key});

  @override
  State<RewardsList> createState() => _RewardsListState();
}

class _RewardsListState extends State<RewardsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<RewardsBloc, RewardsState>(
        builder: (context, state) {
          switch (state.rewardsStatus) {
            case RewardsStatus.initial:
              return Center(
                child: CircularProgressIndicator(),
              );

            case RewardsStatus.success:
              return state.rewardsList.isEmpty
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Center(
                        child: Text('No Rewards!'),
                      ),
                    )
                  : GridView.builder(
                      controller: _scrollController,
                      itemCount: state.hasReachedMax ? state.rewardsList.length : state.rewardsList.length + 1,
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        if (index >= state.rewardsList.length) {
                          return const BottomLoader();
                        } else {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Image.network(
                                        state.rewardsList[index].image ?? kServiceImageNImg,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${state.rewardsList[index].title}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: kHeading3,
                                  ),
                                  kHeight10,
                                  Text(
                                    '${state.rewardsList[index].description}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: kHelper13,
                                  ),
                                  kHeight10,
                                  Row(
                                    children: [
                                      Container(
                                        height: 31,
                                        width: MediaQuery.of(context).size.width * 0.27,
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xffADB5BD)),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(4),
                                            topLeft: Radius.circular(4),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text('${state.rewardsList[index].code ?? 'No code!'}'),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (state.rewardsList[index].code != null) {
                                            Clipboard.setData(
                                              ClipboardData(
                                                text: state.rewardsList[index].code,
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          height: 31,
                                          padding: EdgeInsets.symmetric(horizontal: 8),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(4),
                                              bottomRight: Radius.circular(4),
                                            ),
                                            color: Color(0xff211D4F),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Copy',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    );

            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
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
    if (_isBottom) context.read<RewardsBloc>().add(FetchRewardsEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
