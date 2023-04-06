// import 'package:cipher/core/constants/constants.dart';
// import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart'
//     as mbl;
// import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
// import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
// import 'package:cipher/widgets/widgets.dart';
// import 'package:dependencies/dependencies.dart';
// import 'package:flutter/material.dart';

// class UnapprovedServices extends StatefulWidget {
//   const UnapprovedServices({super.key});

//   @override
//   State<UnapprovedServices> createState() => _UnapprovedServicesState();
// }

// class _UnapprovedServicesState extends State<UnapprovedServices> {
//   List<mbl.MyBookingList?>? myBookingList = [];

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BookingsBloc, BookingsState>(
//       builder: (context, state) {
//         if (state.states == TheStates.initial) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         if (state.states == TheStates.success) {
//           if (state.myBookingListModelService != null &&
//               state.myBookingListModelService?.myBookingList != null) {
//             for (final element
//                 in state.myBookingListModelService!.myBookingList!) {
//               if (element.status != "approved") {
//                 myBookingList?.add(element);
//               }
//             }
//           }
//           return Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.zero,
//               itemBuilder: (context, index) => Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: BookingsServiceCard(
//                   serviceName: myBookingList?[index]?.entityService?.title,
//                   providerName:
//                       "${myBookingList?[index]?.createdBy?.user?.firstName} ${myBookingList?[index]?.createdBy?.user?.lastName}",
//                   mainContentWidget: Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(3),
//                               child: IconText(
//                                 iconData: Icons.calendar_today_rounded,
//                                 label: DateFormat.yMMMEd().format(
//                                   myBookingList?[index]?.createdAt ??
//                                       DateTime.now(),
//                                 ),
//                                 color: kColorBlue,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(3),
//                               child: IconText(
//                                 iconData: Icons.watch_later_outlined,
//                                 label:
//                                     "${myBookingList?[index]?.startTime ?? '00:00'} ${myBookingList?[index]?.endTime ?? ''}",
//                                 color: kColorGreen,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(3),
//                           child: IconText(
//                             iconData: Icons.location_on_outlined,
//                             label: myBookingList?[index]?.location ??
//                                 'No address found',
//                             color: Colors.red,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   status: myBookingList?[index]?.status,
//                   bottomRightWidget: Column(
//                     children: [
//                       Text(
//                         "Rs. ${myBookingList?[index]?.budgetFrom ?? '0'} - Rs. ${myBookingList?[index]?.budgetTo ?? '0'}",
//                         style: kText17,
//                       ),
//                       const Text(
//                         '/ per project',
//                         style: kHelper13,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               itemCount: myBookingList?.length ?? 0,
//             ),
//           );
//         }
//         return const SizedBox.shrink();
//       },
//     );
//   }
// }
