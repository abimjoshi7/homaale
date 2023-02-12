import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:flutter/material.dart';

class RatingReviewSection extends StatelessWidget {
  const RatingReviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        // vertical: 8,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Reviews ',
                      style: kPurpleText16,
                    ),
                    Text('(30)')
                  ],
                ),
              ),
              Flexible(
                child: CustomDropDownField(
                  list: [
                    'Most Relevant',
                    'Most Popular',
                  ],
                  hintText: 'Specify',
                  onChanged: (value) {},
                ),
              )
            ],
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text('Elena'),
            trailing: Text(
              '3 days ago',
              style: kHelper13,
            ),
          )
        ],
      ),
    );
  }
}
