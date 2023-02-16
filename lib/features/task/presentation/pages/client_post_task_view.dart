import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ClientPostTaskViewPage extends StatelessWidget {
  static const routeName = '/client-post-task-view-page';
  const ClientPostTaskViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            trailingWidget: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
            ),
            child: Text('Gardening'),
          ),
          Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Image.network(
              kServiceImageNImg,
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  CircleAvatar(),
                  Column(
                    children: [
                      Text(
                        'data',
                        style: kPurpleText12,
                      ),
                      Text(
                        'data',
                        style: kHighlightedText,
                      ),
                    ],
                  ),
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
              )
            ],
          ),
          Row(
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
          Row(
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
          CustomFormText(
            name: 'Description',
            child: Wrap(
              children: [
                Text('asd'),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read more',
                    style: kLightBlueText14,
                  ),
                ),
              ],
            ),
          ),
          CustomFormText(
            name: 'Requirements',
            child: Column(),
          ),
          ClientTaskViewTabSection()
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
      length: 2,
      vsync: this,
      initialIndex: selectedIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Title(
                  color: Colors.black,
                  child: Text('Tasker(10)'),
                ),
                Text('Timeline'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                TaskersTabSection(),
                TaskersTabSection(),
              ],
            ),
          )
        ],
      ),
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
          height: MediaQuery.of(context).size.height * 0.06,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                ),
              ),
              Text('Search'),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.filter_alt,
                ),
              ),
            ],
          ),
        ),
        // Expanded(child: GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder))
      ],
    );
  }
}
