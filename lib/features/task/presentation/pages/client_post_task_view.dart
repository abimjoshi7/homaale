import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ClientPostTaskViewPage extends StatelessWidget {
  static const routeName = '/client-post-task-view-page';
  const ClientPostTaskViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Something went wrong'),
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.23,
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
