import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/widgets/sections/sections.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class MyBookingsPage extends StatefulWidget {
  static const routeName = "/my-bookings-page";
  const MyBookingsPage({super.key});

  @override
  State<MyBookingsPage> createState() => _MyBookingsPageState();
}

class _MyBookingsPageState extends State<MyBookingsPage> {
  final bookingsBloc = locator<BookingsBloc>();

  @override
  void dispose() {
    bookingsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "My Bookings",
        leadingWidget: SizedBox.shrink(),
        trailingWidget: SizedBox.shrink(),
      ),
      body: BlocBuilder<BookingsBloc, BookingsState>(
        bloc: bookingsBloc,
        builder: (context, state) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: double.infinity,
            child: Column(
              children: [
                BookingsCalenderSection(bloc: bookingsBloc),
                Expanded(
                  child: MyBookingsTabSection(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
