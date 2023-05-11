import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/transaction/data/models/transactions_res.dart';
import 'package:cipher/features/transaction/data/repositories/transaction_repository.dart';
import 'package:cipher/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:cipher/features/transaction/presentation/widgets/transaction_card.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'views.dart';

class MyTransactionsMainView extends StatefulWidget {
  const MyTransactionsMainView({super.key});

  @override
  State<MyTransactionsMainView> createState() => _MyTransactionsMainViewState();
}

class _MyTransactionsMainViewState extends State<MyTransactionsMainView> {
  final _controller = ScrollController();

  Color _buildColor(Transactions transactions, UserState user) {
    if (transactions.receiver!.fullName!
        .contains(user.taskerProfile!.fullName!)) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  Icon _buildIcon(Transactions transactions, UserState user) {
    if (transactions.receiver!.fullName!
        .contains(user.taskerProfile!.fullName!)) {
      return Icon(
        Icons.keyboard_arrow_up_rounded,
      );
    } else {
      return Icon(
        Icons.keyboard_arrow_down_rounded,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_onScroll)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "My Transactions",
        trailingWidget: SizedBox.shrink(),
        // * To be implemented
        // IconButton(
        //   onPressed: () async {
        //     await TransactionRepository().downloadCSV();
        //   },
        //   icon: Icon(
        //     Icons.file_present_outlined,
        //   ),
        // ),
      ),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if (state.theStates == TheStates.success)
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FiltersHeaderView(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    thickness: 0.8,
                  ),
                ),
                ProfileRewardBalanceSection(user: "self"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "03 Dec 2022, Sunday",
                          style: kHelper13,
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: _controller,
                            itemCount: state.hasReachedMax == true
                                ? state.transactions?.length
                                : state.transactions!.length + 1,
                            itemBuilder: (context, index) {
                              if (index >= state.transactions!.length) {
                                context
                                    .read<TransactionBloc>()
                                    .add(TransactionLoaded());
                                return const BottomLoader();
                              } else {
                                return TransactionCard(
                                  leadingWidget: Image.network(
                                    state.transactions?[index].paymentMethod
                                            ?.logo ??
                                        kNoImageNImg,
                                  ),
                                  actionName: state
                                      .transactions?[index].transactionType
                                      ?.toCapitalized(),
                                  actionFrom: state
                                      .transactions?[index].paymentMethod?.name,
                                  price: state.transactions?[index].amount,
                                  priceColor: _buildColor(
                                    state.transactions?[index] ??
                                        Transactions(),
                                    context.read<UserBloc>().state,
                                  ),
                                  priceIcon: _buildIcon(
                                    state.transactions?[index] ??
                                        Transactions(),
                                    context.read<UserBloc>().state,
                                  ),
                                  time: "${DateFormat.yMMMd().format(
                                    state.transactions?[index].createdAt ??
                                        DateTime.now(),
                                  )}  ${DateFormat.jm().format(
                                    state.transactions?[index].createdAt ??
                                        DateTime.now(),
                                  )}",
                                  paymentMethod: state
                                      .transactions?[index].paymentMethod?.type,
                                  transactionId: state.transactions?[index].id,
                                  sender: state
                                      .transactions?[index].sender?.fullName,
                                  reciever: state
                                      .transactions?[index].receiver?.fullName,
                                  status: state.transactions?[index].status,
                                );
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          return SizedBox.shrink();
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) context.read<TransactionBloc>().add(TransactionLoaded());
  }

  bool get _isBottom {
    if (!_controller.hasClients) return false;
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
