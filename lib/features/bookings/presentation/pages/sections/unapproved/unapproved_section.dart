import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/sections/sections.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class UnapprovedSection extends StatefulWidget {
  const UnapprovedSection({super.key});

  @override
  State<UnapprovedSection> createState() => _UnapprovedSectionState();
}

class _UnapprovedSectionState extends State<UnapprovedSection> {
  int selectedIndex = 0;
  List<String> l = [
    "Booked By Me",
    "Booked By Others",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabFilterSection(
              stringCallback: (p0) {
                switch (p0) {
                  case 'All':
                    setState(() {
                      selectedIndex = 0;
                    });
                    context.read<BookingsBloc>().add(
                          const MyTaskServiceBookingListLoadInitiated(
                            isTask: false,
                          ),
                        );
                    context.read<BookingsBloc>().add(
                          const MyTaskServiceBookingListLoadInitiated(
                            isTask: true,
                          ),
                        );
                    break;
                  case 'Tasks':
                    context.read<BookingsBloc>().add(
                          const MyTaskServiceBookingListLoadInitiated(
                            isTask: true,
                          ),
                        );
                    setState(() {
                      selectedIndex = 1;
                    });
                    break;
                  case 'Services':
                    context.read<BookingsBloc>().add(
                          const MyTaskServiceBookingListLoadInitiated(
                            isTask: false,
                          ),
                        );
                    setState(() {
                      selectedIndex = 2;
                    });
                    break;
                  default:
                    break;
                }
              },
            ),
            addVerticalSpace(8),
            UnapprovedMainSection(
              selectedIndex: selectedIndex,
            ),
            addVerticalSpace(8),
          ],
        );
      },
    );
  }
}
