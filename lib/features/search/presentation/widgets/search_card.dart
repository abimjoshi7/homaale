// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/colors.dart';

class SearchCard extends StatelessWidget {
  final Widget? theChild;
  final String? title;
  final String? name;
  final String? location;
  const SearchCard({
    Key? key,
    this.theChild,
    this.title,
    this.name,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).colorScheme.shadow,
      surfaceTintColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                title ?? "",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      letterSpacing: 0.5,
                      wordSpacing: 2,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconText(
              iconData: Icons.person_2_outlined,
              color: kColorSecondary,
              label: name ?? "Homaale Affililate",
              size: 18.0,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    letterSpacing: 0.3,
                    wordSpacing: 1,
                  ),
              // style: ,
            ),
            IconText(
              iconData: Icons.location_on_outlined,
              color: kColorPink,
              label: location ?? "Remote",
              size: 18.0,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    letterSpacing: 0.3,
                    wordSpacing: 2,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: theChild ?? SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
