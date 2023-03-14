import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/task/data/models/single_task_entity_service.dart'
    as ses;
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SingleTaskPage extends StatefulWidget {
  const SingleTaskPage({super.key});
  static const routeName = '/single-task-page';

  @override
  State<SingleTaskPage> createState() => _SingleTaskPageState();
}

class _SingleTaskPageState extends State<SingleTaskPage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state.theState == TheStates.success && state.taskModel != null) {
            final documentDescription = Bidi.stripHtmlIfNeeded(
              state.taskModel?.description ??
                  'Root canal treatment (endodontics) is a dental procedure used to treat infection at the centre of a tooth. Root canal treatment is not painful and can save a tooth that might otherwise have to be removed completely.',
            );
            final List<ses.Image> taskMedia = [
              ...state.taskModel?.images ?? [],
              ...state.taskModel?.videos ?? [],
            ];

            return Column(
              children: [
                kHeight50,
                CustomHeader(
                  leadingWidget: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  trailingWidget: IconButton(
                    onPressed: () async {},
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  child: Text(
                    state.taskModel?.service?.category?.name ?? 'Task Title',
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      if (taskMedia.isNotEmpty)
                        CarouselSlider.builder(
                          itemCount: taskMedia.length,
                          itemBuilder: (context, index, realIndex) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Stack(
                                children: [
                                  if (taskMedia[index].mediaType == 'mp4')
                                    VideoPlayerWidget(
                                      videoURL: taskMedia[index].media ??
                                          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                                    )
                                  else
                                    Image.network(
                                      taskMedia[index].media.toString(),
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.network(kServiceImageNImg),
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  Positioned(
                                    bottom: 10,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                            taskMedia.length,
                                            (ind) => Container(
                                              height: 10,
                                              margin: const EdgeInsets.all(2),
                                              width: index == ind ? 20 : 10,
                                              decoration: BoxDecoration(
                                                color: index == ind
                                                    ? kColorGrey
                                                    : Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          options: CarouselOptions(
                            viewportFraction: 1,
                            enableInfiniteScroll: false,
                          ),
                        )
                      else
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Image.network(
                            kServiceImageNImg,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      Padding(
                        padding: kPadding10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                          image: NetworkImage(
                                            state.taskModel?.createdBy
                                                    ?.profileImage ??
                                                kDefaultAvatarNImg,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    addHorizontalSpace(
                                      10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: Text(
                                            state.taskModel?.title ?? '',
                                            style: kPurpleText16,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "${state.taskModel?.createdBy?.firstName ?? ''}"
                                          " ${state.taskModel?.createdBy?.lastName ?? ''}",
                                          style: kLightBlueText12,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.red,
                                    ),
                                    kWidth10,
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.more_vert,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            addVerticalSpace(10),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.red,
                                      size: 18,
                                    ),
                                    kWidth5,
                                    Text(
                                      Jiffy(
                                        state.taskModel?.startDate ??
                                            DateTime.now().toString(),
                                      ).yMMMMd,
                                    ),
                                  ],
                                ),
                                addHorizontalSpace(20),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.red,
                                      size: 18,
                                    ),
                                    kWidth5,
                                    Text(
                                      "${state.taskModel?.city?.name ?? ''}, ${state.taskModel?.city?.country?.name ?? ''}",
                                    ),
                                  ],
                                )
                              ],
                            ),
                            addVerticalSpace(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.watch_later_outlined,
                                      color: Colors.blue,
                                      size: 18,
                                    ),
                                    kWidth5,
                                    Text(
                                      '${state.taskModel?.startTime}',
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.people_alt_outlined,
                                      color: kColorPrimary,
                                      size: 18,
                                    ),
                                    kWidth5,
                                    Text(
                                      '${state.taskApplyCountModel?.count?.first.taskerCount ?? 0} Applied',
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: kColorPrimary,
                                      size: 18,
                                    ),
                                    kWidth5,
                                    Text(
                                      "${state.taskModel?.viewsCount ?? 0} Views",
                                    ),
                                  ],
                                )
                              ],
                            ),
                            addVerticalSpace(24),
                            const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Description',
                                style: kPurpleText16,
                              ),
                            ),
                            kHeight10,
                            Text(
                              documentDescription,
                            ),
                            addVerticalSpace(24),
                            const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Requirements',
                                style: kPurpleText16,
                              ),
                            ),
                            kHeight10,
                            ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 10,
                                    color: Colors.orange,
                                  ),
                                  kWidth10,
                                  Text(
                                    StringUtils.capitalize(
                                      state.taskModel?.highlights?[index] ?? '',
                                    ),
                                    style: kRequirements,
                                  )
                                ],
                              ),
                              separatorBuilder: (context, index) =>
                                  addVerticalSpace(8.0),
                              itemCount:
                                  state.taskModel?.highlights?.length ?? 0,
                            ),
                          ],
                        ),
                      ),
                      TabBar(
                        controller: tabController,
                        tabs: const [
                          Tab(
                            text: 'Taskers',
                          ),
                          Tab(
                            text: 'Collaboration',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            Container(),
                            Container(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
