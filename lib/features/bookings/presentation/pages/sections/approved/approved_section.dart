import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/sections/approved/approved.dart';
import 'package:cipher/features/bookings/presentation/pages/sections/sections.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ApprovedSection extends StatefulWidget {
  const ApprovedSection({super.key});

  @override
  State<ApprovedSection> createState() => _ApprovedSectionState();
}

class _ApprovedSectionState extends State<ApprovedSection> {
  int selectedIndex = 0;
  // List<String> l = [
  //   'All',
  //   'My Task',
  //   'My Orders',
  // ];
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
                            status: "approved",
                          ),
                        );
                    context.read<BookingsBloc>().add(
                          const MyTaskServiceBookingListLoadInitiated(
                            isTask: true,
                            status: "approved",
                          ),
                        );
                    break;
                  case 'Tasks':
                    context.read<BookingsBloc>().add(
                          const MyTaskServiceBookingListLoadInitiated(
                            isTask: true,
                            status: "approved",
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
                            status: "approved",
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
            ApprovedMainSection(
              selectedIndex: selectedIndex,
            ),
            addVerticalSpace(8),
          ],
        );
      },
    );
  }
}
