import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/features/task/presentation/cubit/single_entity_task_cubit.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ApprovedMyServices extends StatelessWidget {
  const ApprovedMyServices({
    super.key,
  });

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
          return SizedBox.shrink();
          //   final myBookingList = state.myBookingListModelService?.myBookingList;
          //   return Expanded(
          //     child: ListView.builder(
          //       padding: EdgeInsets.zero,
          //       itemBuilder: (context, index) =>
          //           BlocListener<SingleEntityTaskCubit, SingleEntityTaskState>(
          //         listener: (context, state) {
          //           if (state is SingleEntityTaskLoadSuccess) {
          //             // Navigator.pushNamed(
          //             //   context,
          //             //   PostedTaskViewPage.routeName,
          //             // );
          //           }
          //         },
          //         child: GestureDetector(
          //           onTap: () async {
          //             // await context
          //             //     .read<SingleEntityTaskCubit>()
          //             //     .fetchSingleEntityTask(
          //             //       allTaskList?[index].id ?? 'No ID',
          //             //     )
          //             //     .then(
          //             //       (value) => Navigator.pushNamed(
          //             //         context,
          //             //         PostedTaskViewPage.routeName,
          //             //       ),
          //             //     );
          //           },
          //           child: Padding(
          //             padding: const EdgeInsets.all(
          //               8,
          //             ),
          //             child: BookingsServiceCard(
          //               deleteTap: () {},
          //               serviceName: myBookingList?[index].entityService?.title,
          //               providerName:
          //                   "${myBookingList?[index].createdBy?.user?.firstName} ${myBookingList?[index].createdBy?.user?.lastName}",
          //               mainContentWidget: Expanded(
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Padding(
          //                           padding: const EdgeInsets.all(3),
          //                           child: IconText(
          //                             iconData: Icons.calendar_today_rounded,
          //                             label: DateFormat.yMMMEd().format(
          //                               myBookingList?[index].createdAt ??
          //                                   DateTime.now(),
          //                             ),
          //                             color: kColorBlue,
          //                           ),
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.all(3),
          //                           child: IconText(
          //                             iconData: Icons.watch_later_outlined,
          //                             label:
          //                                 "${myBookingList?[index].startTime ?? '00:00'} ${myBookingList?[index].endTime ?? ''}",
          //                             color: kColorGreen,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                     Padding(
          //                       padding: const EdgeInsets.all(3),
          //                       child: IconText(
          //                         iconData: Icons.location_on_outlined,
          //                         label: myBookingList?[index].location ??
          //                             'No address found',
          //                         color: Colors.red,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               status: myBookingList?[index].status,
          //               bottomRightWidget: Column(
          //                 children: [
          //                   Text(
          //                     "Rs. ${myBookingList?[index].budgetFrom ?? '0'} - Rs. ${myBookingList?[index].budgetTo ?? '0'}",
          //                     style: kText17,
          //                   ),
          //                   Text(
          //                     '/ per project',
          //                     style: kHelper13,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       itemCount: myBookingList?.length ?? 0,
          //     ),
          //   );
        }
        return const Center(
          child: Text('Something went wrong. Try again later.'),
        );
      },
    );
  }
}
