import 'package:cipher/features/user/presentation/bloc/activities/bloc/activities_timeline_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/date_time_representation.dart';
import '../../../../../widgets/dashed_line_vertical_painter.dart';

class ActivitiesProfile extends StatelessWidget {
  const ActivitiesProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitiesTimelineBloc, ActivitiesTimelineState>(
        builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            // height: 25,
                            // width: 20,
                            // decoration: BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     border: Border.all(
                            //         width: 2, color: Colors.blueAccent)),
                            child: Icon(
                              Icons.check_circle,
                              size: 20,
                              color: Colors.blueAccent,
                            ),
                          ),
                          CustomPaint(
                              size: Size(2, 36),
                              painter: DashedLineVerticalPainter()),
                        ],
                      ),
                      title: Text(
                        state.activitiesTimeline?.result?[index].action ?? "",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              state.activitiesTimeline?.result?[index]
                                      .objectRepr ??
                                  "",
                              style: Theme.of(context).textTheme.displayMedium),
                          if (state.activitiesTimeline!.result![index]
                                  .actionTime !=
                              null)
                            Text(
                                getVerboseDateTimeRepresentation(state
                                    .activitiesTimeline!
                                    .result![index]
                                    .actionTime!),
                                style: Theme.of(context).textTheme.bodySmall),
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
      );
    });
  }
}
