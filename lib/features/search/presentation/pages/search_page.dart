import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/presentation/bloc/search_bloc.dart';
import 'package:cipher/features/search/presentation/widgets/widgets.dart';
import 'package:cipher/features/services/presentation/manager/entity_service_bloc.dart';
import 'package:cipher/features/task/data/models/all_task_list.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const String routeName = '/search-page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _searchFieldController = TextEditingController();
  late FocusNode _focusNode;
  // var _taskBloc = locator<TaskBloc>();
  // EntityServiceBloc _entityServiceBloc = locator<EntityServiceBloc>();
  // List? collection = List.empty();

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
    context.read<SearchBloc>().add(SearchFieldInitialEvent());
    //TODO: FIX BUG that retrieves list after clearing search prompt via backspace
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _setSearchControllerValue(String value) =>
      setState(() => _searchFieldController.setText(value));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.061,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    (!_focusNode.hasFocus)
                        ? IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(Icons.arrow_back_ios_rounded),
                            iconSize: 28.0,
                            color: kColorDarkGrey2,
                          )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: (_focusNode.hasFocus)
                            ? MediaQuery.of(context).size.width * 0.020
                            : 0,
                        right: MediaQuery.of(context).size.width * 0.020,
                      ),
                      child: AnimatedContainer(
                        height: MediaQuery.of(context).size.height * 0.051,
                        width: (_focusNode.hasFocus)
                            ? MediaQuery.of(context).size.width * 0.96
                            : MediaQuery.of(context).size.width * 0.86,
                        duration: Duration(milliseconds: 60),
                        child: CustomTextFormField(
                          controller: _searchFieldController,
                          node: _focusNode,
                          onChanged: (query) {
                            if (query!.trim().isEmpty && query.isEmpty) {
                              setState(() => _searchFieldController.clear());
                              context.read<SearchBloc>().add(
                                    SearchQueryCleared(),
                                  );
                            }

                            if (query.length < 3) return;
                            context.read<SearchBloc>().add(
                                  SearchQueryInitiated(
                                    searchQuery: query.toString(),
                                  ),
                                );
                          },
                          hintText: 'Search...',
                          textInputType: TextInputType.text,
                          prefixWidget: (_focusNode.hasFocus)
                              ? IconButton(
                                  onPressed: () => _focusNode.unfocus(),
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    size: 30,
                                    color: kColorDark,
                                  ),
                                )
                              : Icon(
                                  Icons.search_rounded,
                                  size: 30,
                                  color: kColorDark,
                                ),
                          suffixWidget: Wrap(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              IconButton(
                                  iconSize: 22.0,
                                  color: Color(0xff868E96),
                                  icon: Icon(
                                    CupertinoIcons.multiply,
                                    weight: 400,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () => _searchFieldController.clear(),
                                    );
                                    context
                                        .read<SearchBloc>()
                                        .add(SearchQueryCleared());
                                  }),
                              //TODO:voice search implementation
                              // (_focusNode.hasFocus)
                              //     ? IconButton(
                              //         iconSize: 22.0,
                              //         color: Color(0xff495057),
                              //         icon: Icon(
                              //           CupertinoIcons.mic,
                              //           weight: 400,
                              //         ),
                              //         onPressed: () {

                              //         },
                              //       )
                              //     : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //**Search Results**//
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (_, state) {
                    if (state.theStates == TheStates.initial) {
                      return RecentSearchesList(
                        recentSearchesList:
                            state.recentSearchQueriesList as List,
                        setSearchControllerValue: _setSearchControllerValue,
                      );
                    }
                    if (state.theStates == TheStates.success) {
                      if (state.filteredList!.length < 1) {
                        return Align(
                          alignment: Alignment.center,
                          child: Text('No results Found.'),
                        );
                      }
                      return SearchResultsList(
                        searchList: state.filteredList!,
                      );
                    }

                    if (state.theStates == TheStates.failure) {
                      return Align(
                        alignment: Alignment.center,
                        child:
                            Text('An Error Occured. Please Try Again Later.'),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
                //**Recent Searches List**//
                // addVerticalSpace(
                //     MediaQuery.of(context).size.height * 0.015),
                //** Recommendations Category Search Filter List**/
                //TODO:recommended category search implementation
                // RecommendedCategoryList(),
                //**Saved Search List**//
                //TODO:saved search list search implementation
                // SavedSearchList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
