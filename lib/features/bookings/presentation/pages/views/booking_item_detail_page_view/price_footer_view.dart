import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/rating_reviews/presentation/rating_reviews_form.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/core/mixins/mixins.dart';

class PriceFooterView extends StatelessWidget with TheModalBottomSheet {
  const PriceFooterView({
    Key? key,
    required this.bookingsState,
  }) : super(key: key);

  final BookingsState bookingsState;

  @override
  Widget build(BuildContext context) {
    final isAssignee = bookingsState.bookingRes.assignee?.id ==
        context.read<UserBloc>().state.taskerProfile?.user?.id;
    return bookingsState.bookingRes.status == 'closed'
        ? bookingsState.bookingRes.isRated ?? false
            ? Container(
                width: MediaQuery.of(context).size.width,
                color: kColorLightSkyBlue,
                height: 100,
                child: Center(child: Text('Your task is completed')),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                color: kColorLightSkyBlue,
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Your task is completed'),
                      GestureDetector(
                        onTap: () {
                          showCustomBottomSheet(
                            context: context,
                            widget: RatingReviewsForm(),
                          );
                          // showModalBottomSheet(
                          //   constraints: BoxConstraints(
                          //     maxHeight:
                          //         MediaQuery.of(context)
                          //                 .size
                          //                 .height *
                          //             0.5,
                          //   ),
                          //   isScrollControlled: false,
                          //   isDismissible: false,
                          //   context: context,
                          //   builder: (context) =>
                          //       RatingReviewsForm(),
                          // );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: kColorPrimary,
                          ),
                          constraints: BoxConstraints(
                            minHeight: 30,
                            minWidth: 100,
                          ),
                          child: AutoSizeText(
                            textAlign: TextAlign.center,
                            'Review Task',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
        : PriceBookFooterSection(
            bgColor: Colors.blue.shade50,
            buttonLabel: statusToUpdate('${bookingsState.bookingRes.status}',
                isAssignee)["buttonLabel"] as String,
            buttonColor: statusToUpdate(
                    '${bookingsState.bookingRes.status}', isAssignee)["color"]
                as Color,
            price: bookingsState.bookingRes.assignee?.id !=
                    context.read<UserBloc>().state.taskerProfile?.user?.id
                ? 'Rs. ${Decimal.parse(bookingsState.bookingRes.price.toString()).toStringAsFixed(2)}'
                : 'Rs. ${Decimal.parse(bookingsState.bookingRes.earning.toString()).toStringAsFixed(2)}',
            // bookingsState.bookingRes.entityService?.budgetFrom != null
            //     ? 'Rs. ${Decimal.parse(bookingsState.bookingRes.entityService?.budgetFrom.toString() ?? '0.0')} - Rs. ${Decimal.parse(bookingsState.bookingRes.entityService?.budgetTo.toString() ?? '0.0')}'
            //     : 'Rs. ${Decimal.parse(bookingsState.bookingRes.entityService?.budgetTo.toString() ?? '0.0')}',
            onPressed: () {
              var taskToUpdate = statusToUpdate(
                  '${bookingsState.bookingRes.status}',
                  isAssignee)["status"] as String;

              if (bookingsState.bookingRes.status == 'initiated') {
                if (isAssignee) {
                  return;
                } else {
                  Navigator.pushNamed(
                    context,
                    Root.routeName,
                    arguments: {
                      "index": 1,
                    },
                  );
                }
              }
              if (bookingsState.bookingRes.status == 'open') {
                if (isAssignee) {
                  context.read<BookingsBloc>().add(
                        BookingStatusUpdate(
                          id: bookingsState.bookingRes.id!,
                          status: taskToUpdate,
                        ),
                      );
                } else {
                  return;
                }
              }

              if (bookingsState.bookingRes.status == 'completed') {
                if (isAssignee) {
                  return;
                } else {
                  context.read<BookingsBloc>().add(
                        BookingStatusUpdate(
                          id: bookingsState.bookingRes.id!,
                          status: taskToUpdate,
                        ),
                      );
                }
              }
              if (bookingsState.bookingRes.status == 'on_progress') {
                if (isAssignee) {
                  context.read<BookingsBloc>().add(
                        BookingStatusUpdate(
                          id: bookingsState.bookingRes.id!,
                          status: taskToUpdate,
                        ),
                      );
                } else {
                  return;
                }
              } else {
                context.read<BookingsBloc>().add(
                      BookingStatusUpdate(
                        id: bookingsState.bookingRes.id!,
                        status: taskToUpdate,
                      ),
                    );
              }
            },
          );
  }
}
