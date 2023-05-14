import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class EarningFilterWidget extends StatelessWidget {
  final String? fromText;
  final String? toText;
  final VoidCallback? onFromTap;
  final VoidCallback? onToTap;
  final VoidCallback? onClearFilterTap;

  const EarningFilterWidget({
    super.key,
    this.onFromTap,
    this.onToTap,
    this.fromText,
    this.toText,
    this.onClearFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Icon(
              Icons.filter_alt_outlined,
              color: kColorSilver,
            ),
            addHorizontalSpace(8),
            InkWell(
              onTap: onFromTap,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kColorGrey),
                  borderRadius: BorderRadius.circular(16),
                ),
                constraints: BoxConstraints.loose(Size(110, 100)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(fromText ?? "From"),
                      addHorizontalSpace(8),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: kColorSilver,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            addHorizontalSpace(8),
            InkWell(
              onTap: onToTap,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kColorGrey),
                  borderRadius: BorderRadius.circular(16),
                ),
                constraints: BoxConstraints.loose(Size(110, 100)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        toText ?? "To",
                        overflow: TextOverflow.ellipsis,
                      ),
                      addHorizontalSpace(8),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: kColorSilver,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fromText != null || toText != null
                ? TextButton(onPressed: onClearFilterTap, child: Text('Clear Fitlers'))
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
