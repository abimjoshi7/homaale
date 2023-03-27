import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/booked_service_page.dart';
import 'package:cipher/features/bookings/presentation/widgets/edit_my_order.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
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
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<BookingsBloc>().add(
          const BookingLoaded(
            isTask: false,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingsState>(
      builder: (context, state) {
        if (state.states == TheStates.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.states == TheStates.success) {
          final allList = state.myBookingListModelService?.result;
          return Column(
            children: [
              if (widget.isCheckPending != null)
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return allList?[index].status == 'pending'
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BookingsServiceCard(
                                callback: () {
                                  context.read<BookingsBloc>().add(
                                        BookingSingleLoaded(
                                          allList?[index].id ?? 0,
                                        ),
                                      );
                                  Navigator.pushNamed(
                                    context,
                                    BookedServicePage.routeName,
                                  );
                                },
                                editTap: () async {
                                  if (allList?[index].status?.toLowerCase() == 'pending') {
                                    Navigator.pop(context);
                                    showEditForm(context, index);
                                  } else {
                                    Navigator.pop(context);
                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomToast(
                                          heading: 'Warning',
                                          content:
                                              'The service is already ${allList?[index].status?.toLowerCase()}. Cannot be edited!',
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
                                          id: allList?[index].id ?? 0,
                                        ),
                                      );
                                },
                                deleteTap: () {
                                  context.read<BookingsBloc>().add(
                                        BookingDeleted(
                                          id: allList?[index].id ?? 0,
                                        ),
                                      );
                                },
                                serviceName: allList?[index].entityService?.title,
                                providerName:
                                    "${allList?[index].entityService?.createdBy?.firstName} ${allList?[index].entityService?.createdBy?.lastName}",
                                mainContentWidget: showBookingDetail(allList, index),
                                status: allList?[index].status,
                                bottomRightWidget: displayPrice(allList, index),
                              ),
                            )
                          : SizedBox();
                    },
                    itemCount: allList?.length ?? 0,
                  ),
                ),
              if (widget.isCheckPending == null)
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BookingsServiceCard(
                          callback: () {
                            context.read<BookingsBloc>().add(
                                  BookingSingleLoaded(
                                    allList?[index].id ?? 0,
                                  ),
                                );
                            Navigator.pushNamed(
                              context,
                              BookedServicePage.routeName,
                            );
                          },
                          editTap: () async {
                            if (allList?[index].status?.toLowerCase() == 'pending') {
                              Navigator.pop(context);
                              showEditForm(context, index);
                            } else {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) => CustomToast(
                                    heading: 'Warning',
                                    content:
                                        'The service is already ${allList?[index].status?.toLowerCase()}. Cannot be edited!',
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
                                    id: allList?[index].id ?? 0,
                                  ),
                                );
                          },
                          deleteTap: () {
                            context.read<BookingsBloc>().add(
                                  BookingDeleted(
                                    id: allList?[index].id ?? 0,
                                  ),
                                );
                          },
                          serviceName: allList?[index].entityService?.title,
                          providerName:
                              "${allList?[index].entityService?.createdBy?.firstName} ${allList?[index].entityService?.createdBy?.lastName}",
                          mainContentWidget: showBookingDetail(allList, index),
                          status: allList?[index].status,
                          bottomRightWidget: displayPrice(allList, index),
                        ),
                      );
                    },
                    itemCount: allList?.length ?? 0,
                  ),
                ),
            ],
          );
        }
        return ErrorWidget(
          Exception(),
        );
      },
    );
  }

  Column displayPrice(List<Result>? allList, int index) {
    return Column(
      children: [
        Text(
          "Rs. ${allList?[index].budgetFrom ?? '0'} - Rs. ${allList?[index].budgetTo ?? '0'}",
          style: kText17,
        ),
        const Text(
          '/ project',
          style: kHelper13,
        ),
      ],
    );
  }

  Expanded showBookingDetail(List<Result>? allList, int index) {
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
                    allList?[index].createdAt ?? DateTime.now(),
                  ),
                  color: kColorBlue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: IconText(
                  iconData: Icons.watch_later_outlined,
                  label: "${allList?[index].startTime ?? '00:00'} ${allList?[index].endTime ?? ''}",
                  color: kColorGreen,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: IconText(
              iconData: Icons.location_on_outlined,
              label: allList?[index].location ?? 'No address found',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
