// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';

class TransactionCard extends StatelessWidget {
  final Widget? leadingWidget;
  final String? actionName;
  final String? actionFrom;
  final String? balance;
  final String? price;
  final Color? priceColor;
  final Icon? priceIcon;
  final String? time;
  final VoidCallback? theCallback;

  const TransactionCard({
    Key? key,
    this.leadingWidget,
    this.actionName,
    this.actionFrom,
    this.balance,
    this.price,
    this.priceColor,
    this.priceIcon,
    this.time,
    this.theCallback,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: theCallback,
      child: Padding(
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
            color: context
                        .read<ThemeBloc>()
                        .state
                        .toString()
                        .contains("ThemeLight") ==
                    true
                ? Colors.white
                : Colors.black,
            borderRadius: BorderRadius.circular(
              8,
            ),
            border: Border.all(
              color: context
                          .read<ThemeBloc>()
                          .state
                          .toString()
                          .contains("ThemeLight") ==
                      true
                  ? Colors.white60
                  : Colors.black87,
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.2, 2),
                color: context
                            .read<ThemeBloc>()
                            .state
                            .toString()
                            .contains("ThemeLight") ==
                        true
                    ? Colors.black12
                    : Colors.white12,
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
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: leadingWidget ??
                          Icon(
                            Icons.ac_unit_rounded,
                          ),
                    ),
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
                                balance ?? "N/A",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
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
                    Row(
                      children: [
                        priceIcon ?? Icon(Icons.keyboard_arrow_up),
                        Text(
                          price ?? "10000.00",
                          style: TextStyle(
                            color: priceColor ?? Colors.black,
                          ),
                        )
                      ],
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
      ),
    );
  }
}
