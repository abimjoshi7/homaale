import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/scroll_helper.dart';
import 'package:cipher/features/bloc/scroll_bloc.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/booking_item_detail_page.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/features/error_pages/no_internet_page.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:cipher/features/bookings/data/models/bookings_response_dto.dart'
    as bookings;

class HistorySection extends StatefulWidget {
  const HistorySection({super.key});

  @override
  State<HistorySection> createState() => _HistorySectionState();
}

class _HistorySectionState extends State<HistorySection> {
  List<bookings.Result> resultList = [];
  final _controller = ScrollController();
  final _scrollBloc = locator<ScrollBloc>();

  @override
  void initState() {
    super.initState();
    _scrollBloc.add(
      FetchItemsEvent(
        url: kBookingList,
        data: {},
        newFetch: true,
      ),
    );
    _controller.addListener(
      () {
        ScrollHelper.nextPageTrigger(
          _controller,
          _scrollBloc.add(
            FetchItemsEvent(
              url: kBookingList,
              data: {},
              newFetch: false,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollBloc, ScrollState>(
      bloc: _scrollBloc,
      builder: (context, state) {
        var bookingList = state.result
            .map((e) => bookings.Result.fromJson(e as Map<String, dynamic>))
            .toList();
        return state.theState == TheStates.initial
            ? SizedBox(child: Center(child: CardLoading(height: 500)))
            : bookingList.isEmpty
                ? Center(
                    child: CommonErrorContainer(
                    assetsPath: 'assets/no_data_found.png',
                    errorTile: 'Item not available.',
                    errorDes:
                        'We’re sorry, the data you search could not found.',
                  ))
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: _controller,
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          itemCount: state.hasReachedMax
                              ? bookingList.length
                              : bookingList.length + 1,
                          itemBuilder: (context, index) {
                            switch (state.theState) {
                              case TheStates.success:
                                if (index >= state.result.length) {
                                  _scrollBloc.add(
                                    FetchItemsEvent(
                                      url: kBookingList,
                                      data: {},
                                      newFetch: false,
                                    ),
                                  );
                                  return BottomLoader();
                                } else {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 16),
                                    child: BookingsServiceCard(
                                      cardColor: bookingList[index].entityService?.isRequested ==true ? kColorBlue: kColorOrange,
                                      callback: () {
                                        BlocProvider.of<BookingsBloc>(context)
                                            .add(
                                          BookingSingleLoaded(
                                              bookingList[index].id),
                                        );
                                        Navigator.pushNamed(context,
                                            BookingItemDetailPage.routeName,
                                            arguments: {'client': 'client'});
                                      },
                                      serviceName: bookingList[index].title,
                                      location: bookingList[index]
                                                  .entityService
                                                  ?.location
                                                  ?.length ==
                                              0
                                          ? "Remote"
                                          : bookingList[index]
                                              .entityService
                                              ?.location,
                                      providerName:
                                          "${bookingList[index].assignee?.firstName} ${bookingList[index].assignee?.lastName}",
                                      mainContentWidget: showBookingDetails(
                                          bookingList[index]),
                                      status: bookingList[index].status,
                                      hidePopupButton: true,
                                      bottomRightWidget:
                                          displayPrice(bookingList[index]),
                                    ),
                                  );
                                }

                              default:
                                return CardLoading(height: 200);
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 100),
                    ],
                  );
      },
    );
  }

  Expanded showBookingDetails(bookings.Result result) {
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
                  label: Jiffy(result.createdAt ?? DateTime.now().toString())
                      .yMMMMd,
                  color: kColorBlue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: IconText(
                  iconData: Icons.watch_later_outlined,
                  label:
                      "${result.startTime ?? '00:00'} ${result.endTime ?? ''}",
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

  Column displayPrice(bookings.Result result) {
    return Column(
      children: [
        Text(
          result.assignee?.id ==
                  context.read<UserBloc>().state.taskerProfile?.user?.id
              ? "Rs. ${Decimal.parse(result.earning ?? '0.0').toStringAsFixed(2)}"
              : "Rs. ${Decimal.parse(result.price ?? '0.0').toStringAsFixed(2)}",
          // "Rs. ${Decimal.parse(result.entityService?.budgetFrom ?? '0.0')} - Rs. ${Decimal.parse(result.entityService?.budgetTo ?? '0.0')}",
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
