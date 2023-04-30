import 'package:cipher/core/constants/constants.dart';
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
    savedBloc.add(SavedListLoaded(type: null));
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
      appBar: CustomAppBar(
        appBarTitle: "Saved",
      ),
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
                      var userList = allList.where((element) => element.type == 'user').toList();
                      var entityServiceList = allList.where((element) => element.type == 'entityservice').toList();

                      var loopList = [
                        if (allList.isNotEmpty) {'label': 'All', 'data': allList},
                        if (userList.isNotEmpty) {'label': 'User', 'data': userList},
                        if (entityServiceList.isNotEmpty) {'label': 'Service', 'data': entityServiceList},
                      ];

                      return Expanded(
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
