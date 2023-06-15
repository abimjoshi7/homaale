import 'package:cipher/features/bookings/presentation/bloc/book_event_handler_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/views/views.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ServiceBookingPage extends StatelessWidget {
  static const routeName = '/service-booking-page';
  const ServiceBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookEventHandlerBloc(),
      child: ServiceBookingMainView(),
    );
  }
}
