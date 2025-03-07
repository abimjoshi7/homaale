import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/google_maps/presentation/google_maps_page.dart';
import 'package:cipher/features/google_maps/presentation/widgets/google_map_view.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TasksAndServicesNearbySection extends StatelessWidget {
  const TasksAndServicesNearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Column(
        children: <Widget>[
          SectionHeading(
            labelName: 'Tasks & Services Near You',
            onTap: () {
              if (CacheHelper.isLoggedIn == false) {
                notLoggedInPopUp(context);
              }
              if (CacheHelper.isLoggedIn) {
                Navigator.pushNamed(
                  context,
                  GoogleMapsPage.routeName,
                );
              }
            },
          ),
          addVerticalSpace(10),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AbsorbPointer(
                  child: Container(
                    width: 300,
                    height: 190.0,
                    child: GoogleMapsView(),
                  ),
                ),
                addVerticalSpace(20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
