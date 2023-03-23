import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.016,
        left: MediaQuery.of(context).size.width * 0.025,
        right: MediaQuery.of(context).size.width * 0.025,
        bottom: MediaQuery.of(context).size.height * 0.032,
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 11,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
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
