import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/bookings_response_dto.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/booking_item_detail_page.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

enum BookingSectionType { todo, myBooking }

class BookingSection extends StatefulWidget {
  final BookingsBloc bloc;
  final BookingSectionType bookingSectionType;

  const BookingSection(
      {super.key, required this.bloc, required this.bookingSectionType});

  @override
  State<BookingSection> createState() => _BookingSectionState();
}

class _BookingSectionState extends State<BookingSection> {
  late final bookingsBloc = widget.bloc;
  List<Result> resultList = [];

  //initialize page controller
  // final PagingController<int, Result> _pagingController =
  //     PagingController(firstPageKey: 1);

  // @override
  // void initState() {
  //   //so at event add list of records
  //   _pagingController.addPageRequestListener(
  //     (pageKey) => bookingsBloc.add(BookingLoaded(page: pageKey)),
  //   );
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _pagingController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingsBloc, BookingsState>(
      bloc: bookingsBloc,
      listener: (context, state) {
        if ((state.isUpdated) || (state.isCancelled) || (state.isRejected)) {
          // _pagingController.refresh();
        }

        if (state.states == TheStates.success) {
          resultList = state.bookingList.result!;

          final lastPage = state.bookingList.totalPages!;

          final next = 1 + state.bookingList.current!;

          if (next > lastPage) {
            // _pagingController.appendLastPage(resultList);
          } else {
            // _pagingController.appendPage(resultList, next);
          }
        }
        if (state.states == TheStates.failure) {
          // _pagingController.error = 'Error';
        }
      },
      child: BlocBuilder<BookingsBloc, BookingsState>(
        builder: (context, state) {
          return Column(
            children: [
              // Expanded(
              //   child: PagedListView(
              //     pagingController: _pagingController,
              //     padding: EdgeInsets.symmetric(horizontal: 8),
              //     builderDelegate: PagedChildBuilderDelegate(
              //       itemBuilder: (context, Result item, index) {
              //         return widget.bookingSectionType ==
              //                 BookingSectionType.todo
              //             ? item.assignee?.id ==
              //                     context
              //                         .read<UserBloc>()
              //                         .state
              //                         .taskerProfile
              //                         ?.user
              //                         ?.id
              //                 ? Container(
              //                     margin: EdgeInsets.only(bottom: 16),
              //                     child: BookingsServiceCard(
              //                       callback: () {
              //                         BlocProvider.of<BookingsBloc>(context)
              //                             .add(
              //                           BookingSingleLoaded(item.id),
              //                         );
              //                         Navigator.pushNamed(context,
              //                             BookingItemDetailPage.routeName,
              //                             arguments: {'client': 'merchant'});
              //                       },
              //                       serviceName: item.title,
              //                       providerName:
              //                           "${item.assigner?.firstName} ${item.assigner?.lastName}",
              //                       mainContentWidget: showBookingDetails(item),
              //                       status: item.status,
              //                       hidePopupButton: true,
              //                       bottomRightWidget: displayPrice(item),
              //                     ),
              //                   )
              //                 : SizedBox()
              //             : item.assigner?.id ==
              //                     context
              //                         .read<UserBloc>()
              //                         .state
              //                         .taskerProfile
              //                         ?.user
              //                         ?.id
              //                 ? Container(
              //                     margin: EdgeInsets.only(bottom: 16),
              //                     child: BookingsServiceCard(
              //                       callback: () {
              //                         BlocProvider.of<BookingsBloc>(context)
              //                             .add(
              //                           BookingSingleLoaded(item.id),
              //                         );
              //                         Navigator.pushNamed(context,
              //                             BookingItemDetailPage.routeName,
              //                             arguments: {'client': 'client'});
              //                       },
              //                       serviceName: item.title,
              //                       providerName:
              //                           "${item.assignee?.firstName} ${item.assignee?.lastName}",
              //                       mainContentWidget: showBookingDetails(item),
              //                       status: item.status,
              //                       hidePopupButton: true,
              //                       bottomRightWidget: displayPrice(item),
              //                     ),
              //                   )
              //                 : SizedBox();
              //       },
              //     ),
              //   ),
              // ),
              SizedBox(height: 100),
            ],
          );
        },
      ),
    );
  }

  Expanded showBookingDetails(Result result) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(3),
                child: IconText(
                  iconData: Icons.calendar_today_rounded,
                  label: DateFormat.yMMMEd().format(
                    DateTime.parse(
                        result.createdAt ?? DateTime.now().toString()),
                  ),
                  color: kColorBlue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: IconText(
                  iconData: Icons.watch_later_outlined,
                  label:
                      "${result.startTime ?? '00:00'} - ${result.endTime ?? '00:00'}",
                  color: kColorGreen,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: IconText(
              iconData: Icons.location_on_outlined,
              label: result.location ?? 'No address found',
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Column displayPrice(Result result) {
    return Column(
      children: [
        Text(
          "Rs. ${Decimal.parse(result.entityService?.budgetFrom ?? '0.0')} - Rs. ${Decimal.parse(result.entityService?.budgetTo ?? '0.0')}",
          // style: kText17,
        ),
        const Text(
          '/ project',
          // style: kHelper13,
        ),
      ],
    );
  }
}
