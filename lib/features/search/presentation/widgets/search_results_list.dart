import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/data/search_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class SearchResultsList extends StatelessWidget {
  final List<SearchResult> searchList;
  const SearchResultsList({
    super.key,
    required this.searchList,
  });

  @override
  Widget build(BuildContext context) {
    if (searchList.length < 1) {
      return Text(
        'No Results Found.',
      );
    }
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.016,
        left: MediaQuery.of(context).size.width * 0.025,
        right: MediaQuery.of(context).size.width * 0.025,
        bottom: MediaQuery.of(context).size.height * 0.032,
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: searchList.length,
        itemBuilder: (BuildContext context, int index) {
          return searchList[index].when(
            taskEntityServiceResult: (_taskEntityService) {
              return TaskEntityServiceSearchTile(
                taskEntityService: _taskEntityService,
              );
            },
            taskerProfileResult: (_taskerProfile) {
              return TaskerProfileSearchTile(
                taskerProfile: _taskerProfile,
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return addVerticalSpace(10.0);
        },
      ),
    );
  }
}
