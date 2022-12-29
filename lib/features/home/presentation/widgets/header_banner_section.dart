import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class HeaderBannerSection extends StatelessWidget {
  const HeaderBannerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff5aebff),
            Color(0xff2e9dc3),
            Color(0xff0078CE),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              'assets/banners/refer 1.png',
            ),
            kWidth10,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Refer a Friend'),
                kHeight10,
                const Text('"Earn 3003 everytime you refer your friends"')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
