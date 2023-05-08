import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'views/views.dart';

class MyTransactionsPage extends StatelessWidget {
  static const routeName = "/my-transactions-page";
  const MyTransactionsPage({super.key});

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
