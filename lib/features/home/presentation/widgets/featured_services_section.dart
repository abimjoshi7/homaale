import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RecentlyLaunchedServicesSection extends StatelessWidget {
  const RecentlyLaunchedServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding10,
      child: Column(
        children: <Widget>[
          SectionHeading(
            labelName: 'Recently Launched',
            onTap: () {
              if (CacheHelper.isLoggedIn == false) {
                notLoggedInPopUp(context);
              }
              if (CacheHelper.isLoggedIn) {}
            },
          ),
          kHeight10,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (context, index) => kWidth5,
              itemBuilder: (context, index) => Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kColorPrimary,
                    ),
                  ),
                  kHeight10,
                  const Text(
                    'Stitching & Printing',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
