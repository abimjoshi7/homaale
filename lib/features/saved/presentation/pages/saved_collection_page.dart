import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/saved/data/models/res/saved_model_res.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/apply_task_page.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/tasker/presentation/view/tasker.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SavedCollectionPage extends StatefulWidget {
  static const routeName = '/saved-collection-page';
  const SavedCollectionPage({super.key});

  @override
  State<SavedCollectionPage> createState() => SavedCollectionPageState();
}

class SavedCollectionPageState extends State<SavedCollectionPage> {
  @override
  Widget build(BuildContext context) {
    final routeData = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final heading = routeData?['heading'] as String?;
    final data = routeData?['data'] as List<Result>?;

    return Scaffold(
      appBar: CustomAppBar(appBarTitle: heading ?? '', trailingWidget: SizedBox()),
      body: heading == 'Tasks'
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                  children: data?.map((e) {
                        return InkWell(
                          onTap: () {
                            context.read<TaskBloc>().add(
                                  SingleEntityTaskLoadInitiated(
                                    id: e.data?.id.toString() ?? '',
                                  ),
                                );
                            Navigator.pushNamed(context, SingleTaskPage.routeName);
                          },
                          child: TaskCard(
                            id: e.data?.id.toString(),
                            isRange: e.data?.isRange ?? false,
                            isBookmarked: e.data?.isBookmarked,
                            isOwner: e.data?.createdBy?.id == context.read<UserBloc>().state.taskerProfile?.user?.id,
                            buttonLabel: 'Apply now',
                            startRate: '${e.data?.budgetFrom ?? 0}',
                            endRate: '${e.data?.budgetTo ?? 0}',
                            budgetType: '${e.data?.budgetType}',
                            count: e.data?.count.toString(),
                            imageUrl: e.data?.createdBy?.profileImage ?? kServiceImageNImg,
                            location: e.data?.location == '' ? 'Remote' : e.data?.location,
                            endHour: Jiffy(
                              e.data?.createdAt.toString(),
                            ).jm,
                            endDate: Jiffy(
                              e.data?.endDate.toString(),
                            ).yMMMMd,
                            taskName: e.data?.title,
                            callback: () {
                              context.read<TaskBloc>().add(
                                    SingleEntityTaskLoadInitiated(
                                      id: e.data?.id.toString() ?? '',
                                    ),
                                  );
                              Navigator.pushNamed(context, ApplyTaskPage.routeName);
                            },
                            onTapCallback: () {},
                          ),
                        );
                      }).toList() ??
                      []),
            )
          : GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              childAspectRatio: 0.9,
              children: data?.map((e) {
                    return InkWell(
                      onTap: () {
                        context.read<TaskEntityServiceBloc>().add(
                              TaskEntityServiceSingleLoaded(
                                id: e.data?.id.toString() ?? '',
                              ),
                            );

                        context.read<RatingReviewsBloc>().add(
                              SetToInitial(
                                id: e.data?.id.toString() ?? '',
                              ),
                            );
                        Navigator.pushNamed(
                          context,
                          TaskEntityServicePage.routeName,
                        );
                      },
                      child: ServiceCard(
                        id: e.data?.id.toString(),
                        location: '${e.data?.location == '' ? 'Remote' : e.data?.location ?? 'Remote'}',
                        createdBy: "${e.data?.createdBy?.fullName}",
                        title: '${e.data?.title}',
                        imagePath: e.data?.images?.length == 0
                            ? kServiceImageNImg
                            : e.data?.images?.first['media'].toString() ?? kServiceImageNImg,
                        rating: e.data?.rating.toString(),
                        isBookmarked: e.data?.isBookmarked,
                        isRange: e.data?.isRange,
                        rateTo: double.parse(e.data?.budgetFrom ?? "").toInt().toString(),
                        rateFrom: double.parse(e.data?.budgetTo ?? "").toInt().toString(),
                      ),
                    );
                  }).toList() ??
                  [],
            ),
    );
  }
}
