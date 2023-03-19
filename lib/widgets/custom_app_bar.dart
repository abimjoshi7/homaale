import 'package:cipher/core/constants/constants.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String appBarTitle;
  const CustomAppBar({
    super.key,
    required this.appBarTitle,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: AutoSizeText(
        appBarTitle,
        minFontSize: 14,
        style: kText14.copyWith(
          fontSize: 16,
          color: kColorDarkGrey,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          size: 25.0,
          color: kColorDarkGrey2,
        ),
        onPressed: null,
      ),
      actions: const [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.search_rounded,
            color: kColorDarkGrey,
            size: 25,
          ),
        )
      ],
    );
  }
}
