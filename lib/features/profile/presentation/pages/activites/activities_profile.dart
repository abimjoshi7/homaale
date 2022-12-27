import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/activites/custom_activity_tracker.dart';
import 'package:flutter/material.dart';

class ActivitiesProfile extends StatelessWidget {
  const ActivitiesProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OrderTracker(
        status: Status.created,
        activeColor: Colors.blue.shade300,
      ),
    );
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
