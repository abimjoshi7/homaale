import 'package:cipher/features/transaction/data/repositories/transaction_repository.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../bloc/transaction_bloc.dart';
import 'views/views.dart';

class MyTransactionsPage extends StatelessWidget {
  static const routeName = "/my-transactions-page";
  const MyTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(
        TransactionRepository(),
      )..add(
          TransactionLoaded(),
        ),
      child: MyTransactionsMainView(),
    );
  }
}
