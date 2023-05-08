import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class FilterHeader extends StatelessWidget {
  const FilterHeader({
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
              onPressed: () {
                context.read<TransactionBloc>().add(
                      TransactionLoaded(),
                    );
              },
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
    );
  }
}
