import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/core/constants/extensions.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/widgets/edit_my_order.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/features/services/presentation/manager/single_entity_service_cubit.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ApprovedMyTask extends StatelessWidget {
  const ApprovedMyTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingsState>(
      builder: (context, state) {
        if (state.states == TheStates.success) {
          final myBookingList = state.myBookingListModelTask;

          return myBookingList != null
              ? Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => Padding(
                      padding: kPadding10,
                      child: BookingsServiceCard(
                        deleteTap: () {
                          context.read<BookingsBloc>().add(
                                BookingDeleted(
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
                                  TaskEntityServicePage.routeName,
                                ),
                              );
                        },
                        cardColor: Colors.blue,
                        serviceName:
                            myBookingList.result?[index].entityService?.title ??
                                '',
                        providerName:
                            '${myBookingList.result?[index].entityService?.createdBy?.firstName} ${myBookingList.result?[index].entityService?.createdBy?.lastName}',
                        mainContentWidget: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconText(
                                    color: kColorBlue,
                                    iconData: Icons.calendar_today_rounded,
                                    label: DateFormat.yMMMEd().format(
                                      myBookingList.result?[index].createdAt ??
                                          DateTime.now(),
                                    ),
                                  ),
                                  IconText(
                                    color: kColorGreen,
                                    iconData: Icons.access_time_outlined,
                                    label:
                                        "${myBookingList.result?[index].startTime ?? '00:00'} - ${myBookingList.result?[index].endTime ?? '00:00'}",
                                  ),
                                ],
                              ),
                              IconText(
                                color: Colors.red,
                                iconData: Icons.location_on_outlined,
                                label:
                                    '${myBookingList.result?[index].entityService?.location}',
                              ),
                            ],
                          ),
                        ),
                        status: myBookingList.result?[index].status,
                        bottomRightWidget: Column(
                          children: [
                            Text(
                              "Rs. ${myBookingList.result?[index].budgetFrom ?? '0'} - Rs. ${myBookingList.result?[index].budgetTo ?? ''}",
                              style: kText17,
                            ),
                            Text(
                              '/ per project',
                              style: kHelper13,
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: myBookingList.result?.length ?? 0,
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
