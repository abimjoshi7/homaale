import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/text.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../widgets/transaction_card.dart';
import 'views/views.dart';

class MyTransactions extends StatelessWidget {
  static const routeName = "/my-transactions";
  const MyTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "My Transactions",
        trailingWidget: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.file_present_outlined,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(
              thickness: 0.8,
            ),
          ),
          ProfileRewardBalanceSection(user: "self"),
          Expanded(
            child: TransactionList(),
          ),
        ],
      ),
    );
  }
}
