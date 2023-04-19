import 'package:cipher/core/constants/constants.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CustomBottomNavItems extends StatelessWidget {
  final VoidCallback onPressed;
  final int pageIndex;
  final int index;
  final String label;
  final IconData iconData;
  final bool isActive;
  final String? showCaseTitle;
  final String? showCaseDec;
  final GlobalKey<State<StatefulWidget>> showKey;
  const CustomBottomNavItems({
    super.key,
    required this.onPressed,
    required this.label,
    required this.iconData,
    required this.index,
    required this.pageIndex,
    required this.isActive,
    required this.showKey,
    this.showCaseTitle,
    this.showCaseDec,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonShowCase(
          showKey: showKey,
          showCaseDec: showCaseDec,
          showCaseTitle: showCaseTitle,
          child: TextButton(
            onPressed: onPressed,
            child: isActive
                ? Icon(
                    iconData,
                    color: kColorSecondary,
                    size: 30,
                  )
                : Icon(
                    iconData,
                    color: kColorSilver,
                    size: 30,
                  ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: isActive ? kColorSecondary : kColorSilver,
          ),
        ),
      ],
    );
  }
}

class CommonShowCase extends StatelessWidget {
  final Widget child;
  final String? showCaseTitle;
  final String? showCaseDec;
  final TooltipPosition? position;
  final GlobalKey<State<StatefulWidget>> showKey;
  const CommonShowCase(
      {Key? key, required this.child, this.showCaseTitle, this.showCaseDec, required this.showKey, this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Showcase(
      overlayOpacity: .75,
      showArrow: true,
      key: showKey,
      targetPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      tooltipPosition: position != null ? position : TooltipPosition.top,
      title: showCaseTitle,
      titleAlignment: TextAlign.center,
      description: showCaseDec,
      tooltipBackgroundColor: Colors.transparent,
      textColor: Colors.white,
      targetShapeBorder: const CircleBorder(),
      child: child,
    );
  }
}
