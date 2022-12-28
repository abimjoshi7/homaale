import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class RewardsProfile extends StatelessWidget {
  const RewardsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: 7,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 8,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(child: Container()),
                const Text(
                  '25% Off Voucher for Website',
                  style: kHeading3,
                ),
                kHeight10,
                const Text(
                  'Copy the code and paste at checkout and  get discount',
                  style: kHelper1,
                ),
                kHeight10,
                Row(
                  children: [
                    Container(
                      height: 31,
                      width: MediaQueryHelper.theWidth(context) * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffADB5BD)),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          topLeft: Radius.circular(4),
                        ),
                      ),
                      child: const Center(child: Text('001234 WEB-2022')),
                    ),
                    Container(
                      height: 31,
                      width: MediaQueryHelper.theWidth(context) * 0.10,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                        color: Color(0xff211D4F),
                      ),
                      child: const Center(
                        child: Text(
                          'Copy',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
