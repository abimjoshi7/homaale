import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/pages/sections/history/history.dart';
import 'package:flutter/material.dart';

class HistorySection extends StatefulWidget {
  const HistorySection({super.key});

  @override
  State<HistorySection> createState() => _HistorySectionState();
}

class _HistorySectionState extends State<HistorySection> {
  int selectedIndex = 0;
  List<String> l = [
    'Booked By Me',
    'Booked By Others',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Wrap(
            spacing: 10,
            children: List.generate(
              l.length,
              (index) => ChoiceChip(
                label: Text(
                  l[index],
                ),
                selected: selectedIndex == index,
                onSelected: (value) async {
                  setState(
                    () {
                      selectedIndex = index;
                    },
                  );
                  if (selectedIndex == 1) {
                    // context.read<TaskBloc>().add(
                    //       MyTaskLoadInitiated(),
                    //     );
                  }
                },
                backgroundColor: Colors.white,
                selectedColor: kColorBlue,
                side: BorderSide(
                  color: selectedIndex == index ? kColorBlue : kColorGrey,
                ),
              ),
            ),
          ),
        ),
        HistoryTabMainSection(
          selectedIndex: selectedIndex,
        ),
      ],
    );
  }
}
