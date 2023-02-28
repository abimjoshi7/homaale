// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

class ClientPostTaskViewPage extends StatelessWidget {
  static const routeName = '/client-post-task-view-page';
  const ClientPostTaskViewPage({
    Key? key,
    this.imageUrl,
  }) : super(key: key);
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(50),
          CustomHeader(
            trailingWidget: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
            ),
            child: Text('Gardening'),
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            child: Image.network(
              kServiceImageNImg,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(),
                          addHorizontalSpace(10),
                          Column(
                            children: [
                              Text(
                                'data',
                                style: kPurpleText16,
                              ),
                              Text(
                                'data',
                                style: kLightBlueText14,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_outline,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert_rounded,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  addVerticalSpace(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconText(
                        label: 'June 9, 2022',
                        iconData: Icons.calendar_today_rounded,
                      ),
                      IconText(
                        label: 'Buddhanagar, Kathmandu',
                        iconData: Icons.location_on_outlined,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  addVerticalSpace(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconText(
                        label: '08:11 PM',
                        iconData: Icons.calendar_today_rounded,
                        color: kColorBlue,
                      ),
                      IconText(
                        label: '10 Applied',
                        iconData: Icons.location_on_outlined,
                        color: kColorSecondary,
                      ),
                      IconText(
                        label: '2500 Views',
                        iconData: Icons.location_on_outlined,
                        color: kColorPrimary,
                      ),
                    ],
                  ),
                  addVerticalSpace(10),
                  CustomFormField(
                    label: 'Description',
                    child: Wrap(
                      children: [
                        Text(
                            'Hiring a reputable professional landscape gardener entail paying for their knowledge, experience, time, equipment, and materials.'),
                      ],
                    ),
                  ),
                  CustomFormField(
                    label: 'Requirements',
                    child: Column(
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: kColorSecondary,
                                      size: 12,
                                    ),
                                    addHorizontalSpace(10),
                                    Text('data')
                                  ],
                                ),
                              )),
                    ),
                  ),
                  Expanded(
                    child: ClientTaskViewTabSection(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClientTaskViewTabSection extends StatefulWidget {
  const ClientTaskViewTabSection({
    super.key,
  });

  @override
  State<ClientTaskViewTabSection> createState() =>
      _ClientTaskViewTabSectionState();
}

class _ClientTaskViewTabSectionState extends State<ClientTaskViewTabSection>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: selectedIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorPadding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          labelPadding: kPadding10,
          controller: _tabController,
          tabs: [
            Title(
              color: Colors.black,
              child: const Text('Tasker(10)'),
            ),
            const Text('Timeline'),
            const Text('Collaboration'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              TaskersTabSection(),
              Text('data'),
              Text('data2'),
            ],
          ),
        )
      ],
    );
  }
}

class TaskersTabSection extends StatelessWidget {
  const TaskersTabSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // height: MediaQuery.of(context).size.height * 0.06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  const Text('Search'),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_alt,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) => TaskerCard(
              callback: () {},
            ),
          ),
        ),
      ],
    );
  }
}
