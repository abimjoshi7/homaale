// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart';
import 'package:cipher/features/bookings/data/models/reject_req.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/booked_service_page.dart';
import 'package:cipher/features/bookings/presentation/widgets/edit_my_order.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/widgets/widgets.dart';

class ServicesSection extends StatefulWidget {
  final bool? isCheckPending;
  final BookingsBloc bloc;

  const ServicesSection({super.key, this.isCheckPending, required this.bloc});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  late final bookingsBloc = widget.bloc;
  List<Result> serviceList = [];

  //initialize page controller
  final PagingController<int, Result> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    //so at event add list of records
    _pagingController.addPageRequestListener(
      (pageKey) =>
          bookingsBloc.add(BookingLoaded(isTask: false, page: pageKey)),
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
        if ((state.isUpdated ?? false) ||
            (state.isCancelled ?? false) ||
            (state.isRejected ?? false)) {
          _pagingController.refresh();
        }

        if (state.states == TheStates.success) {
          serviceList = state.myBookingListModelService!.result!;

          final lastPage = state.myBookingListModelService!.totalPages!;
          final next = 1 + state.myBookingListModelService!.current!;

          if (next > lastPage) {
            _pagingController.appendLastPage(serviceList);
          } else {
            _pagingController.appendPage(serviceList, next);
          }
        }
        if (state.states == TheStates.failure) {
          _pagingController.error = 'Error';
        }
      },
      child: BlocBuilder<BookingsBloc, BookingsState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: PagedListView.separated(
                  pagingController: _pagingController,
                  separatorBuilder: (context, index) => addVerticalSpace(16),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, Result item, index) {
                    return widget.isCheckPending ?? false
                        ? item.status?.toLowerCase() == "pending"
                            ? BookingsServiceCard(
                                callback: () {
                                  context.read<BookingsBloc>().add(
                                        BookingSingleLoaded(
                                          item.id ?? 0,
                                        ),
                                      );
                                  Navigator.pushNamed(
                                    context,
                                    BookedServicePage.routeName,
                                  );
                                },
                                hidePopupButton: true,
                                serviceName: item.entityService?.title,
                                providerName:
                                    "${item.entityService?.createdBy?.firstName} ${item.entityService?.createdBy?.lastName}",
                                mainContentWidget: showBookingDetail(item),
                                status: item.status,
                                bottomRightWidget: displayPrice(item),
                              )
                            : SizedBox()
                        : BookingsServiceCard(
                            callback: () {
                              context.read<BookingsBloc>().add(
                                    BookingSingleLoaded(
                                      item.id ?? 0,
                                    ),
                                  );
                              Navigator.pushNamed(
                                context,
                                BookedServicePage.routeName,
                              );
                            },
                            editTap: () async {
                              if (item.status?.toLowerCase() == 'pending') {
                                Navigator.pop(context);
                                showEditForm(context, index);
                              } else {
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomToast(
                                      heading: 'Warning',
                                      content:
                                          'The service is already ${item.status?.toLowerCase()}. Cannot be edited!',
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      isSuccess: true),
                                );
                              }
                            },
                            cancelTap: () {
                              if (item.status?.toLowerCase() == 'pending') {
                                bookingsBloc.add(
                                  BookingCancelled(
                                      id: item.id ?? 0, isTask: false),
                                );
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomToast(
                                      heading: 'Warning',
                                      content:
                                          'The service is already ${item.status?.toLowerCase()}. Cannot be cancelled!',
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      isSuccess: true),
                                );
                              }
                            },
                            deleteTap: () {
                              if (item.status?.toLowerCase() == 'pending') {
                                bookingsBloc.add(
                                  BookingRejected(
                                      rejectReq:
                                          RejectReq(booking: item.id ?? 0),
                                      isTask: false),
                                );
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomToast(
                                      heading: 'Warning',
                                      content:
                                          'The service is already ${item.status?.toLowerCase()}. Cannot be removed!',
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      isSuccess: true),
                                );
                              }
                            },
                            serviceName: item.entityService?.title,
                            providerName:
                                "${item.entityService?.createdBy?.firstName} ${item.entityService?.createdBy?.lastName}",
                            mainContentWidget: showBookingDetail(item),
                            status: item.status,
                            bottomRightWidget: displayPrice(item),
                          );
                  }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Column displayPrice(Result result) {
    return Column(
      children: [
        Text(
          "Rs. ${result.budgetFrom ?? '0'} - Rs. ${result.budgetTo ?? '0'}",
          style: kText17,
        ),
        const Text(
          '/ project',
          style: kHelper13,
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
              label: result.location ?? 'No address found',
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showEditForm(BuildContext context, int index) {
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
                selectedIndex: index,
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
