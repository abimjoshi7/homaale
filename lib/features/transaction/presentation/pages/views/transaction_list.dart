import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/transaction/data/models/transactions_res.dart';
import 'package:cipher/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:cipher/features/transaction/presentation/widgets/transaction_card.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({
    super.key,
  });

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  List<Transactions> list = [];

  final PagingController<int, Transactions> _controller = PagingController(
    firstPageKey: 1,
  );

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
      return Icon(Icons.keyboard_arrow_up_rounded);
    } else {
      return Icon(Icons.keyboard_arrow_down_rounded);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addPageRequestListener(
      (pageKey) => context.read<TransactionBloc>().add(
            TransactionLoaded(
              pageNumber: pageKey,
            ),
          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8,
      ),
      child: BlocConsumer<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state.theStates == TheStates.loading) {
            _controller.refresh();
          }
          if (state.theStates == TheStates.failure) {
            _controller.error = 'Error';
          }

          if (state.theStates == TheStates.success) {
            list = state.res!.result!;
            final lastPage = state.res!.totalPages!;
            final next = 1 + state.res!.current!;

            if (next > lastPage) {
              _controller.appendLastPage(list);
            } else {
              _controller.appendPage(list, next);
            }
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "03 Dec 2022, Sunday",
                style: kHelper13,
              ),
              Expanded(
                child: PagedListView(
                  pagingController: _controller,
                  builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, Transactions item, index) =>
                        TransactionCard(
                      leadingWidget: Image.network(
                        item.paymentMethod?.logo ?? kNoImageNImg,
                      ),
                      actionName: item.transactionType?.toCapitalized(),
                      actionFrom: item.paymentMethod?.name,
                      price: item.amount,
                      priceColor: _buildColor(
                        item,
                        context.read<UserBloc>().state,
                      ),
                      priceIcon: _buildIcon(
                        item,
                        context.read<UserBloc>().state,
                      ),
                      time: "${DateFormat.yMMMd().format(
                        item.createdAt ?? DateTime.now(),
                      )}  ${DateFormat.jm().format(
                        item.createdAt ?? DateTime.now(),
                      )}",
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
