import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});
  static const routeName = '/saved-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight50,
            CustomHeader(
              leadingWidget: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
              trailingWidget: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              child: const Text(
                'Saved',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(
                    0xff212529,
                  ),
                ),
              ),
            ),
            kHeight10,
            const Text(
              'Your collection',
              style: kPurpleText16,
            ),
            kHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: 183,
                      height: 160,
                      color: Colors.grey,
                    ),
                    kHeight5,
                    const Text(
                      'All',
                      style: kPurpleText13,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 183,
                      height: 160,
                      color: Colors.grey,
                    ),
                    kHeight5,
                    const Text(
                      'Taskers',
                      style: kPurpleText13,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
