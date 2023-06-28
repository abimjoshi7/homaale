import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task/presentation/pages/popular_tasker_page_new.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/tasker/presentation/view/tasker.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../data/models/search_res.dart';

class TaskerSection extends StatelessWidget {
  const TaskerSection({
    super.key,
    required this.taskers,
  });

  final List<Tasker>? taskers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.maxFinite,
        child: CustomFormField(
          label: "Taskers",
          rightSection: TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                PopularTaskerNew.routeName,
              );
            },
            child: Text(
              "See all >",
            ),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: taskers?.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  context.read<TaskerCubit>().loadSingleTasker(
                        taskers?[index].user?.id ?? '',
                      );
                  context.read<TaskerCubit>().loadSingleTaskerServices(
                        taskers?[index].user?.id ?? '',
                      );
                  context.read<TaskerCubit>().loadSingleTaskerTask(
                        taskers?[index].user?.id ?? '',
                      );
                  context.read<TaskerCubit>().loadSingleTaskerReviews(
                        taskers?[index].user?.id ?? '',
                      );

                  Future.delayed(
                    Duration(milliseconds: 500),
                    () => Navigator.popAndPushNamed(
                      context,
                      TaskerProfileView.routeName,
                    ),
                  );
                },
                child: SizedBox(
                  width: 300,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      taskers?[index].profileImage ??
                                          kNoImageNImg,
                                    ),
                                  ),
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          taskers?[index]
                                                  .fullName
                                                  ?.toTitleCase() ??
                                              "",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      addHorizontalSpace(
                                        8,
                                      ),
                                      Icon(
                                        Icons.verified,
                                        color: kColorBlue,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    taskers?[index].designation ?? "",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              ),
                            ),
                          ),
                          addVerticalSpace(
                            8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: IconText(
                                  label:
                                      "${taskers?[index].rating?.rating ?? "0.0"}(${taskers?[index].rating?.ratingCount ?? "0"})",
                                  iconData: Icons.star_rounded,
                                  color: kColorAmber,
                                ),
                              ),
                              Flexible(
                                child: IconText(
                                  label: taskers?[index]
                                          .stats
                                          ?.happyClients
                                          .toString() ??
                                      "",
                                  iconData: Icons.emoji_emotions_outlined,
                                  color: kColorOrange,
                                ),
                              ),
                              Flexible(
                                child: IconText(
                                  label: taskers?[index].addressLine1 ?? "",
                                  iconData: Icons.location_on_outlined,
                                  color: kColorPink,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
