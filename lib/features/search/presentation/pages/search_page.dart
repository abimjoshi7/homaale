import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/presentation/widgets/widgets.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _searchFieldController = TextEditingController();
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.060,
                      left: 16.0,
                      right: 16.0,
                      bottom: MediaQuery.of(context).size.height * 0.025),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 50.0,
                          child: CustomTextFormField(
                            controller: _searchFieldController,
                            node: _focusNode,
                            hintText: 'Search...',
                            textInputType: TextInputType.text,
                            onSaved: (value) {
                              log("search-test" + _searchFieldController.text);
                            },
                            prefixWidget: (_focusNode.hasFocus)
                                ? Icon(
                                    Icons.arrow_back_rounded,
                                    size: 30,
                                    color: kColorDark,
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
                                  onPressed: () => setState(
                                    () => _searchFieldController.clear(),
                                  ),
                                ),
                                (_focusNode.hasFocus)
                                    ? IconButton(
                                        iconSize: 22.0,
                                        color: Color(0xff495057),
                                        icon: Icon(
                                          CupertinoIcons.mic,
                                          weight: 400,
                                        ),
                                        onPressed: () {},
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        //** search list**/
                        // RecentSearchesList(),
                        SearchResultsList(),
                        // addVerticalSpace(
                        //     MediaQuery.of(context).size.height * 0.015),
                        //** recommendations **/
                        // RecommendedCategoryList(),
                      ],
                    ),
                  ),
                ),
              ),
              SavedSearchList(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
