// import 'package:cipher/core/constants/constants.dart';
// import 'package:cipher/features/bookings/data/models/booking_history_res.dart';
// import 'package:cipher/features/bookings/data/models/reject_req.dart';
// import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
// import 'package:cipher/features/bookings/presentation/pages/booked_service_page.dart';
// import 'package:cipher/features/bookings/presentation/widgets/edit_my_order.dart';
// import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
// import 'package:cipher/widgets/widgets.dart';
// import 'package:dependencies/dependencies.dart';
// import 'package:flutter/material.dart';

// class TaskSection extends StatefulWidget {
//   final BookingsBloc bloc;
//   const TaskSection({super.key, required this.bloc});

//   @override
//   State<TaskSection> createState() => _TaskSectionState();
// }

// class _TaskSectionState extends State<TaskSection> {
//   late final bookingsBloc = widget.bloc;
//   List<Result> todoList = [];

//   //initialize page controller
//   final PagingController<int, Result> _pagingController = PagingController(firstPageKey: 1);

//   @override
//   void initState() {
//     //so at event add list of records
//     _pagingController.addPageRequestListener(
//       (pageKey) => bookingsBloc.add(BookingLoaded(isTask: true, page: pageKey)),
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _pagingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<BookingsBloc, BookingsState>(
//       bloc: bookingsBloc,
//       listener: (context, state) {
//         if ((state.isUpdated) || (state.isCancelled) || (state.isRejected)) {
//           _pagingController.refresh();
//         }

//         if (state.states == TheStates.success) {
//           todoList = state.myBookingListModelTask.result!;

//           final lastPage = state.myBookingListModelTask.totalPages!;
//           final next = 1 + state.myBookingListModelTask.current!;

//           if (next > lastPage) {
//             _pagingController.appendLastPage(todoList);
//           } else {
//             _pagingController.appendPage(todoList, next);
//           }
//         }
//         if (state.states == TheStates.failure) {
//           _pagingController.error = 'Error';
//         }
//       },
//       child: BlocBuilder<BookingsBloc, BookingsState>(
//         builder: (context, state) {
//           return Column(
//             children: [
//               Expanded(
//                 child: PagedListView.separated(
//                   pagingController: _pagingController,
//                   separatorBuilder: (context, index) => addVerticalSpace(16),
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   builderDelegate: PagedChildBuilderDelegate(
//                     itemBuilder: (context, Result item, index) => BookingsServiceCard(
//                       callback: () {
//                         // BlocProvider.of<BookingsBloc>(context).add(
//                         //   BookingSingleLoaded(item. ?? 0),
//                         // );
//                         // Navigator.pushNamed(
//                         //   context,
//                         //   BookedServicePage.routeName,
//                         // );
//                       },
//                       serviceName: item.title,
//                       providerName: "${item.assigner?.firstName} ${item.assigner?.lastName}",
//                       mainContentWidget: showBookingDetails(item),
//                       status: item.status,
//                       hidePopupButton: true,
//                       bottomRightWidget: displayPrice(item),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Expanded showBookingDetails(Result result) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(3),
//                 child: IconText(
//                   iconData: Icons.calendar_today_rounded,
//                   label: DateFormat.yMMMEd().format(
//                     DateTime.parse(result.createdAt ?? DateTime.now().toString()),
//                   ),
//                   color: kColorBlue,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(3),
//                 child: IconText(
//                   iconData: Icons.watch_later_outlined,
//                   label: "${result.startTime ?? '00:00'} - ${result.endTime ?? '00:00'}",
//                   color: kColorGreen,
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(3),
//             child: IconText(
//               iconData: Icons.location_on_outlined,
//               label: result.location ?? 'No address found',
//               color: Colors.red,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Column displayPrice(Result result) {
//     return Column(
//       children: [
//         Text(
//           "Rs. ${Decimal.parse(result.entityService?.budgetFrom ?? '0.0')} - Rs. ${Decimal.parse(result.entityService?.budgetTo ?? '0.0')}",
//           // style: kText17,
//         ),
//         const Text(
//           '/ project',
//           // style: kHelper13,
//         ),
//       ],
//     );
//   }
// }
