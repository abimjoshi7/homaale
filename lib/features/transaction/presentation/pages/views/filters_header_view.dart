// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class FiltersHeaderView extends StatefulWidget {
  final TransactionBloc bloc;
  const FiltersHeaderView({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  State<FiltersHeaderView> createState() => _FiltersHeaderViewState();
}

class _FiltersHeaderViewState extends State<FiltersHeaderView> {
  final dKey = GlobalKey<FormFieldState>();
  DateTime? fromDate;
  DateTime? toDate;
  String? status;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.filter_alt_outlined,
                color: kColorSilver,
              ),
            ),
            _buildStatus(context),
            addHorizontalSpace(
              8,
            ),
            _buildFromDate(context),
            addHorizontalSpace(
              8,
            ),
            _buildToDate(context),
            _buildClearFilters(context),
          ],
        ),
      ),
    );
  }

  InkWell _buildToDate(BuildContext context) {
    return InkWell(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(
            2000,
          ),
          lastDate: DateTime(
            2050,
          ),
        ).then(
          (value) {
            setState(() {
              toDate = value;
            });
            widget.bloc.add(
              TransactionLoaded(
                dateBefore: toDate,
                isCleared: true,
                dateAfter: fromDate,
                status: status,
              ),
            );
          },
        );
      },
      child: Container(
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
            children: toDate == null
                ? [
                    Text("To"),
                    addHorizontalSpace(
                      8,
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      color: kColorSilver,
                    ),
                  ]
                : [
                    Text(
                      DateFormat.MMMd().format(
                        toDate!,
                      ),
                    ),
                  ],
          ),
        ),
      ),
    );
  }

  Widget _buildFromDate(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(
                2000,
              ),
              lastDate: DateTime(
                2050,
              ),
            ).then(
              (value) {
                setState(() {
                  fromDate = value;
                });
                widget.bloc.add(
                  TransactionLoaded(
                    isCleared: true,
                    dateAfter: fromDate,
                    dateBefore: toDate,
                    status: status,
                  ),
                );
              },
            );
          },
          child: Container(
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
                  children: fromDate == null
                      ? [
                          Text("From"),
                          addHorizontalSpace(
                            8,
                          ),
                          Icon(
                            Icons.calendar_today_outlined,
                            color: kColorSilver,
                          ),
                        ]
                      : [
                          Text(
                            DateFormat.MMMd().format(
                              fromDate!,
                            ),
                          ),
                        ]),
            ),
          ),
        );
      },
    );
  }

  Padding _buildStatus(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        height: 100,
        width: 100,
        child: CustomDropDownField<String>(
          dropDownKey: dKey,
          list: kTransactionStatus,
          hintText: "Status",
          borderRadius: 16,
          onChanged: (value) {
            setState(() {
              status = value;
            });
            widget.bloc.add(
              TransactionLoaded(
                status: value?.toLowerCase(),
                dateAfter: fromDate,
                dateBefore: toDate,
                isCleared: true,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildClearFilters(
    BuildContext context,
  ) {
    return IconButton(
      onPressed: () {
        setState(() {
          status = null;
          toDate = null;
          fromDate = null;
        });
        widget.bloc.add(
          TransactionLoaded(
            isCleared: true,
          ),
        );
        dKey.currentState?.reset();
      },
      icon: Icon(
        Icons.clear,
        color: kColorSilver,
      ),
    );
  }
}
