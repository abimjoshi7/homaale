import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/presentation/bloc/search_bloc.dart';
import 'package:cipher/features/search/repositories/search_repository.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../error_pages/no_internet_page.dart';
import 'sections/sections.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  static const String routeName = '/search-page';

  @override
  Widget build(BuildContext context) {
    return SearchPageMainView();
  }
}

class SearchPageMainView extends StatefulWidget {
  const SearchPageMainView({super.key});

  @override
  State<SearchPageMainView> createState() => _SearchPageMainViewState();
}

class _SearchPageMainViewState extends State<SearchPageMainView> {
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
    // context.read<SearchBloc>().add(SearchFieldInitialEvent());
    //TODO: FIX BUG that retrieves list after clearing search prompt via backspace
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _setSearchControllerValue(String value) => setState(() => _searchFieldController.setText(value));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
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
                              iconSize: 20,
                              // color: kColorDarkGrey2,
                            )
                          : SizedBox.shrink(),
                      Padding(
                        padding: EdgeInsets.zero,
                        // padding: EdgeInsets.only(
                        //   left: (_focusNode.hasFocus)
                        //       ? MediaQuery.of(context).size.width * 0.020
                        //       : 0,
                        //   right: MediaQuery.of(context).size.width * 0.0020,
                        // ),
                        child: AnimatedContainer(
                          height: MediaQuery.of(context).size.height * 0.051,
                          width: (_focusNode.hasFocus)
                              ? MediaQuery.of(context).size.width * 0.88
                              : MediaQuery.of(context).size.width * 0.88,
                          duration: Duration(milliseconds: 60),
                          child: CustomTextFormField(
                            autofocus: true,
                            controller: _searchFieldController,
                            node: _focusNode,
                            onFieldSubmitted: (p0) {
                              log("321");
                              context.read<SearchBloc>().add(
                                    SearchQueryInitiated(
                                      searchQuery: _searchFieldController.text,
                                    ),
                                  );
                            },
                            onChanged: (query) {
                              if (query != null) {
                                if (query.length < 3) {
                                  return;
                                } else {
                                  context.read<SearchBloc>().add(
                                        SearchQueryInitiated(
                                          searchQuery: query,
                                        ),
                                      );
                                }
                              }
                            },
                            hintText: 'Search...',
                            textInputType: TextInputType.text,
                            inputAction: TextInputAction.search,
                            prefixWidget: (_focusNode.hasFocus)
                                ? IconButton(
                                    onPressed: () => _focusNode.unfocus(),
                                    icon: Icon(
                                      Icons.arrow_back_rounded,
                                      size: 22,
                                      // color: kColorDark,
                                    ),
                                  )
                                : Icon(
                                    Icons.search_rounded,
                                    size: 30,
                                    // color: kColorDark,
                                  ),
                            suffixWidget: IconButton(
                              iconSize: 22.0,
                              // color: Color(0xff868E96),
                              icon: Icon(
                                CupertinoIcons.multiply,
                                weight: 400,
                              ),
                              onPressed: () {
                                setState(
                                  () => _searchFieldController.clear(),
                                );
                                context.read<SearchBloc>().add(SearchQueryCleared());
                              },
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
                        return SizedBox.shrink();
                        // return RecentSearchesList(
                        //   recentSearchesList:
                        //       state.recentSearchQueriesList as List,
                        //   setSearchControllerValue: _setSearchControllerValue,
                        // );
                      }
                      if (state.theStates == TheStates.success) {
                        var service = state.result?.service;
                        var task = state.result?.task;
                        var tasker = state.result?.tasker;
                        return Column(
                          children: [
                            /// TODO: Please make condition workable when apply search history and others
                            if (service?.length == 0 && task?.length == 0 && tasker?.length == 0)
                              Center(
                                  child: CommonErrorContainer(
                                assetsPath: 'assets/no_data_found.png',
                                errorTile: 'Search Item not found.',
                                errorDes: 'We’re sorry, the data you search could not found. '
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
                        );
                      }

                      if (state.theStates == TheStates.failure) {
                        return Align(
                          alignment: Alignment.center,
                          child: Text('An Error Occured. Please Try Again Later.'),
                        );
                      }
                      return const Center(
                        child: CardLoading(
                          height: 200,
                        ),
                      );
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
      ),
    );
  }
}
