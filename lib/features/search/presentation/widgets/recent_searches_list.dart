import 'dart:ffi';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/presentation/bloc/search_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentSearchesList extends StatelessWidget {
  final Function setSearchControllerValue;
  final List recentSearchesList;
  const RecentSearchesList({
    super.key,
    required this.recentSearchesList,
    required this.setSearchControllerValue,
  });

  @override
  Widget build(BuildContext context) {
    if (recentSearchesList.isEmpty) {
      return Text('No recent searches yet.');
    }
    if (recentSearchesList.isEmpty) ;
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.016,
        left: MediaQuery.of(context).size.width * 0.025,
        right: MediaQuery.of(context).size.width * 0.025,
        bottom: MediaQuery.of(context).size.height * 0.032,
      ),
      height: MediaQuery.of(context).size.height * 0.50,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 2.0,
              right: 2.0,
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
                  onPressed: () => context
                      .read<SearchBloc>()
                      .add(RecentSearchQueryCleared()),
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
              itemCount: recentSearchesList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    setSearchControllerValue(
                        recentSearchesList[index].toString());
                    context.read<SearchBloc>().add(
                          SearchQueryInitiated(
                            searchQuery: recentSearchesList[index]
														.toString(),
                          ),
                        );
                  },
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
                  minLeadingWidth: MediaQuery.of(context).size.width,
                  leading: SizedBox(
                    child: Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Icon(Icons.history),
                        addHorizontalSpace(5.0),
                        Text(
                          recentSearchesList[index].toString(),
                          style: kText13,
                        ),
                      ],
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () => context
                        .read<SearchBloc>()
                        .add(RecentSearchQueryIndexCleared(index: index)),
                    icon: Icon(
                      CupertinoIcons.multiply,
                      size: 20,
                      color: kColorLightGrey,
                    ),
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
