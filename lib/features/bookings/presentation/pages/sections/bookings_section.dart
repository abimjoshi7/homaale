import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/extensions.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/sections/sections.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BookingsSection extends StatelessWidget {
  const BookingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingsState>(
      builder: (context, state) {
        if (state is BookEntityServiceLoadSuccess) {
          return Column(
            children: [
              const BookingsFilterSection(),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '25 Dec 2022, Sunday',
                    style: kHelper13,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => BookingsServiceCard(
                      color: Colors.blue,
                      serviceName: state.myBookingList.result?[index]
                              .entityService?.title ??
                          '',
                      providerName:
                          '${state.myBookingList.result?[index].entityService?.createdBy?.firstName} ${state.myBookingList.result?[index].entityService?.createdBy?.lastName}',
                      mainContentWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconText(
                            color: kColorBlue,
                            iconData: Icons.calendar_today_rounded,
                            label: '${DateFormat.yMMMd().format(
                              state.myBookingList.result?[index].createdAt ??
                                  DateTime.now(),
                            )} ${DateFormat.jm().format(
                              state.myBookingList.result?[index].createdAt ??
                                  DateTime.now(),
                            )}',
                          ),
                          IconText(
                            color: kColorGreen,
                            iconData: Icons.access_time_outlined,
                            label: '${DateFormat.yMMMd().format(
                              state.myBookingList.result?[index].startDate ??
                                  DateTime.now(),
                            )} - ${DateFormat.yMMMd().format(
                              state.myBookingList.result?[index].endDate ??
                                  DateTime.now(),
                            )}',
                          ),
                          IconText(
                            color: kColorAmber,
                            iconData: Icons.attach_money_outlined,
                            label:
                                'Rs. ${state.myBookingList.result?[index].budgetTo ?? ''}',
                          ),
                          IconText(
                            color: Colors.red,
                            iconData: Icons.location_on_outlined,
                            label:
                                '${state.myBookingList.result?[index].entityService?.location}',
                          ),
                        ],
                      ),
                      // status: 'In Progress',
                      bottomLeftWidget: const Text(
                        'View Detail',
                        style: kText15,
                      ),
                      bottomRightWidget: SizedBox(
                        width: 120,
                        child: CustomElevatedButton(
                          callback: () {},
                          label: state.myBookingList.result?[index].status
                                  ?.toCapitalized() ??
                              'Unknown',
                          mainColor: Colors.orangeAccent,
                          borderColor: Colors.orangeAccent,
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => kHeight10,
                    itemCount: state.myBookingList.result?.length ?? 1,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
