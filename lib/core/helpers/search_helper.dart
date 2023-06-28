// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cipher/features/search/presentation/cubit/recent_search_cubit.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/error_pages/no_internet_page.dart';
import 'package:cipher/features/search/presentation/bloc/search_bloc.dart';
import 'package:cipher/features/search/presentation/pages/sections/sections.dart';

class SearchHelper extends SearchDelegate {
  final BuildContext context;
  final SearchBloc searchBloc;
  final List<String> recentSearchList;
  SearchHelper({
    required this.context,
    required this.searchBloc,
    this.recentSearchList = const [],
  });
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = "")];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length >= 3) {
      searchBloc.add(
        SearchQueryInitiated(
          searchQuery: query,
        ),
      );
    }

    return query.length < 3 ? _buildRecentSearch() : _buildBlocSuggestion();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length >= 3) {
      searchBloc.add(
        SearchQueryInitiated(
          searchQuery: query,
        ),
      );
    }

    return query.length < 3 ? _buildRecentSearch() : _buildBlocSuggestion();
  }

  Widget _buildRecentSearch() {
    var recentSearchesList =
        context.read<RecentSearchCubit>().state.recentSearchList;
    return StatefulBuilder(
      builder: (context, setState) => SingleChildScrollView(
        child: Column(
          children: List.generate(
            recentSearchesList.length,
            (index) => ListTile(
              onTap: () {
                query = recentSearchesList[index];
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              trailing: IconButton(
                onPressed: () async {
                  context.read<RecentSearchCubit>().deleteSearchList(
                        index,
                      );
                  setState(
                    () {},
                  );
                },
                icon: Icon(
                  Icons.clear,
                  size: 20,
                  // color: kColorLightGrey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BlocBuilder<SearchBloc, SearchState> _buildBlocSuggestion() {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: searchBloc,
      buildWhen: (previous, current) {
        if (previous.theStates == TheStates.loading &&
            current.theStates == TheStates.success) return true;
        return false;
      },
      builder: (_, state) {
        if (state.theStates == TheStates.initial) {
          return SizedBox.shrink();
        }
        if (state.theStates == TheStates.success) {
          var service = state.result?.service;
          var task = state.result?.task;
          var tasker = state.result?.tasker;
          return SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                // TODO: Please make condition workable when apply search history and others
                if (service?.length == 0 &&
                    task?.length == 0 &&
                    tasker?.length == 0)
                  Center(
                      child: CommonErrorContainer(
                    assetsPath: 'assets/no_data_found.png',
                    errorTile: 'Search Item not found.',
                    errorDes:
                        'We’re sorry, the data you search could not found. '
                        'Please go back.',
                  )),
                if (tasker?.isNotEmpty ?? false)
                  TaskerSection(
                    taskers: tasker,
                  ),
                if (task?.isNotEmpty ?? false)
                  TasksSection(
                    tasks: task,
                  ),
                if (service?.isNotEmpty ?? false)
                  ServicesSection(
                    service: service,
                  ),
              ],
            ),
          );
        }

        if (state.theStates == TheStates.failure) {
          return Align(
            alignment: Alignment.center,
            child: Text('An Error Occured. Please Try Again Later.'),
          );
        }
        return CardLoading(
          height: double.infinity,
        );
      },
    );
  }

  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   // TODO: implement appBarTheme
  //   throw UnimplementedError();
  // }

  // @override
  // PreferredSizeWidget? buildBottom(BuildContext context) {
  //   // TODO: implement buildBottom
  //   throw UnimplementedError();
  // }

  // @override
  // void close(BuildContext context, result) {
  //   // TODO: implement close
  // }

  // @override
  // // TODO: implement searchFieldDecorationTheme
  // InputDecorationTheme? get searchFieldDecorationTheme =>
  //     InputDecorationTheme();

  @override
  void showResults(BuildContext context) async {
    if (query.length >= 3) {
      context.read<RecentSearchCubit>().addSearchList(
            query,
          );
      context.read<SearchBloc>().add(
            SearchQueryInitiated(
              searchQuery: query,
            ),
          );
    }
  }
}
