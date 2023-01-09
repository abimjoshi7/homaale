import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class DealOfTheDaySection extends StatelessWidget {
  const DealOfTheDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Deal of the day',
                style: kPurpleText19,
              ),
              Row(
                children: [
                  const Text('Ends in : '),
                  Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: const Color(
                            0xffececf2,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: const Center(
                          child: Text('03'),
                        ),
                      ),
                      kWidth5,
                      const Text(
                        ':',
                        style: kPurpleText16,
                      ),
                      kWidth5,
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: const Color(
                            0xffececf2,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: const Center(
                          child: Text('28'),
                        ),
                      ),
                      kWidth5,
                      const Text(
                        ':',
                        style: kPurpleText16,
                      ),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: const Color(
                            0xffececf2,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: const Center(
                          child: Text('42'),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          kHeight20,
          SizedBox(
            height: 188,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Card(
                child: SizedBox(
                  width: 184,
                  child: Column(
                    children: [
                      const Expanded(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/casual-life-3d-young-woman-working-on-laptop-and-holding-head.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Trimming & Cutting'),
                            kHeight5,
                            Row(
                              children: const [
                                Text(
                                  'Rs 10,000',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 10,
                                    color: Color(0xffADB5BD),
                                  ),
                                ),
                                kWidth5,
                                Text(
                                  'Rs 5,000',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff3eaeff),
                                  ),
                                ),
                              ],
                            ),
                            kHeight5,
                            Container(
                              height: 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xffd9d9d9),
                              ),
                            ),
                            kHeight5,
                            const Text(
                              '10 times booked',
                              style: kHelper13,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => kWidth15,
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
