import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SimilarEntityServiceSection extends StatelessWidget {
  const SimilarEntityServiceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      label: 'Similar Services',
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.21,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ServiceCard(
            callback: () async {
              final x = await ImagePickHelper().testPick(context);
              // print(x?.file);
              // print("PATH ${x}");
              print("PATH ${x}");
            },
          ),
          itemCount: 5,
        ),
      ),
    );
  }
}
