import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/widgets/profile_stats_card.dart';
import 'package:cipher/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:cipher/features/wallet/presentation/widgets/earning_filter_widget.dart';
import 'package:cipher/features/wallet/presentation/withdraw_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../error_pages/no_internet_page.dart';

class WalletPage extends StatelessWidget {
  static const String routeName = '/wallet-page';
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletBloc()
        ..add(WalletHistoryLoaded())
        ..add(WalletLoaded()),
      child: WalletMainView(),
    );
  }
}

class WalletMainView extends StatefulWidget {
  const WalletMainView({super.key});

  @override
  State<WalletMainView> createState() => _WalletMainViewState();
}

class _WalletMainViewState extends State<WalletMainView> {
  final _controller = ScrollController();

  String startDate = '';
  String lastDate = '';
  String fromText = '';
  String toText = '';
  String? searchQuery;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  Map<String, dynamic> getValuesFromIndex(WalletState state, int index) {
    switch (index) {
      case 0:
        return {
          'label': 'Current Balance',
          'value':
              '${state.walletModel.length == 0 ? '0' : Decimal.parse(state.walletModel.first.availableBalance.toString())}',
        };
      case 1:
        return {
          'label': 'Total Earnings',
          'value':
              '${state.walletModel.length == 0 ? '0' : Decimal.parse(state.walletModel.first.totalIncome.toString())}',
        };

      case 2:
        return {
          'label': 'Total Withdrawals',
          'value':
              '${state.walletModel.length == 0 ? '0' : Decimal.parse(state.walletModel.first.totalWithdrawals.toString())}',
        };

      case 3:
        return {
          'label': 'Total Pending',
          'value':
              '${state.walletModel.length == 0 ? '0' : Decimal.parse(state.walletModel.first.frozenAmount.toString())}',
        };

      default:
        return {
          'label': 'Label$index',
          'value': 'asd$index',
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'My Earnings',
        trailingWidget: SizedBox.shrink(),
      ),
      body: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          switch (state.theStates) {
            case TheStates.initial:
              return const Center(child: CustomLoader());
            case TheStates.success:
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  controller: _controller,
                  children: [
                    Text(
                      'Your Earnings',
                      style: textTheme.titleMedium,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      padding: EdgeInsets.zero,
                      childAspectRatio: 2.25,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(
                        4,
                        (index) => ProfileStatsCard(
                          imagePath: 'assets/wallet.png',
                          label: getValuesFromIndex(state, index)['label']
                              as String,
                          value: getValuesFromIndex(state, index)['value']
                              as String,
                        ),
                      ),
                    ),
                    addVerticalSpace(8),
                    CustomElevatedButton(
                      theWidth: double.infinity,
                      label: 'Withdraw Fund',
                      callback: () {
                        if (state.walletModel.length == 0) {
                          return;
                        } else if (Decimal.parse(state
                                .walletModel.first.availableBalance
                                .toString()) !=
                            0.0) {
                          Navigator.pushNamed(
                            context,
                            WithdrawPage.routeName,
                          );
                        }
                      },
                    ),
                    addVerticalSpace(8),
                    EarningFilterWidget(
                      fromText: fromText.isEmpty || fromText == 'null'
                          ? null
                          : Jiffy(fromText).MMMd,
                      toText: toText.isEmpty || toText == 'null'
                          ? null
                          : Jiffy(toText).MMMd,
                      onFromTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                            2000,
                          ),
                          lastDate: DateTime(
                            2050,
                          ),
                        ).then(
                          (value) {
                            setState(() {
                              startDate = value.toString();
                              fromText = value.toString();
                            });
                            context.read<WalletBloc>().add(WalletHistoryLoaded(
                                isNewFetch: true,
                                startDate: DateTime.parse(startDate),
                                endDate: lastDate.isEmpty || lastDate == 'null'
                                    ? null
                                    : DateTime.parse(lastDate)));
                          },
                        );
                      },
                      onToTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                            2000,
                          ),
                          lastDate: DateTime(
                            2050,
                          ),
                        ).then(
                          (value) {
                            setState(() {
                              lastDate = value.toString();
                              toText = value.toString();
                            });
                            context.read<WalletBloc>().add(WalletHistoryLoaded(
                                isNewFetch: true,
                                startDate:
                                    startDate.isEmpty || startDate == 'null'
                                        ? null
                                        : DateTime.parse(startDate),
                                endDate: DateTime.parse(lastDate)));
                          },
                        );
                      },
                      onClearFilterTap: () {
                        setState(() {
                          startDate = '';
                          lastDate = '';
                          fromText = '';
                          toText = '';
                        });
                        context
                            .read<WalletBloc>()
                            .add(WalletHistoryLoaded(isNewFetch: true));
                      },
                    ),
                    state.walletHistoryList.length == 0
                        ? Center(
                            child: CommonErrorContainer(
                                assetsPath: "assets/no_data_found.png",
                                errorDes: 'No Earning History')
                            // Text(''),
                            )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.hasReachedMax
                                ? state.walletHistoryList.length
                                : state.walletHistoryList.length + 1,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return index >= state.walletHistoryList.length
                                  ? BottomLoader()
                                  : Card(
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Transaction id: ${state.walletHistoryList[index].id.toString()}',
                                                  style: textTheme.titleSmall
                                                      ?.copyWith(
                                                          color: kColorPrimary),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 8),
                                                  color: kColorGreen
                                                      .withOpacity(0.5),
                                                  child: Center(
                                                    child: Text(
                                                      'Recieved',
                                                      style: textTheme
                                                          .titleSmall
                                                          ?.copyWith(
                                                              color: Colors
                                                                  .green[900]),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Text(
                                              'Paid by: ${state.walletHistoryList[index].sender}',
                                              style: textTheme.titleSmall,
                                            ),
                                            Text(
                                              'Paid for: ${state.walletHistoryList[index].taskTitle?.length == 0 ? 'N/A' : state.walletHistoryList[index].taskTitle?.join(',')}',
                                              style: textTheme.titleSmall,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Amount: ${Decimal.parse(state.walletHistoryList[index].amount.toString())}',
                                                  style: textTheme.titleSmall
                                                      ?.copyWith(
                                                          color: kColorPrimary),
                                                ),
                                                Text(
                                                  '${Jiffy(state.walletHistoryList[index].createdAt.toString()).yMMMMd}',
                                                  style: textTheme.titleSmall,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                            },
                          ),
                  ],
                ),
              );
            case TheStates.failure:
              return Text('failure');
            default:
              return const Center(child: CustomLoader());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_onScroll)
      ..dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<WalletBloc>().add(WalletHistoryLoaded());
  }

  bool get _isBottom {
    if (!_controller.hasClients) return false;
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class EarningSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = "")];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // return SizedBox.shrink();
    if (query.length > 3) {
      context.read<WalletBloc>().add(
            WalletHistoryLoaded(
              searchQuery: query,
            ),
          );
    }
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        return Column(
          children: List.generate(
            state.walletHistoryList.length,
            (index) => Card(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaction id: ${state.walletHistoryList[index].id.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: kColorPrimary),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          color: kColorGreen.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              'Recieved',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.green[900]),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Paid by: ${state.walletHistoryList[index].sender}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      'Paid for: ${state.walletHistoryList[index].taskTitle?.length == 0 ? 'N/A' : state.walletHistoryList[index].taskTitle?.join(',')}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount: ${Decimal.parse(state.walletHistoryList[index].amount.toString())}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: kColorPrimary),
                        ),
                        Text(
                          '${Jiffy(state.walletHistoryList[index].createdAt.toString()).yMMMMd}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length > 3) {
      context.read<WalletBloc>().add(
            WalletHistoryLoaded(
              searchQuery: query,
            ),
          );
    }
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        return Column(
          children: List.generate(
            state.walletHistoryList.length,
            (index) => Card(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaction id: ${state.walletHistoryList[index].id.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: kColorPrimary),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          color: kColorGreen.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              'Recieved',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.green[900]),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Paid by: ${state.walletHistoryList[index].sender}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      'Paid for: ${state.walletHistoryList[index].taskTitle?.length == 0 ? 'N/A' : state.walletHistoryList[index].taskTitle?.join(',')}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount: ${Decimal.parse(state.walletHistoryList[index].amount.toString())}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: kColorPrimary),
                        ),
                        Text(
                          '${Jiffy(state.walletHistoryList[index].createdAt.toString()).yMMMMd}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
