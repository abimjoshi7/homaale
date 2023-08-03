import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.iconData, this.label, this.subLabel});

  final IconData iconData;
  final String? label;
  final String? subLabel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: ListTile(
        onTap: () {
          Clipboard.setData(
            ClipboardData(
              text: subLabel.toString(),
            ),
          );
          final snackBar = SnackBar(
            duration: Duration(milliseconds: 2),
            content: Text('Copied to Clipboard'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        leading: Icon(
          iconData,
          color: Theme.of(context).textTheme.headlineSmall?.color,
          size: 50,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label ?? 'Support Contact',
              style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              subLabel ?? 'Support Contact',
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
