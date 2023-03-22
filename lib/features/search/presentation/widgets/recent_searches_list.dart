import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentSearchesList extends StatelessWidget {
  const RecentSearchesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 2.0,
              right: 2.0,
              top: MediaQuery.of(context).size.height * 0.016,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Recent Searches',
                  style: kText15.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: null,
                  child: Text(
                    'Clear All',
                    style: kLightBlueText14,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
                  minLeadingWidth: MediaQuery.of(context).size.width,
                  leading: Text(
                    'Gardening',
                    style: kText13,
                  ),
                  trailing: Icon(
                    CupertinoIcons.multiply,
                    size: 20,
                    color: kColorLightGrey,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
