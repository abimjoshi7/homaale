import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/google_maps/presentation/cubit/nearby_task_entity_service_cubit.dart';
import 'package:cipher/features/google_maps/presentation/google_maps_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TasksAndServicesNearbySection extends StatelessWidget {
  const TasksAndServicesNearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding10,
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: 900,
                  height: 250.0,
                  child: GoogleMapsPage(),
                ),
                Flexible(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text(
                                    'Greenhouse Cleaning',
                                    style: Theme.of(context).textTheme.headlineSmall,
                                  ),
                                  const Icon(
                                    Icons.favorite_border,
                                    color: Color(
                                      0xfffe5050,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: const [
                                  CircleAvatar(
                                    radius: 10,
                                  ),
                                  kWidth10,
                                  Text(
                                    'Kantipur Nursery',
                                    style: kLightBlueText14,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const WidgetText(
                                    label: 'Buddhanagar',
                                    widget: Icon(
                                      Icons.location_on_outlined,
                                      size: 12,
                                      color: Color(0xfffe5050),
                                    ),
                                  ),
                                  const WidgetText(
                                    label: '3.4(190)',
                                    widget: Icon(
                                      Icons.star_rate_rounded,
                                      size: 14,
                                      color: Color(0xffFF9700),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    height: 30,
                                    child: CustomElevatedButton(
                                      callback: () {},
                                      label: 'Book Now',
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => kWidth5,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
