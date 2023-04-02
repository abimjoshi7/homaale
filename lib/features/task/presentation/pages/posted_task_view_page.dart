// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class PostedTaskViewPage extends StatelessWidget {
  static const routeName = '/posted-task-view-page';
  const PostedTaskViewPage({
    super.key,
    this.imageUrl,
  });
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          print(state);
          if (state.theState == TheStates.success) {
            final taskModel = state.taskModel;
            return Column(
              children: [
                addVerticalSpace(50),
                CustomHeader(
                  trailingWidget: IconButton(
                    onPressed: () {
                      print(state.allTaskList?.result?.last.entityService?.id);
                      // print(state);
                      // print(state.allTaskList?.toJson());
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  child: Text(
                    taskModel?.title ?? '',
                  ),
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
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        taskModel?.createdBy?.profileImage ??
                                            kServiceImageNImg,
                                      ),
                                    ),
                                  ),
                                ),
                                addHorizontalSpace(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      taskModel?.title ?? '',
                                      style: kPurpleText16,
                                    ),
                                    Text(
                                      "${taskModel?.createdBy?.firstName ?? ''} ${taskModel?.createdBy?.lastName ?? ''}",
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
                              label: Jiffy(taskModel?.createdAt ??
                                      DateTime.now().toString())
                                  .yMMMEd,
                              iconData: Icons.calendar_today_rounded,
                            ),
                            IconText(
                              label: taskModel?.location ??
                                  'Buddhanagar, Kathmandu',
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
                              label:
                                  "${taskModel?.startTime} ${taskModel?.endTime}",
                              iconData: Icons.watch_later_outlined,
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
                              Text(taskModel?.description ??
                                  'Hiring a reputable professional landscape gardener entail paying for their knowledge, experience, time, equipment, and materials.'),
                            ],
                          ),
                        ),
                        addVerticalSpace(
                          10,
                        ),
                        CustomFormField(
                          label: 'My Orders',
                          isRequired: false,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconText(
                                  color: kColorBlue,
                                  label: 'Today, Wednesday',
                                  iconData: Icons.calendar_today_outlined,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconText(
                                  color: kColorGreen,
                                  label: 'Today, Wednesday',
                                  iconData: Icons.watch_later_outlined,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconText(
                                  color: kColorSecondary,
                                  label: 'Today, Wednesday',
                                  iconData: Icons.attach_money_rounded,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconText(
                                  color: Colors.red,
                                  label: 'Today, Wednesday',
                                  iconData: Icons.location_on_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // CustomFormField(
                        //   label: 'Requirements',
                        //   child: Column(
                        //     children: List.generate(
                        //         3,
                        //         (index) => Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Row(
                        //                 children: [
                        //                   Icon(
                        //                     Icons.circle,
                        //                     color: kColorSecondary,
                        //                     size: 12,
                        //                   ),
                        //                   addHorizontalSpace(10),
                        //                   Text('data')
                        //                 ],
                        //               ),
                        //             )),
                        //   ),
                        // ),
                        Expanded(
                          child: ClientTaskViewTabSection(),
                        ),
                      ],
                    ),
                  ),
                ),
                PriceBookFooterSection(
                  onPressed: () {},
                  buttonLabel: 'Reschedule',
                  theLeftWidget: Text('Do you want to reschedule?'),
                ),
              ],
            );
          }
          return const Placeholder();
        },
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
