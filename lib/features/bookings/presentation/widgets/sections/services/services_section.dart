import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/booked_service_page.dart';
import 'package:cipher/features/bookings/presentation/widgets/edit_my_order.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ServicesSection extends StatefulWidget {
  final bool? isCheckPending;
  const ServicesSection({super.key, this.isCheckPending});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  late final bookingsBloc = locator<BookingsBloc>();
  List<Result> serviceList = [];

  //initialize page controller
  final PagingController<int, Result> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    //so at event add list of records
    _pagingController.addPageRequestListener(
      (pageKey) => bookingsBloc.add(BookingLoaded(isTask: false, page: pageKey)),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bookingsBloc.close();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingsBloc, BookingsState>(
      bloc: bookingsBloc,
      listener: (context, state) {
        if (state.states == TheStates.initial) {
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
                  builderDelegate: PagedChildBuilderDelegate(itemBuilder: (context, Result item, index) {
                    return BookingsServiceCard(
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
                                content: 'The service is already ${item.status?.toLowerCase()}. Cannot be edited!',
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                isSuccess: true),
                          );
                        }
                      },
                      cancelTap: () {
                        context.read<BookingsBloc>().add(
                              BookingCancelled(
                                id: item.id ?? 0,
                              ),
                            );
                      },
                      deleteTap: () {
                        context.read<BookingsBloc>().add(
                              BookingDeleted(
                                id: item.id ?? 0,
                              ),
                            );
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
              // if (widget.isCheckPending == null)
              //   Expanded(
              //     child: ListView.builder(
              //       padding: EdgeInsets.zero,
              //       itemBuilder: (context, index) {
              //         return Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: BookingsServiceCard(
              //             callback: () {
              //               context.read<BookingsBloc>().add(
              //                     BookingSingleLoaded(
              //                       allList?[index].id ?? 0,
              //                     ),
              //                   );
              //               Navigator.pushNamed(
              //                 context,
              //                 BookedServicePage.routeName,
              //               );
              //             },
              //             editTap: () async {
              //               if (allList?[index].status?.toLowerCase() == 'pending') {
              //                 Navigator.pop(context);
              //                 showEditForm(context, index);
              //               } else {
              //                 Navigator.pop(context);
              //                 showDialog(
              //                   context: context,
              //                   builder: (context) => CustomToast(
              //                       heading: 'Warning',
              //                       content:
              //                           'The service is already ${allList?[index].status?.toLowerCase()}. Cannot be edited!',
              //                       onTap: () {
              //                         Navigator.pop(context);
              //                       },
              //                       isSuccess: true),
              //                 );
              //               }
              //             },
              //             cancelTap: () {
              //               context.read<BookingsBloc>().add(
              //                     BookingCancelled(
              //                       id: allList?[index].id ?? 0,
              //                     ),
              //                   );
              //             },
              //             deleteTap: () {
              //               context.read<BookingsBloc>().add(
              //                     BookingDeleted(
              //                       id: allList?[index].id ?? 0,
              //                     ),
              //                   );
              //             },
              //             serviceName: allList?[index].entityService?.title,
              //             providerName:
              //                 "${allList?[index].entityService?.createdBy?.firstName} ${allList?[index].entityService?.createdBy?.lastName}",
              //             mainContentWidget: showBookingDetail(allList, index),
              //             status: allList?[index].status,
              //             bottomRightWidget: displayPrice(allList, index),
              //           ),
              //         );
              //       },
              //       itemCount: allList?.length ?? 0,
              //     ),
              //   ),
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
