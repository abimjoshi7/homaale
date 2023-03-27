import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/booking_history_req.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/widgets/sections/history/history.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class HistorySection extends StatefulWidget {
  const HistorySection({super.key});

  @override
  State<HistorySection> createState() => _HistorySectionState();
}

class _HistorySectionState extends State<HistorySection> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<BookingsBloc>().add(
  //         BookingHistory(
  //           bookingHistoryReq: BookingHistoryReq(page: 1),
  //         ),
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingsState>(
      builder: (context, state) {
        // if (state.states == TheStates.initial) {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }
        // if (state.states == TheStates.success) {
        //   final bookingHistory = state.bookingHistoryRes?.result;
        //   return HistoryTabMainSection();
        // }
        return SizedBox();
      },
    );
  }
}
