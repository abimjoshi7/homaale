import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WeekTimeSpecifier extends StatelessWidget {
  const WeekTimeSpecifier({
    super.key,
    this.weekName,
    this.onTap1,
    this.onTap2,
    this.onDelete,
    this.onAdd,
  });

  final String? weekName;
  final VoidCallback? onTap1;
  final VoidCallback? onTap2;
  final VoidCallback? onDelete;
  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.orange,
              size: 10,
            ),
            addHorizontalSpace(10),
            Text(weekName ?? 'Sunday'),
            addHorizontalSpace(50),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: onTap1,
                      child: const CustomFormContainer(
                        hintText: 'Start Time',
                      ),
                    ),
                  ),
                  const Text(' - '),
                  Flexible(
                    child: InkWell(
                      onTap: onTap2,
                      child: const CustomFormContainer(
                        hintText: 'End Time',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        addVerticalSpace(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 340,
              child: CustomElevatedButton(
                callback: onAdd ?? () {},
                label: 'Add',
              ),
            )
          ],
        ),
        addVerticalSpace(10),
      ],
    );
  }
}
