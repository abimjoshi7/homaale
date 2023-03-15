import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class BoxPage extends StatefulWidget {
  const BoxPage({super.key});

  @override
  State<BoxPage> createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(50),
          CustomHeader(
            leadingWidget: addHorizontalSpace(50),
            label: 'Box',
          ),
          TabBar(
            labelPadding: kPadding10,
            controller: _tabController,
            tabs: const [
              Text('Payment'),
              Text('Waiting List'),
              Text('Saved'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.11,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 72,
                                              width: 72,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                image: const DecorationImage(
                                                  image: NetworkImage(
                                                    'https://picsum.photos/1000/1000',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            addHorizontalSpace(8),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      Text(
                                                        'Trimming & Cutting',
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .delete_outline_sharp,
                                                        color: Colors.red,
                                                      )
                                                    ],
                                                  ),
                                                  addVerticalSpace(8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: const [
                                                          Icon(
                                                            Icons
                                                                .location_on_outlined,
                                                            size: 16,
                                                            color: Colors.red,
                                                          ),
                                                          Text(
                                                            'Buddhanagar, Kathmandu',
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Text('Rs. 1200')
                                                    ],
                                                  ),
                                                  addVerticalSpace(8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Row(
                                                            children: const [
                                                              Icon(
                                                                Icons
                                                                    .calendar_month,
                                                                size: 16,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              Text(
                                                                'June 02,2023',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 11,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          addHorizontalSpace(
                                                            16,
                                                          ),
                                                          Row(
                                                            children: const [
                                                              Icon(
                                                                Icons
                                                                    .watch_later_outlined,
                                                                size: 16,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                              Text(
                                                                '8:00 PM',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 11,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const Text(
                                                        '/per project',
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: kColorSilver,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text('Booking:'),
                                            addHorizontalSpace(4),
                                            const Chip(
                                              backgroundColor: Colors.lightBlue,
                                              label: Text(
                                                'Approved',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            )
                                          ],
                                        ),
                                        GestureDetector(
                                          child: const Text(
                                            'Booking Details',
                                            style: TextStyle(
                                              color: kColorSilver,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
                Container(),
                Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
