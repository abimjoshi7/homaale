import 'package:cipher/features/saved/data/repositories/saved_repository.dart';
import 'package:cipher/features/saved/presentation/widgets/saved_card.dart';
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
          Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormField(
                label: "Your collection",
                child: Expanded(
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                    ),
                    children: [
                      InkWell(onTap: () async {}, child: SavedCard()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
