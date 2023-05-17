import 'package:cipher/features/google_maps/presentation/widgets/google_map_view.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({
    super.key,
  });
  static const routeName = '/google-maps-page';

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "Nearby Task & Services"),
      body: GoogleMapsView(),
    );
  }
}
 // BlocBuilder<NearbyTaskEntityServiceCubit,
                //     NearbyTaskEntityServiceState>(
                //   builder: (_, state) {
                //     if (state.theStates == TheStates.success) {
                //       if (state.nearbyTaskEntityServiceList == null);
                //       List<TaskEntityService> _taskList = state
                //           .nearbyTaskEntityServiceList!
                //           .where((element) => element.isRequested == true)
                //           .toList();

                //       List<TaskEntityService> _serviceList = state
                //           .nearbyTaskEntityServiceList!
                //           .where((element) => element.isRequested == false)
                //           .toList();
                //       return Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Padding(
                //             padding: const EdgeInsets.only(left: 10.0),
                //             child: Text(
                //               'Nearby Services',
                //               style: Theme.of(context).textTheme.titleMedium,
                //             ),
                //           ),
                //           buildNearbyServicesList(_serviceList, context),
                //           addVerticalSpace(20),
                //           Padding(
                //             padding: const EdgeInsets.only(left: 10.0),
                //             child: Text(
                //               'Nearby Tasks',
                //               style: Theme.of(context).textTheme.titleMedium,
                //             ),
                //           ),
                //           buildNearbyTaskList(_taskList),
                //         ],
                //       );
                //     }
                //     return CardLoading(height: 100);
                //   },
                // ),

  // SizedBox buildNearbyTaskList(List<TaskEntityService> _taskList) {
  //   return SizedBox(
  //                         height: 300,
  //                         width: double.infinity,
  //                         child: ListView.separated(
  //                           physics: NeverScrollableScrollPhysics(),
  //                           padding: EdgeInsets.zero,
  //                           itemBuilder: (context, index) => Card(
  //                             // color: Theme.of(context).cardColor,
  //                             child: Padding(
  //                               padding: const EdgeInsets.all(10),
  //                               child: Column(
  //                                 children: <Widget>[
  //                                   Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.spaceBetween,
  //                                     children: <Widget>[
  //                                       Expanded(
  //                                         child: Text(
  //                                           _taskList[index].title.toString(),
  //                                           style: Theme.of(context)
  //                                               .textTheme
  //                                               .bodySmall,
  //                                         ),
  //                                       ),
  //                                       Text(
  //                                         _taskList[index]
  //                                                 .currency!
  //                                                 .symbol
  //                                                 .toString() +
  //                                             _taskList[index]
  //                                                 .budgetTo
  //                                                 .toString() +
  //                                             ' - ' +
  //                                             _taskList[index]
  //                                                 .currency!
  //                                                 .symbol
  //                                                 .toString() +
  //                                             _taskList[index]
  //                                                 .budgetFrom
  //                                                 .toString(),
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .bodySmall,
  //                                       )
  //                                     ],
  //                                   ),
  //                                   kHeight10,
  //                                   Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.spaceBetween,
  //                                     children: <Widget>[
  //                                       Expanded(
  //                                         child: Row(
  //                                           children: <Widget>[
  //                                             CircleAvatar(
  //                                               radius: 8,
  //                                             ),
  //                                             // kWidth10,
  //                                             Text(_taskList[index]
  //                                                 .createdBy!
  //                                                 .fullName
  //                                                 .toString()),
  //                                           ],
  //                                         ),
  //                                       ),
  //                                       Text(
  //                                         'Per ' +
  //                                             _taskList[index]
  //                                                 .budgetType
  //                                                 .toString(),
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .bodySmall,
  //                                       ),
  //                                     ],
  //                                   ),
  //                                   kHeight10,
  //                                   Text(
  //                                     "${_taskList[index].description ?? ''}",
  //                                   ),
  //                                   kHeight10,
  //                                   Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.spaceBetween,
  //                                     children: <Widget>[
  //                                       Expanded(
  //                                         child: WidgetText(
  //                                           label: (_taskList[index]
  //                                                   .location!
  //                                                   .isNotEmpty)
  //                                               ? "${_taskList[index].location}"
  //                                                   "\n"
  //                                                   "${_taskList[index].city!.name}"
  //                                               : 'Remote',
  //                                           widget: Icon(
  //                                             Icons.location_on_outlined,
  //                                             color: Color(0xffFE5050),
  //                                             size: 13,
  //                                           ),
  //                                         ),
  //                                       ),
  //                                       WidgetText(
  //                                         label: DateFormat.yMMMd().format(
  //                                             _taskList[index].endDate!),
  //                                         widget: Icon(
  //                                           Icons.calendar_today,
  //                                           color: Color(0xffF06700),
  //                                           size: 13,
  //                                         ),
  //                                       ),
  //                                       WidgetText(
  //                                         label: _taskList[index]
  //                                             .startTime
  //                                             .toString(),
  //                                         widget: Icon(
  //                                           Icons.access_time_filled_outlined,
  //                                           color: Color(0xff3EAEFF),
  //                                           size: 13,
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                   kHeight10,
  //                                   const Divider(),
  //                                   Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.spaceAround,
  //                                     children: <Widget>[
  //                                       const WidgetText(
  //                                         label: 'Save',
  //                                         widget: Icon(
  //                                           Icons.bookmark_border,
  //                                           size: 19,
  //                                           color: Color(0xffFE5050),
  //                                         ),
  //                                       ),
  //                                       const WidgetText(
  //                                         label: 'Share',
  //                                         widget: Icon(
  //                                           Icons.share,
  //                                           size: 19,
  //                                           color: Color(0xff3EAEFF),
  //                                         ),
  //                                       ),
  //                                       WidgetText(
  //                                         label:
  //                                             "${_taskList[index].viewsCount ?? 0}",
  //                                         widget: Icon(
  //                                           Icons.supervisor_account_outlined,
  //                                           size: 19,
  //                                           color: Color(0xff2D2D66),
  //                                         ),
  //                                       ),
  //                                       SizedBox(
  //                                         height: 35,
  //                                         width: 100,
  //                                         child: CustomElevatedButton(
  //                                           callback: () {},
  //                                           label: 'Apply Now',
  //                                           mainColor: const Color(
  //                                             0xff38C675,
  //                                           ),
  //                                         ),
  //                                       )
  //                                     ],
  //                                   ),
  //                                   kHeight5
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                           separatorBuilder: (context, index) => kHeight10,
  //                           itemCount: 5,
  //                         ),
  //                       );
  // }

  // Container buildNearbyServicesList(
  //     List<TaskEntityService> _serviceList, BuildContext context) {
  //   return Container(
  //     // color: Theme.of(context).cardColor,
  //     height: 100.0,
  //     width: double.infinity,
  //     child: ListView.separated(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: _serviceList.length,
  //       itemBuilder: (context, index) => SizedBox(
  //         width: MediaQuery.of(context).size.width * 0.8,
  //         child: Card(
  //           color: Theme.of(context).cardColor,
  //           child: Padding(
  //             padding: const EdgeInsets.all(8),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     Text(
  //                       _serviceList[index].title.toString(),
  //                       style: Theme.of(context).textTheme.titleMedium,
  //                     ),
  //                     Icon(
  //                       Icons.favorite_border,
  //                       color: Color(
  //                         0xfffe5050,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 Row(
  //                   children: <Widget>[
  //                     CircleAvatar(
  //                       radius: 10,
  //                     ),
  //                     kWidth10,
  //                     Text(
  //                       _serviceList[index].createdBy!.fullName.toString(),
  //                       style: kLightBlueText14,
  //                     ),
  //                   ],
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     WidgetText(
  //                       label: (_serviceList[index].location!.isNotEmpty)
  //                           ? "${_serviceList[index].location}"
  //                           : 'Remote',
  //                       widget: Icon(
  //                         Icons.location_on_outlined,
  //                         size: 12,
  //                         color: Color(0xfffe5050),
  //                       ),
  //                     ),
  //                     WidgetText(
  //                       widget: Icon(
  //                         Icons.star_rate_rounded,
  //                         size: 14,
  //                         color: Color(0xffFF9700),
  //                       ),
  //                       label:
  //                           "${_serviceList.toList()[index].rating?.first.rating ?? 0.0} (${_serviceList.toList()[index].rating?.first.ratingCount ?? 0})",
  //                     ),
  //                     SizedBox(
  //                       width: 80,
  //                       height: 30,
  //                       child: CustomElevatedButton(
  //                         callback: () {},
  //                         label: 'Book Now',
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //       separatorBuilder: (context, index) => kWidth5,
  //     ),
  //   );
  // }
