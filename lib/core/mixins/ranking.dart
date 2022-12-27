import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

mixin Ranking {
  showRanking(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        children: [
          const CustomModalSheetDrawerIcon(),
          const Text(
            "Ranking",
            style: kHeading2,
          ),
          kHeight20,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                          "assets/Frame 48100572.png",
                        ),
                      ),
                    ),
                    height: 90,
                    width: double.infinity,
                  ),
                  kHeight10,
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                          "assets/Frame 48100573.png",
                        ),
                      ),
                    ),
                    height: 90,
                    width: double.infinity,
                  ),
                  kHeight10,
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                          "assets/Frame 48100574.png",
                        ),
                      ),
                    ),
                    height: 90,
                    width: double.infinity,
                  ),
                  kHeight10,
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                          "assets/Frame 48100575.png",
                        ),
                      ),
                    ),
                    height: 90,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
