import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/extensions.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/widgets/edit_my_order.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/features/services/presentation/manager/single_entity_service_cubit.dart';
import 'package:cipher/features/services/presentation/pages/service_provider_page.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/posted_task_view_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BookingsMyOrder extends StatelessWidget {
  const BookingsMyOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TaskLoadSuccess) {
          final data = state.res.result;
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) =>
                  BlocListener<TaskBloc, TaskState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                child: GestureDetector(
                  onTap: () {
                    context.read<TaskBloc>().add(
                          SingleTaskLoadInititated(
                            id: data?[index].id ?? 'No ID',
                          ),
                        );
                    // print(index);
                    // print(state.res.result?.first.id);
                    // Navigator.pushNamed(
                    //   context,
                    //   PostedTaskViewPage.routeName,
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: BookingsServiceCard(
                      deleteTap: () {
                        print(state.res.toJson());
                        // context.read<BookingsBloc>().add(
                        //       ServiceBookingDeleteInitiated(
                        //           id: state.res.result?[index].id.to,
                        //           ),
                        //     );
                      },
                      serviceName: state.res.result?[index].title,
                      providerName:
                          "${state.res.result?[index].createdBy?.firstName} ${state.res.result?[index].createdBy?.lastName}",
                      mainContentWidget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: IconText(
                              iconData: Icons.calendar_today_rounded,
                              label: DateFormat().format(
                                state.res.result?[index].createdAt ??
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
                                  "${state.res.result?[index].startTime ?? '00:00'} ${state.res.result?[index].endTime ?? ''}",
                              color: kColorGreen,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: IconText(
                              iconData: Icons.attach_money_rounded,
                              label:
                                  "Rs. ${state.res.result?[index].budgetFrom ?? ''} - ${state.res.result?[index].budgetTo ?? ''}",
                              color: kColorAmber,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: IconText(
                              iconData: Icons.location_on_outlined,
                              label: state.res.result?[index].location ??
                                  'No address found',
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      status: 'In Progress',
                      bottomRightWidget: SizedBox(
                        width: 120,
                        child: CustomElevatedButton(
                          callback: () {},
                          label: 'Completed',
                          mainColor: Colors.green,
                          borderColor: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: state.res.result?.length ?? 0,
            ),
          );
        }
        return const Center(
          child: Text('Something went wrong. Try again later.'),
        );
      },
    );
  }
}
