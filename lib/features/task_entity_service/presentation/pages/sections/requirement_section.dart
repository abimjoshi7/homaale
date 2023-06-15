import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RequirementSection extends StatelessWidget {
  const RequirementSection({
    super.key,
    this.requirementList, this.labelText,
  });

  final List<String>? requirementList;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      label:labelText ?? "Highlights",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: List.generate(
            requirementList?.length ?? 2,
            (index) => Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 12,
                  color: Colors.orange,
                ),
                kWidth10,
                Text(
                  requirementList?[index] ?? 'Booking available for RCT in Kathmandu',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
