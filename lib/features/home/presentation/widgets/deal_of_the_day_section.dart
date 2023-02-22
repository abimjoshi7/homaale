import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class DealsOfTheDaySection extends StatelessWidget {
  const DealsOfTheDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding10,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Deals of the day',
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/services/1111.png',
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
                            Row(
                              children: const [
                                Text(
                                  'Rs 10,000',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12,
                                    color: Color(0xffADB5BD),
                                  ),
                                ),
                                kWidth5,
                                Text(
                                  'Rs 5,000',
                                  style: kLightBlueText14,
                                ),
                              ],
                            ),
                            Container(
                              height: 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xffd9d9d9),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: const Text(
                                    '10 times booked',
                                    style: TextStyle(
                                      color: kColorGrey,
                                      fontSize: 13,
                                    ),
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    'You saved Rs 5,000',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.red,
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => addHorizontalSpace(10),
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
