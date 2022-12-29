import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PopularServicesSection extends StatelessWidget {
  const PopularServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SectionHeading(
            labelName: 'Popular services',
            onTap: () {},
          ),
          kHeight20,
          SizedBox(
            height: 130,
            width: double.infinity,
            child: ListView.separated(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => kWidth10,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 80,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          6,
                        ),
                        image: const DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(
                            'assets/services/1.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  kHeight10,
                  const Text('Trimmimg & Cutting')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
