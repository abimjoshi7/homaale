import 'package:cipher/features/user/presentation/bloc/activities_timeline_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/date_time_representation.dart';
import '../../../../user/presentation/bloc/activities_timeline_state.dart';

class ActivitiesProfile extends StatelessWidget {
  const ActivitiesProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitiesTimelineBloc, ActivitiesTimelineState>(
        builder: (context, state) {
      return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.circle),
                              ),
                              Container(
                                height: 20,
                                width: 2,
                                color: Colors.blue,
                              ),
                              Icon(Icons.circle,
                                  size: 10, color: Colors.blueAccent),
                            ],
                          ),
                          title: Text(
                            state.activitiesTimeline?.result?[index].action ??
                                "",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  state.activitiesTimeline?.result?[index]
                                          .objectRepr ??
                                      "",
                                  style:
                                      Theme.of(context).textTheme.displayMedium),
                              if (state.activitiesTimeline!.result![index]
                                      .actionTime !=
                                  null)
                                Text(
                                    getVerboseDateTimeRepresentation(state
                                        .activitiesTimeline!
                                        .result![index]
                                        .actionTime!),
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                  itemCount: state.activitiesTimeline?.result?.length ?? 0,
                ),
              )
            ],
          )
          // OrderTracker(
          //   actionSubtitle: state.activitiesTimeline?.result?[1].action,
          //   status: Status.created,
          //   activeColor: Colors.blue.shade300,
          // ),
          );
    });

    // return ListView.builder(
    //   itemBuilder: (context, index) => Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20),
    //     child: Row(
    //       children: [
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Visibility(
    //               visible: index == 0,
    //               child: Container(
    //                 height: 7,
    //                 width: 7,
    //                 decoration: BoxDecoration(
    //                   shape: BoxShape.circle,
    //                   color: Colors.blue,
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 2.4),
    //               child: Container(
    //                 height: 40,
    //                 width: 2,
    //                 color: kColorGrey,
    //               ),
    //             ),
    //             Container(
    //               height: 7,
    //               width: 7,
    //               decoration: BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 color: kColorGrey,
    //               ),
    //             ),
    //           ],
    //         ),
    //         kWidth15,
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text("Task Created Successfully"),
    //     kHeight5,
    //     Text(
    //       "June 19. 2022",
    //       style: kHelper1,
    //     ),
    //   ],
    // ),
    //       ],
    //     ),
    //   ),
    //   itemCount: 5,
    // );
  }
}
