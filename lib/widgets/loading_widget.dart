import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.child, required this.isLoading});

  final Widget? child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child ?? Container(),
        isLoading
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: kColorDarkGrey.withOpacity(0.5),
                child: Center(
                  child: CustomLoader(),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
