import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Membership extends StatelessWidget {
  const Membership({super.key});
  static const routeName = '/memebership';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              'Membership',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(
                  0xff212529,
                ),
              ),
            ),
          ),
          const Divider(),
          AccountListTileSection(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Free',
                  style: kPurpleText19,
                ),
                Text('Homaale free plan')
              ],
            ),
            label: '',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'BASIC',
                  style: kPurpleText19,
                ),
                Text('Homaale basic plan')
              ],
            ),
            label: '',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'SILVER',
                  style: kPurpleText19,
                ),
                Text('Homaale silver plan')
              ],
            ),
            label: '',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Center(child: CustomModalSheetDrawerIcon()),
                      const Center(
                        child: Text(
                          'Homaale Silver Plan',
                          style: kPurpleText19,
                        ),
                      ),
                      kHeight20,
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xffFCA500),
                              shape: BoxShape.circle,
                            ),
                            height: 20,
                            width: 20,
                          ),
                          kWidth10,
                          const Text('Up to 2 users'),
                        ],
                      ),
                      kHeight15,
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xffFCA500),
                              shape: BoxShape.circle,
                            ),
                            height: 20,
                            width: 20,
                          ),
                          kWidth10,
                          const Text('No support'),
                        ],
                      ),
                      kHeight15,
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xffFCA500),
                              shape: BoxShape.circle,
                            ),
                            height: 20,
                            width: 20,
                          ),
                          kWidth10,
                          const Text('Limited statistic'),
                        ],
                      ),
                      kHeight15,
                    ],
                  ),
                ),
              );
            },
          ),
          AccountListTileSection(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'PREMIUM',
                  style: kPurpleText19,
                ),
                Text('Homaale premium  plan')
              ],
            ),
            label: '',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
