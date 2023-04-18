import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/presentation/pages/search_page.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
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
        style: Theme.of(context).textTheme.bodySmall,
        // style: kText14.copyWith(
        //   fontSize: 16,
        //   color: kColorGreyDark,
        // ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          size: 25.0,
          color: Theme.of(context).appBarTheme.iconTheme?.color,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(
            context,
            SearchPage.routeName,
          ),
          icon: Icon(
            Icons.search_rounded,
            color: Theme.of(context).appBarTheme.iconTheme?.color,
            size: 25,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
