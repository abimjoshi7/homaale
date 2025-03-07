// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/features/bloc/scroll_bloc.dart';
import 'package:cipher/features/booking_cancel/presentation/pages/booking_cancel_page.dart';
import 'package:cipher/features/bookings/data/models/reject_req.dart';
import 'package:cipher/features/bookings/presentation/pages/booked_service_page.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/widgets/edit_my_order.dart';
import 'package:cipher/widgets/widgets.dart';

import '../../../bookings/data/models/my_booking_list_model.dart';
import '../../../error_pages/no_internet_page.dart';

class WaitingListTab extends StatefulWidget {
  final BookingsBloc bloc;

  const WaitingListTab({super.key, required this.bloc});

  @override
  State<WaitingListTab> createState() => _WaitingListTabState();
}

class _WaitingListTabState extends State<WaitingListTab> {
  late final bookingsBloc = widget.bloc;
  List<Result> serviceList = [];
  final _controller = ScrollController();
  final _scrollBloc = locator<ScrollBloc>();

  @override
  void initState() {
    super.initState();
    _scrollBloc.add(
      FetchItemsEvent(
        url: kMyBookingList,
        data: {
          "status": "pending",
          "is_accepted": false,
        },
        newFetch: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollBloc, ScrollState>(
      bloc: _scrollBloc,
      builder: (context, state) {
        var data = state.result
            .map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList();
        if (state.theState == TheStates.success) {
          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    _scrollBloc.add(
                      FetchItemsEvent(
                        url: kMyBookingList,
                        data: {
                          "is_accepted": false,
                          "status": "pending",
                        },
                        newFetch: true,
                      ),
                    );
                  },
                  child: data.length == 0
                      ? Center(
                          child: CommonErrorContainer(
                          assetsPath: 'assets/no_data_found.png',
                          errorTile: 'Waiting for Payment Item not available right Now.',
                        ))
                      : ListView.builder(
                          controller: _controller,
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: state.hasReachedMax
                              ? data.length
                              : data.length + 1,
                          itemBuilder: (context, index) {
                            if (index >= data.length) {
                              _scrollBloc.add(
                                FetchItemsEvent(
                                  url: kMyBookingList,
                                  data: {
                                    // "is_accepted": false,
                                    "status": "pending",
                                  },
                                  newFetch: false,
                                ),
                              );
                              return BottomLoader();
                            }
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: BookingsServiceCard(
                                theHeight: 200,
                                // "isTask" is only passed in waiting list box feature
                                isTask:
                                    data[index].entityService?.isRequested ==
                                        true,
                                hideImage: false,
                                callback: () {
                                  context.read<BookingsBloc>().add(
                                        BookingSingleLoaded(
                                          data[index].id ?? 0,
                                        ),
                                      );
                                  Navigator.pushNamed(
                                    context,
                                    BookedServicePage.routeName,
                                    arguments: {
                                      "is_task": data[index]
                                              .entityService
                                              ?.isRequested ==
                                          true
                                    },
                                  );
                                },
                                editTap: () async {
                                  if (data[index].status?.toLowerCase() ==
                                      'pending') {
                                    Navigator.pop(context);
                                    showEditForm(context, data[index]);
                                  } else {
                                    Navigator.pop(context);
                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomToast(
                                          heading: 'Warning',
                                          content:
                                              'The task is already ${data[index].status?.toLowerCase()}. Cannot be edited!',
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          isSuccess: true),
                                    );
                                  }
                                },
                                deleteTap: () {
                                  if (data[index].status?.toLowerCase() ==
                                      'pending') {
                                    bookingsBloc.add(
                                      BookingRejected(
                                          rejectReq: RejectReq(
                                              booking: data[index].id ?? 0),
                                          isTask: true),
                                    );
                                    Navigator.pop(context);
                                  } else {
                                    Navigator.pop(context);
                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomToast(
                                          heading: 'Warning',
                                          content:
                                              'The task is already ${data[index].status?.toLowerCase()}. Cannot be removed!',
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          isSuccess: true),
                                    );
                                  }
                                },
                                cancelTap: () {
                                  Navigator.pop(context);
                                  if (data[index].status?.toLowerCase() ==
                                      'pending') {
                                    // bookingsBloc.add(
                                    //   BookingCancelled(
                                    //       id: data[index].id ?? 0, isTask: true),
                                    // );
                                    // Navigator.pop(context);
                                    Navigator.pushNamed(
                                        context, BookingCancelPage.routeName,
                                        arguments: {
                                          'client': data[index]
                                                      .entityService
                                                      ?.isRequested ==
                                                  false
                                              ? 'client'
                                              : 'merchant',
                                        });
                                  } else {
                                    Navigator.pop(context);
                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomToast(
                                          heading: 'Warning',
                                          content:
                                              'The task is already ${data[index].status?.toLowerCase()}. Cannot be cancelled!',
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          isSuccess: true),
                                    );
                                  }
                                },
                                serviceName: data[index].entityService?.title,
                                providerName:
                                    "${data[index].entityService?.createdBy?.firstName} ${data[index].entityService?.createdBy?.lastName}",
                                location: data[index].location?.length == 0
                                    ? "Remote"
                                    : data[index].location,
                                startTime: data[index].startTime,
                                endTime: data[index].endTime,
                                createdAt: data[index].createdAt,
                                // mainContentWidget: showBookingDetail(data[index]),
                                status: data[index].status,
                                thirdWidget: displayPrice(data[index]),
                                bottomRightWidget: const Text(
                                  'Booking Details',
                                  style: TextStyle(
                                    color: kColorSecondary,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
              SizedBox(height: 100)
            ],
          );
        }
        return CardLoading(height: 200);
      },
    );
  }

  Widget displayPrice(Result result) {
    return Row(
      children: [
        Text(
          "${result.entityService?.currency?.symbol ?? "Rs."} ${Decimal.parse(result.entityService?.isRequested == true ? result.earning ?? '0.0' : result.price ?? '0.0')}",
          // style: kText17,
        ),
        Text(
          '/ ${result.entityService?.budgetType}     ',
          // style: kHelper13,
        ),
      ],
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
                  label: DateFormat.yMMMEd().format(
                    result.createdAt ?? DateTime.now(),
                  ),
                  color: kColorBlue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: IconText(
                  iconData: Icons.watch_later_outlined,
                  label: "${DateFormat.jm().format(
                    DateFormat('hh:mm:ss')
                        .parse(result.startTime ?? '00:00:00'),
                  )} - ${DateFormat.jm().format(
                    DateFormat('hh:mm:ss').parse(result.endTime ?? '00:00:00'),
                  )}",
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

  Future<dynamic> showEditForm(BuildContext context, Result result) {
    return Future.delayed(
      Duration.zero,
      () async => showModalBottomSheet(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) => Column(
          children: [
            CustomModalSheetDrawerIcon(),
            Expanded(
              child: EditMyOrdersForm(
                result: result,
                isTask: false,
                bookingsBloc: bookingsBloc,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
