import 'package:cipher/features/saved/data/models/res/saved_model_res.dart'
    as sv;
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';

class SavedCard extends StatelessWidget {
  const SavedCard({
    Key? key,
    this.label,
    this.child,
    this.index,
    this.onTap,
  }) : super(key: key);

  final String? label;
  final List<sv.Result>? child;
  final int? index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(color: Colors.grey.shade100),
            height: 200,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: child?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Image.network(
                child?[index].data?.images?.length == 0
                    ? kHomaaleImg
                    : child?[index].data?.images?.first['media'].toString() ??
                        kHomaaleImg,
                errorBuilder: (context, error, stackTrace) =>
                    ColoredBox(color: Colors.grey),
                fit: BoxFit.fill,
                height: 10,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Text(
            label ?? 'All',
            style: kPurpleText13,
          ),
        ),
      ],
    );
  }
}
