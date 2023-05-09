import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/booking_history_req.dart';
import 'package:cipher/features/bookings/data/models/bookings_response_dto.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/booked_service_page.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class HistorySection extends StatefulWidget {
  final BookingsBloc bloc;
  const HistorySection({super.key, required this.bloc});

  @override
  State<HistorySection> createState() => _HistorySectionState();
}

class _HistorySectionState extends State<HistorySection> {
  late final bookingsBloc = widget.bloc;
  List<Result> historyList = [];

  //initialize page controller
  final PagingController<int, Result> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    //so at event add list of records
    _pagingController.addPageRequestListener(
      (pageKey) => bookingsBloc.add(BookingHistory(bookingHistoryReq: BookingHistoryReq(page: pageKey))),
    );
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingsBloc, BookingsState>(
      bloc: bookingsBloc,
      listener: (context, state) {
        if (state.states == TheStates.success) {
          historyList = state.bookingHistoryRes.result!;

          final lastPage = state.bookingHistoryRes.totalPages!;
          final next = 1 + state.bookingHistoryRes.current!;

          if (next > lastPage) {
            _pagingController.appendLastPage(historyList);
          } else {
            _pagingController.appendPage(historyList, next);
          }
        }
        if (state.states == TheStates.failure) {
          _pagingController.error = 'Error';
        }
      },
      child: BlocBuilder<BookingsBloc, BookingsState>(
        builder: (context, state) {
          return PagedListView(
            pagingController: _pagingController,
            padding: EdgeInsets.symmetric(horizontal: 16),
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, Result item, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: BookingsServiceCard(
                    callback: () {
                      context.read<BookingsBloc>().add(
                            BookingSingleLoaded(item.booking ?? 0),
                          );

                      Navigator.pushNamed(
                        context,
                        BookedServicePage.routeName,
                        arguments: {'status': item.status},
                      );
                    },
                    hidePopupButton: true,
                    serviceName: item.title,
                    providerName:
                        "${item.entityService?.createdBy?.firstName} ${item.entityService?.createdBy?.lastName}",
                    mainContentWidget: showBookingDetail(item),
                    status: item.status,
                    bottomRightWidget: displayPrice(item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Expanded showBookingDetail(Result result) {
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
                  label: Jiffy(result.createdAt ?? DateTime.now().toString()).yMMMMd,
                  color: kColorBlue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: IconText(
                  iconData: Icons.watch_later_outlined,
                  label: "${result.startTime ?? '00:00'} ${result.endTime ?? ''}",
                  color: kColorGreen,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: IconText(
              iconData: Icons.location_on_outlined,
              label: 'No address found',
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
