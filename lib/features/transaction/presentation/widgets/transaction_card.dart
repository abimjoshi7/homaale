import 'package:cipher/core/constants/constants.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final Widget? leadingWidget;
  final String? actionName;
  final String? actionFrom;
  final String? balance;
  final String? price;
  final String? time;

  const TransactionCard({
    super.key,
    this.leadingWidget,
    this.actionName,
    this.actionFrom,
    this.balance,
    this.price,
    this.time,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Container(
        constraints: BoxConstraints.loose(
          Size(
            double.maxFinite,
            100,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            8,
          ),
          border: Border.all(
            color: Colors.white60,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.2, 2),
              color: Colors.black12,
              spreadRadius: 1.5,
              blurRadius: 0.5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  leadingWidget ?? Icon(Icons.ac_unit_rounded),
                  addHorizontalSpace(
                    8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            actionName ?? "Amount Credited",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          AutoSizeText(actionFrom ?? "Bank of Anerica"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Balance :",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              balance ?? "2,200.00",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price ?? "^10000.00",
                  ),
                  Text(
                    time ?? "07:45 PM",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
