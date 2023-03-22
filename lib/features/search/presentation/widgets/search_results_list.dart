import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.017),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
            minLeadingWidth: MediaQuery.of(context).size.width,
            leading: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Icon(
                  CupertinoIcons.search,
                  color: kColorDarkGrey,
                  size: 24,
                ),
                addHorizontalSpace(8.0),
                Text(
                  'Gardening',
                  style: kText14.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            trailing: Icon(
              CupertinoIcons.arrow_up_left,
              size: 24,
              color: kColorDarkGrey,
            ),
          );
        },
      ),
    );
  }
}
