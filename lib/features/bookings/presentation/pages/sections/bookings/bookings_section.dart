import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/sections/bookings/bookings.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class BookingsSection extends StatefulWidget {
  const BookingsSection({super.key});

  @override
  State<BookingsSection> createState() => _BookingsSectionState();
}

class _BookingsSectionState extends State<BookingsSection> {
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
                  if (selectedIndex == 0) {
                    // context.read<BookingsBloc>().add(
                    //       ServiceBookingListLoadInitiated(),
                    //     );
                  }
                  if (selectedIndex == 1) {
                    context.read<BookingsBloc>().add(
                          const MyTaskServiceBookingListLoadInitiated(
                            isTask: false,
                          ),
                        );
                  }
                  if (selectedIndex == 2) {
                    context.read<TaskBloc>().add(
                          AllTaskLoadInitiated(),
                        );
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
        BookingsTabMainSection(
          selectedIndex: selectedIndex,
        ),
      ],
    );
  }
}
