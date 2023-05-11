// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/widgets/applicants_information_dialog.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title ?? "",
              style: Theme.of(context).textTheme.headlineLarge,
              overflow: TextOverflow.ellipsis,
            ),
            IconText(
              iconData: Icons.person_2_outlined,
              color: kColorSecondary,
              label: name ?? "Homaale Affililate",
            ),
            IconText(
              iconData: Icons.location_on_outlined,
              color: kColorPink,
              label: location ?? "Remote",
            ),
            theChild ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
