import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/text.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/transaction_card.dart';

class MyTransactions extends StatelessWidget {
  static const routeName = "/my-transactions";
  const MyTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "My Transactions",
        trailingWidget: Icon(
          Icons.file_present_outlined,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: kColorSilver,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kColorGrey,
                      ),
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                    ),
                    constraints: BoxConstraints.loose(
                      Size(
                        100,
                        100,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Status"),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: kColorSilver,
                          ),
                        ],
                      ),
                    ),
                  ),
                  addHorizontalSpace(
                    8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kColorGrey,
                      ),
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                    ),
                    constraints: BoxConstraints.loose(
                      Size(
                        100,
                        100,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dr/Cr"),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: kColorSilver,
                          ),
                        ],
                      ),
                    ),
                  ),
                  addHorizontalSpace(
                    8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kColorGrey,
                      ),
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                    ),
                    constraints: BoxConstraints.loose(
                      Size(
                        100,
                        100,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("From"),
                          addHorizontalSpace(
                            8,
                          ),
                          Icon(
                            Icons.calendar_today_outlined,
                            color: kColorSilver,
                          ),
                        ],
                      ),
                    ),
                  ),
                  addHorizontalSpace(
                    8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kColorGrey,
                      ),
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                    ),
                    constraints: BoxConstraints.loose(
                      Size(
                        100,
                        100,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("To"),
                          addHorizontalSpace(
                            8,
                          ),
                          Icon(
                            Icons.calendar_today_outlined,
                            color: kColorSilver,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(
              thickness: 0.8,
            ),
          ),
          ProfileRewardBalanceSection(user: "self"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "03 Dec 2022, Sunday",
                  style: kHelper13,
                ),
                TransactionCard(),
                TransactionCard(),
                TransactionCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
