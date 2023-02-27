import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/sections/bookings/book_all.dart';
import 'package:cipher/features/bookings/presentation/pages/sections/bookings/book_my_orders.dart';
import 'package:cipher/features/bookings/presentation/pages/sections/bookings/book_my_task.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  if (selectedIndex == 1) {
                    context.read<TaskBloc>().add(
                          MyTaskLoadInitiated(),
                        );
                  }
                  if (selectedIndex == 2) {
                    context.read<BookingsBloc>().add(
                          ServiceBookingListInitiated(),
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

class BookingsTabMainSection extends StatelessWidget {
  const BookingsTabMainSection({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const BookingsAll();
      case 1:
        return const BookingsMyTask();

      case 2:
        return const BookingsMyOrder();
      default:
        return const SizedBox.shrink();
    }
  }
}
