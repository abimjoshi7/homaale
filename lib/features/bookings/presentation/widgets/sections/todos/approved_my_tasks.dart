import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
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
        return SizedBox.shrink();
        // if (state.states == TheStates.success) {
        //   final myBookingList = state.myBookingListModelTask;

        //   return myBookingList != null
        //       ? Expanded(
        //           child: ListView.builder(
        //             padding: EdgeInsets.zero,
        //             itemBuilder: (context, index) => Padding(
        //               padding: kPadding10,
        //               child: BookingsServiceCard(
        //                 deleteTap: () {
        //                   context.read<BookingsBloc>().add(
        //                         ServiceBookingDeleteInitiated(
        //                           id: myBookingList.myBookingList![index].id!
        //                               .toInt(),
        //                         ),
        //                       );
        //                 },
        //                 editTap: () async {
        //                   Future.delayed(
        //                     Duration.zero,
        //                     () => showModalBottomSheet(
        //                       constraints: BoxConstraints(
        //                         maxHeight:
        //                             MediaQuery.of(context).size.height * 0.85,
        //                         minWidth: double.infinity,
        //                       ),
        //                       isScrollControlled: true,
        //                       context: context,
        //                       builder: (context) => Column(
        //                         children: [
        //                           const CustomModalSheetDrawerIcon(),
        //                           Expanded(
        //                             child: EditMyOrdersForm(
        //                               selectedIndex: index,
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   );
        //                 },
        //                 callback: () async {
        //                   await context
        //                       .read<SingleEntityServiceCubit>()
        //                       .getSingleService(
        //                         myBookingList.myBookingList?[index]
        //                                 .entityService?.id ??
        //                             '',
        //                       )
        //                       .then(
        //                         (value) => Navigator.pushNamed(
        //                           context,
        //                           ServiceProviderPage.routeName,
        //                         ),
        //                       );
        //                 },
        //                 cardColor: Colors.blue,
        //                 serviceName: myBookingList
        //                         .myBookingList?[index].entityService?.title ??
        //                     '',
        //                 providerName:
        //                     '${myBookingList.myBookingList?[index].entityService?.createdBy?.firstName} ${myBookingList.myBookingList?[index].entityService?.createdBy?.lastName}',
        //                 mainContentWidget: Expanded(
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           IconText(
        //                             color: kColorBlue,
        //                             iconData: Icons.calendar_today_rounded,
        //                             label: DateFormat.yMMMEd().format(
        //                               myBookingList.myBookingList?[index]
        //                                       .createdAt ??
        //                                   DateTime.now(),
        //                             ),
        //                           ),
        //                           IconText(
        //                             color: kColorGreen,
        //                             iconData: Icons.access_time_outlined,
        //                             label:
        //                                 "${myBookingList.myBookingList?[index].startTime ?? '00:00'} - ${myBookingList.myBookingList?[index].endTime ?? '00:00'}",
        //                           ),
        //                         ],
        //                       ),
        //                       IconText(
        //                         color: Colors.red,
        //                         iconData: Icons.location_on_outlined,
        //                         label:
        //                             '${myBookingList.myBookingList?[index].entityService?.location}',
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 status: myBookingList.myBookingList?[index].status,
        //                 bottomRightWidget: Column(
        //                   children: [
        //                     Text(
        //                       "Rs. ${myBookingList.myBookingList?[index].budgetFrom ?? '0'} - Rs. ${myBookingList.myBookingList?[index].budgetTo ?? ''}",
        //                       style: kText17,
        //                     ),
        //                     Text(
        //                       '/ per project',
        //                       style: kHelper13,
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             itemCount: myBookingList.myBookingList?.length ?? 0,
        //           ),
        //         )
        //       : const SizedBox();
        // }
        // return const Center(
        //   child: CircularProgressIndicator(),
        // );
      },
    );
  }
}
