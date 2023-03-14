import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/pages/sections/draft/draft.dart';
import 'package:flutter/material.dart';

class DraftSection extends StatefulWidget {
  const DraftSection({super.key});

  @override
  State<DraftSection> createState() => _DraftSectionState();
}

class _DraftSectionState extends State<DraftSection> {
  int selectedIndex = 0;
  List<String> l = [
    'All',
    'My Task',
    'My Orders',
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
                  if (selectedIndex == 2) {
                    // context.read<BookingsBloc>().add(
                    //       ServiceBookingListLoadInitiated(),
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
        DraftTabMainSection(
          selectedIndex: selectedIndex,
        ),
      ],
    );
  }
}
