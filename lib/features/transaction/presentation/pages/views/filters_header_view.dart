import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class FiltersHeaderView extends StatelessWidget {
  const FiltersHeaderView({
    super.key,
  });

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
                          TransactionStatusChanged(
                            status: value?.toLowerCase(),
                          ),
                        );
                  },
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
                ).then(
                  (value) => context.read<TransactionBloc>().add(
                        TransactionDateChanged(
                          afterDate: value,
                        ),
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
                ).then(
                  (value) => context.read<TransactionBloc>().add(
                        TransactionDateChanged(
                          beforeDate: value,
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
