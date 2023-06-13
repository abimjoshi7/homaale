// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/features/search/presentation/pages/search_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final Widget? leadingWidget;
  final Widget? trailingWidget;

  const CustomAppBar({
    Key? key,
    required this.appBarTitle,
    this.leadingWidget,
    this.trailingWidget,
  }) : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: AutoSizeText(
        appBarTitle,
        minFontSize: 14,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: leadingWidget ??
          IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 25.0,
              color: Theme.of(context).appBarTheme.iconTheme?.color,
            ),
            onPressed: () => Navigator.pop(context),
          ),
      actions: [
        trailingWidget ??
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
            ),
      ],
      bottom: PreferredSize(
        child: Divider(),
        preferredSize: Size(
          double.maxFinite,
          5,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
