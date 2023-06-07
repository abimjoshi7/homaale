import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/error_pages/no_internet_page.dart';
import 'package:cipher/features/saved/data/models/res/saved_model_res.dart';
import 'package:cipher/features/saved/presentation/bloc/saved_bloc.dart';
import 'package:cipher/features/saved/presentation/pages/saved_collection_page.dart';
import 'package:cipher/features/saved/presentation/widgets/saved_card.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/widgets/widgets.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});
  static const routeName = '/saved-page';

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final savedBloc = locator<SavedBloc>();
  @override
  void initState() {
    savedBloc.add(SavedListLoaded());
    super.initState();
  }

  @override
  void dispose() {
    savedBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "Saved", trailingWidget: SizedBox()),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormField(
                label: "Your collection",
                child: BlocBuilder<SavedBloc, SavedState>(
                  bloc: savedBloc,
                  builder: (context, state) {
                    if (state.theStates == TheStates.success) {
                      var allList = state.savedModelRes?.result ?? [];
                      var taskList = allList.where((element) => element.data?.isRequested == true).toList();
                      var entityServiceList = allList.where((element) => element.data?.isRequested == false).toList();

                      var loopList = [
                        if (entityServiceList.isNotEmpty) {'label': 'Service', 'data': entityServiceList},
                        if (taskList.isNotEmpty) {'label': 'Tasks', 'data': taskList},
                      ];

                      return allList.isEmpty
                          ? Center(
                              child: CommonErrorContainer(
                              assetsPath: 'assets/no_data_found.png',
                              errorTile: 'Bookmarked item not found.',
                              errorDes: 'We’re sorry, the data you search could not found. '
                                  'Please go back.',
                            ))
                          : Expanded(
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  savedBloc.add(SavedListLoaded());
                                },
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.8,
                                  children: loopList
                                      .map((e) => InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                SavedCollectionPage.routeName,
                                                arguments: {
                                                  'heading': e['label'].toString(),
                                                  'data': e['data'] as List<Result>,
                                                },
                                              );
                                            },
                                            child: SavedCard(
                                              label: e['label'].toString(),
                                              child: e['data'] as List<Result>,
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            );
                    }
                    return Center(child: CircularProgressIndicator(color: kColorAmber));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
