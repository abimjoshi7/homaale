import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SimilarEntityServiceSection extends StatelessWidget {
  const SimilarEntityServiceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        8,
      ),
      child: CustomFormField(
        label: 'Similar Services',
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.21,
          width: double.infinity,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const ServiceCard(),
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
