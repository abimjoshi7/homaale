import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/theme.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../features/theme/presentation/bloc/theme_bloc.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.labelName,
    required this.onTap,
    this.showCaseTitle,
    this.showCaseDec,
    this.position,
    this.showKey,
  });

  final String labelName;
  final VoidCallback onTap;
  final String? showCaseTitle;
  final String? showCaseDec;
  final TooltipPosition? position;
  final GlobalKey<State<StatefulWidget>>? showKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        CommonShowCase(
          position: position,
          showKey: showKey ?? GlobalKey(),
          showCaseTitle: showCaseTitle,
          showCaseDec: showCaseDec,
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  ' See all',
                  style: TextStyle(
                    color: Color(0xff3eaeff),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xff3eaeff),
                  size: 10,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
