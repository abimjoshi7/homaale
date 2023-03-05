import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/widgets/edit_my_order.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/features/services/presentation/manager/single_entity_service_cubit.dart';
import 'package:cipher/features/services/presentation/pages/service_provider_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BookingsMyTask extends StatelessWidget {
  const BookingsMyTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingState>(
      builder: (context, state) {
        if (state.states == TheStates.success) {
          final myBookingList = state.myBookingList;

          return myBookingList != null
              ? Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => Padding(
                      padding: kPadding10,
                      child: BookingsServiceCard(
                        deleteTap: () {
                          context.read<BookingsBloc>().add(
                                ServiceBookingDeleteInitiated(
                                  id: myBookingList.result![index].id!.toInt(),
                                ),
                              );
                        },
                        editTap: () async {
                          Future.delayed(
                            Duration.zero,
                            () => showModalBottomSheet(
                              constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.85,
                                minWidth: double.infinity,
                              ),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => Column(
                                children: [
                                  const CustomModalSheetDrawerIcon(),
                                  Expanded(
                                    child: EditMyOrdersForm(
                                      selectedIndex: index,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        callback: () async {
                          await context
                              .read<SingleEntityServiceCubit>()
                              .getSingleService(
                                myBookingList
                                        .result?[index].entityService?.id ??
                                    '',
                              )
                              .then(
                                (value) => Navigator.pushNamed(
                                  context,
                                  ServiceProviderPage.routeName,
                                ),
                              );
                        },
                        color: Colors.blue,
                        serviceName:
                            myBookingList.result?[index].entityService?.title ??
                                '',
                        providerName:
                            '${myBookingList.result?[index].entityService?.createdBy?.firstName} ${myBookingList.result?[index].entityService?.createdBy?.lastName}',
                        mainContentWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconText(
                              color: kColorBlue,
                              iconData: Icons.calendar_today_rounded,
                              label: '${DateFormat.yMMMd().format(
                                myBookingList.result?[index].createdAt ??
                                    DateTime.now(),
                              )} ${DateFormat.jm().format(
                                myBookingList.result?[index].createdAt ??
                                    DateTime.now(),
                              )}',
                            ),
                            IconText(
                              color: kColorGreen,
                              iconData: Icons.access_time_outlined,
                              label: '${DateFormat.yMMMd().format(
                                myBookingList.result?[index].startDate ??
                                    DateTime.now(),
                              )} - ${DateFormat.yMMMd().format(
                                myBookingList.result?[index].endDate ??
                                    DateTime.now(),
                              )}',
                            ),
                            IconText(
                              color: kColorAmber,
                              iconData: Icons.attach_money_outlined,
                              label:
                                  'Rs. ${myBookingList.result?[index].budgetTo ?? ''}',
                            ),
                            IconText(
                              color: Colors.red,
                              iconData: Icons.location_on_outlined,
                              label:
                                  '${myBookingList.result?[index].entityService?.location}',
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
                            // label: myBookingList.result?[index].status
                            //         ?.toCapitalized() ??
                            //     'Unknown',
                            mainColor: Colors.orangeAccent,
                            borderColor: Colors.orangeAccent,
                          ),
                        ),
                      ),
                    ),
                    itemCount: myBookingList.result?.length ?? 1,
                  ),
                )
              : const SizedBox();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
