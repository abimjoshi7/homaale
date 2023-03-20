import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RequirementSection extends StatelessWidget {
  const RequirementSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      label: "Requirements",
      child: Column(
        children: List.generate(
          2,
          (index) => Row(
            children: const [
              Icon(
                Icons.circle,
                size: 12,
                color: Colors.orange,
              ),
              kWidth10,
              Text(
                'Booking available for RCT in Kathmandu',
              )
            ],
          ),
        ),
      ),
    );
  }
}
