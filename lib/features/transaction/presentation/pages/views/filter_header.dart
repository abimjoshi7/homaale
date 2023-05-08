import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../bloc/transaction_bloc.dart';

class FilterHeader extends StatefulWidget {
  const FilterHeader({
    super.key,
  });

  @override
  State<FilterHeader> createState() => _FilterHeaderState();
}

class _FilterHeaderState extends State<FilterHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                // context.read<TransactionBloc>().add(
                //       TransactionLoaded(
                //         pageNumber: 1,
                //       ),
                //     );
              },
              icon: Icon(
                Icons.filter_alt_outlined,
                color: kColorSilver,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: SizedBox(
                height: 100,
                width: 100,
                child: CustomDropDownField(
                  list: kTransactionStatus,
                  hintText: "Status",
                  borderRadius: 16,
                  onChanged: (value) {
                    context.read<TransactionBloc>().add(
                          TransactionLoaded(
                            pageNumber: 1,
                            status: value?.toLowerCase(),
                          ),
                        );
                    setState(() {});
                  },
                ),
              ),
            ),
            addHorizontalSpace(
              8,
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: SizedBox(
                height: 100,
                width: 100,
                child: CustomDropDownField(
                  list: kTransactionStatus,
                  hintText: "Dr/Cr",
                  borderRadius: 16,
                  onChanged: (value) {},
                ),
              ),
            ),
            addHorizontalSpace(
              8,
            ),
            InkWell(
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
    );
  }
}
