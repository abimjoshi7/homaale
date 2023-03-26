import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  static const routeName = '/checkout-page';
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(50),
          CustomHeader(
            leadingWidget: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            trailingWidget: IconButton(
              onPressed: () {
                // Navigator.pushNamed(
                //   context,
                //   CompleteProfilePage.routeName,
                // );
              },
              icon: const Icon(Icons.search),
            ),
            child: const Text('Payment Summary'),
          ),
          Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: const Text(
                        'Booking Details',
                        style: kPurpleText16,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Name'),
                                Text('Price'),
                                Text('Total'),
                              ],
                            ),
                            subtitle: Column(
                              children: [
                                Text(
                                    '............................................................................................................................'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Name ',
                                      style: TextStyle(
                                        textBaseline: TextBaseline.alphabetic,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text('Rs 200'),
                                    Text('Rs 250'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Billing Details',
                            style: kPurpleText16,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const IconText(
                            label: 'Bagbazaar, Kathmandu',
                            iconData: Icons.location_on_outlined,
                            color: Colors.pink,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_box,
                                color: Colors.orangeAccent,
                              ),
                              addHorizontalSpace(10),
                              const Text(
                                'Same as task location',
                                style: kBodyText1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: CustomElevatedButton(
              callback: () {},
              label: 'Confirm',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: CustomElevatedButton(
              borderColor: kColorPrimary,
              mainColor: Colors.white,
              callback: () {},
              label: 'Cancel',
              textColor: kColorPrimary,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
