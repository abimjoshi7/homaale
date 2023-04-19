import 'package:cipher/core/constants/iterable.dart';
import 'package:cipher/features/saved/presentation/bloc/saved_bloc.dart';
import 'package:cipher/features/saved/presentation/widgets/saved_card.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:cipher/widgets/widgets.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});
  static const routeName = '/saved-page';

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
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: bookmarkTypeList.length,
                        itemBuilder: (context, index) => SavedCard(
                          label: bookmarkTypeList[index],
                        ),
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
