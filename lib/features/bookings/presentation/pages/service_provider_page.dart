import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ServiceProviderPage extends StatelessWidget {
  static const String routeName = '/service_provider_page';
  const ServiceProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {},
            ),
            trailingWidget: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            child: const Text('Root Canal Treatment'),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // image: const DecorationImage(
                    //   fit: BoxFit.cover,
                    //   image: AssetImage(
                    //     'homaale-mobile/assets/Casual life 3D - 43.png',
                    //   ),
                    // ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: kPadding20,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              kWidth10,
                              Column(
                                children: [
                                  const Text('data'),
                                  const Text('data'),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.red,
                              ),
                              kWidth10,
                              const Icon(
                                Icons.share,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                      kHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star_outlined,
                                color: Colors.amber,
                                size: 18,
                              ),
                              kWidth5,
                              const Text('4.5'),
                              const Text('(200)'),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: Colors.red,
                                size: 18,
                              ),
                              kWidth5,
                              const Text('Buddhanagar, Kathmandu')
                            ],
                          )
                        ],
                      ),
                      const Text(
                        'Root canal treatment (endodontics) is a dental procedure used to treat infection at the centre of a tooth. Root canal treatment is not painful and can save a tooth that might otherwise have to be removed completely.',
                        textAlign: TextAlign.start,
                      ),
                      kHeight20,
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Requirements',
                          style: kPurpleText16,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 12,
                            color: Colors.orange,
                          ),
                          kWidth10,
                          const Text('Booking available for RCT in Kathmandu')
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 12,
                            color: Colors.orange,
                          ),
                          kWidth10,
                          const Text('Booking available for RCT in Kathmandu')
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 12,
                            color: Colors.orange,
                          ),
                          kWidth10,
                          const Text('Booking available for RCT in Kathmandu')
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 12,
                            color: Colors.orange,
                          ),
                          kWidth10,
                          const Text('Booking available for RCT in Kathmandu')
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 12,
                            color: Colors.orange,
                          ),
                          kWidth10,
                          const Text('Booking available for RCT in Kathmandu')
                        ],
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Packages & Offers',
                          style: kPurpleText16,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.all(10),
                              child: const PackagesOffersCard(
                                name: 'Basic',
                                rate: 'Rs 1000/mo',
                                offerName: "Save up to 10%",
                              ),
                            ),
                          ),
                        ),
                      ),
                      ExpansionTile(
                        title: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 15,
                            ),
                            kWidth10,
                            Text('Additional Information'),
                          ],
                        ),
                      ),
                      ExpansionTile(
                        title: Row(
                          children: [
                            Icon(
                              Icons.star_border_outlined,
                              size: 15,
                            ),
                            kWidth10,
                            Text('Ratings & Reviews'),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Write a Review'),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Similar Services',
                          style: kPurpleText16,
                        ),
                      ),
                      Placeholder(),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffBCD4FA),
                  ),
                  child: Padding(
                    padding: kPadding20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Price'),
                            Text(
                              'Rs 3,000',
                              style: kText20,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 100,
                          child: CustomElevatedButton(
                            callback: () {},
                            label: 'Book Now',
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          // Row(
          //   children: [ListTile()],
          // )
        ],
      ),
    );
  }
}
