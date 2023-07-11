import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ConnectedAccountCard extends StatelessWidget {
  const ConnectedAccountCard({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.description,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  final String imagePath;
  final String label;
  final String description;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(
          8,
        ),
        leading: SizedBox(
          height: 50,
          width: 50,
          child: Image.asset(
            imagePath,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            Text(
              description,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        trailing: InkWell(
          onTap: onTap,
          child: Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
              color: kColorPrimary,
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
