import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/error/error_page.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BookedServicePage extends StatelessWidget {
  static const routeName = '/booked-service-page';
  const BookedServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookingsBloc, BookingsState>(
        builder: (context, state) {
          if (state.states == TheStates.initial) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.states == TheStates.success) {
            final booking = state.result!;
            return Column(
              children: [
                addVerticalSpace(
                  50,
                ),
                CustomHeader(
                  label: booking.entityService?.title,
                ),
                Expanded(
                  child: Column(
                    children: [],
                  ),
                ),
                PriceBookFooterSection(
                  price: "Rs. ${booking.budgetTo?.round()}",
                  bgColor: (getStatus(booking.status ?? '')["color"] as Color)
                      .withOpacity(
                    0.3,
                  ),
                  buttonLabel:
                      getStatus(booking.status ?? '')["status"] as String,
                  buttonColor:
                      getStatus(booking.status ?? '')["color"] as Color,
                  onPressed: () {},
                ),
              ],
            );
          }
          return ErrorPage();
        },
      ),
    );
  }
}
