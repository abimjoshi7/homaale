import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/cubit/single_entity_task_cubit.dart';
import 'package:cipher/features/task/presentation/pages/posted_task_view_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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
                  BlocListener<SingleEntityTaskCubit, SingleEntityTaskState>(
                listener: (context, state) {
                  if (state is SingleEntityTaskLoadSuccess) {
                    // Navigator.pushNamed(
                    //   context,
                    //   PostedTaskViewPage.routeName,
                    // );
                  }
                },
                child: GestureDetector(
                  onTap: () async {
                    await context
                        .read<SingleEntityTaskCubit>()
                        .fetchSingleEntityTask(
                          data?[index].id ?? 'No ID',
                        )
                        .then(
                          (value) => Navigator.pushNamed(
                            context,
                            PostedTaskViewPage.routeName,
                          ),
                        );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: BookingsServiceCard(
                      deleteTap: () {},
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
