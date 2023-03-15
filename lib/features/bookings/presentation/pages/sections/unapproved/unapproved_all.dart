import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class UnapprovedAll extends StatefulWidget {
  const UnapprovedAll({
    super.key,
  });

  @override
  State<UnapprovedAll> createState() => _UnapprovedAllState();
}

class _UnapprovedAllState extends State<UnapprovedAll> {
  List<Result?>? allList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingsState>(
      builder: (context, state) {
        if (state.states == TheStates.success) {
          for (final element1 in state.myBookingListModelService!.result!) {
            for (final element in state.myBookingListModelTask!.result!) {
              if (element.status != "approved" &&
                  element1.status != "approved") {
                allList?.add(element);
                allList?.add(element1);
              }
            }
          }

          return Expanded(
            child: Column(
              children: [
                // const Padding(
                //   padding: EdgeInsets.all(5),
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text(
                //       '04 Dec 2022, Sunday',
                //       style: kHelper13,
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => BookingsServiceCard(
                        serviceName: allList?[index]?.entityService?.title,
                        providerName:
                            "${allList?[index]?.createdBy?.user?.firstName} ${allList?[index]?.createdBy?.user?.lastName}",
                        mainContentWidget: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: IconText(
                                      iconData: Icons.calendar_today_rounded,
                                      label: DateFormat.yMMMEd().format(
                                        allList?[index]?.createdAt ??
                                            DateTime.now(),
                                      ),
                                      color: kColorBlue,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: IconText(
                                      iconData: Icons.watch_later_outlined,
                                      label:
                                          "${allList?[index]?.startTime ?? '00:00'} ${allList?[index]?.endTime ?? ''}",
                                      color: kColorGreen,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: IconText(
                                  iconData: Icons.location_on_outlined,
                                  label: allList?[index]?.location ??
                                      'No address found',
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        status: allList?[index]?.status,
                        bottomRightWidget: Column(
                          children: [
                            Text(
                              "Rs. ${allList?[index]?.budgetFrom ?? '0'} - Rs. ${allList?[index]?.budgetTo ?? '0'}",
                              style: kText17,
                            ),
                            const Text(
                              '/ project',
                              style: kHelper13,
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) => kHeight10,
                      itemCount: allList?.length ?? 0,
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
