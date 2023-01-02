import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PopularInCity extends StatelessWidget {
  const PopularInCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SectionHeading(
            labelName: 'Popular in Kathmandu',
            onTap: () {},
          ),
          kHeight10,
          SizedBox(
            height: 190,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 183,
                      height: 104,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const Text('Beauty Facial')
                ],
              ),
              separatorBuilder: (context, index) => kWidth5,
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
