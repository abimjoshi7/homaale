import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/transaction/data/models/transactions_res.dart';
import 'package:cipher/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:cipher/features/transaction/presentation/widgets/transaction_card.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          final transactions = state.res?.result;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "03 Dec 2022, Sunday",
                style: kHelper13,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => TransactionCard(
                    leadingWidget: Image.network(
                        transactions?[index].paymentMethod?.logo ?? ""),
                    actionName:
                        transactions?[index].transactionType?.toCapitalized(),
                    actionFrom: transactions?[index].paymentMethod?.name,
                    price: transactions?[index].amount,
                    priceColor: _buildColor(
                      transactions?[index] ?? Transactions(),
                      context.read<UserBloc>().state,
                    ),
                    priceIcon: _buildIcon(
                      transactions?[index] ?? Transactions(),
                      context.read<UserBloc>().state,
                    ),
                    time: "${DateFormat.yMMMd().format(
                      transactions?[index].createdAt ?? DateTime.now(),
                    )} ${DateFormat.jm().format(
                      transactions?[index].createdAt ?? DateTime.now(),
                    )}",
                  ),
                  itemCount: state.res?.result?.length ?? 0,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
