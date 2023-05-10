// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class TransactionCard extends StatefulWidget {
  final Widget? leadingWidget;
  final String? actionName;
  final String? actionFrom;
  final String? balance;
  final String? price;
  final Color? priceColor;
  final Icon? priceIcon;
  final String? time;
  final VoidCallback? theCallback;
  final String? transactionId;
  final String? paymentMethod;
  final String? sender;
  final String? reciever;
  final String? status;

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
    this.transactionId,
    this.paymentMethod,
    this.sender,
    this.reciever,
    this.status,
  }) : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  bool isMaximized = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isMaximized = !isMaximized;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Container(
          constraints: BoxConstraints.loose(
            Size(
              double.maxFinite,
              isMaximized ? 250 : 100,
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: widget.leadingWidget ??
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
                                  widget.actionName ?? "Amount Credited",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                AutoSizeText(
                                    widget.actionFrom ?? "Bank of Anerica"),
                              ],
                            ),
                            Visibility(
                              visible: !isMaximized,
                              child: Row(
                                children: [
                                  Text(
                                    "Balance :",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      widget.balance ?? "N/A",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                  ),
                                ],
                              ),
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
                            widget.priceIcon ?? Icon(Icons.keyboard_arrow_up),
                            Text(
                              widget.price ?? "10000.00",
                              style: TextStyle(
                                color: widget.priceColor ?? Colors.black,
                              ),
                            )
                          ],
                        ),
                        addVerticalSpace(
                          8,
                        ),
                        Visibility(
                          visible: !isMaximized,
                          child: Text(
                            widget.time ?? "07:45 PM",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Visibility(
                    visible: isMaximized,
                    child: Column(
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 30,
                                width: 90,
                                color: kColorSecondary,
                                child: Center(
                                    child: Text(
                                        widget.status?.toCapitalized() ?? "")),
                              )
                            ],
                          ),
                        ),
                        addVerticalSpace(8),
                        Flexible(
                          flex: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 130,
                                        child: Text("Transaction ID : ")),
                                    Flexible(
                                        child: AutoSizeText(
                                            widget.transactionId ?? "")),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 130,
                                        child:
                                            AutoSizeText("Payment Method : ")),
                                    Text(widget.paymentMethod ?? ""),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 130, child: Text("Sender : ")),
                                    Text(widget.sender ?? ""),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 130, child: Text("Reciever : ")),
                                    Text(widget.reciever ?? ""),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 130,
                                        child: Text("Transaction Date : ")),
                                    Text(widget.time ?? ""),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
