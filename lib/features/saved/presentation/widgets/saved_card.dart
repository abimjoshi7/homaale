import 'package:cipher/features/saved/data/models/res/saved_model_res.dart' as sv;
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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              10,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              height: 200,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: child
                        ?.map((e) => Image.network(
                              e.data?.profileImage ?? kServiceImageNImg,
                              errorBuilder: (context, error, stackTrace) => ColoredBox(color: Colors.grey),
                              fit: BoxFit.fill,
                            ))
                        .toList() ??
                    [
                      ColoredBox(color: Colors.black),
                      ColoredBox(color: Colors.amber),
                      ColoredBox(color: Colors.blue),
                      ColoredBox(color: Colors.green),
                    ],
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
      ),
    );
  }
}
