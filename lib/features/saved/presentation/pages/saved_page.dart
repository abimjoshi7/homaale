import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/saved/data/models/res/saved_model_res.dart';
import 'package:cipher/features/saved/presentation/bloc/saved_bloc.dart';
import 'package:cipher/features/saved/presentation/pages/saved_collection_page.dart';
import 'package:cipher/features/saved/presentation/widgets/saved_card.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:cipher/widgets/widgets.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});
  static const routeName = '/saved-page';

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  void initState() {
    super.initState();
    context.read<SavedBloc>().add(SavedListLoaded(type: ''));
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
                  builder: (context, state) {
                    if (state.theStates == TheStates.success) {
                      var allList = state.savedModelRes?.result ?? [];
                      var userList =
                          state.savedModelRes?.result?.where((element) => element.type == 'user').toList() ?? [];
                      var entityServiceList =
                          state.savedModelRes?.result?.where((element) => element.type == 'entityservice').toList() ??
                              [];

                      var loopList = [
                        if (allList.isNotEmpty) {'label': 'All', 'data': allList},
                        if (userList.isNotEmpty) {'label': 'User', 'data': userList},
                        if (entityServiceList.isNotEmpty) {'label': 'Service', 'data': entityServiceList},
                      ];

                      return Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: loopList.length,
                          itemBuilder: (context, index) => SavedCard(
                            label: loopList[index]['label'].toString(),
                            child: loopList[index]['data'] as List<Result>,
                            onTap: () => Navigator.pushNamed(
                              context,
                              SavedCollectionPage.routeName,
                              arguments: {
                                'heading': loopList[index]['label'].toString(),
                                'data': loopList[index]['data'] as List<Result>,
                              },
                            ),
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: kColorAmber,
                      ),
                    );
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
