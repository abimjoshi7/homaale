import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/saved/data/models/res/saved_model_res.dart';
import 'package:cipher/features/saved/presentation/bloc/saved_bloc.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/apply_task_page.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../locator.dart';

class SavedCollectionPage extends StatefulWidget {
  static const routeName = '/saved-collection-page';
  const SavedCollectionPage({super.key});

  @override
  State<SavedCollectionPage> createState() => SavedCollectionPageState();
}

class SavedCollectionPageState extends State<SavedCollectionPage> {
  final searchController = TextEditingController();
  late final savedBloc = locator<SavedBloc>();

  @override
  void initState() {
    savedBloc.add(SavedListLoaded());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    savedBloc.close();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final heading = routeData?['heading'] as String?;
    final data = routeData?['data'] as List<Result>?;
    return Scaffold(
        appBar: CustomAppBar(
            appBarTitle: heading ?? '', trailingWidget: SizedBox()),
        body: ListView(
          // mainAxisSize: MainAxisSize.min,
          children: [
            // addVerticalSpace(15),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(
            //       Icons.filter_alt,
            //       color: kColorGrey,
            //     ),
            //     InkWell(
            //       onTap: () {},
            //       child: SizedBox(
            //         width: 200,
            //         height: 52,
            //         child: CustomTextFormField(
            //           hintText: "Search",
            //           controller: searchController,
            //           inputAction: TextInputAction.done,
            //           onFieldSubmitted: (p0) {
            //             if (p0!.length >= 3) {
            //               // savedBloc.add(SavedListLoaded(
            //               //     query: p0, type: 'entityservice', newFetch: true));
            //               heading == 'Tasks'
            //                   ? savedBloc.add(SavedListLoaded(
            //                       query: p0, type: 'task', newFetch: true))
            //                   : savedBloc.add(SavedListLoaded(
            //                       query: p0, type: 'entityservice', newFetch: true));
            //             }
            //           },
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            heading == 'Tasks'
                ? SearchTaskSection(
                    savedBloc: savedBloc,
                    data: data,
                  )
                : SearchServiceSection(
                    savedBloc: savedBloc,
                    data: data,
                  ),
          ],
        ));
  }
}

class SearchTaskSection extends StatelessWidget {
  final SavedBloc savedBloc;
  final List<Result>? data;
  const SearchTaskSection({Key? key, required this.savedBloc, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBloc, SavedState>(
      bloc: savedBloc,
      builder: (context, state) {
        switch (state.theStates) {
          case TheStates.initial:
            return const Center(child: CardLoading(height: 700));
          case TheStates.success:
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: data?.map((e) {
                        return SizedBox(
                          height: 250,
                          child: InkWell(
                            onTap: () {
                              context.read<TaskBloc>().add(
                                    SingleEntityTaskLoadInitiated(
                                      id: e.data?.id.toString() ?? '',
                                      userId: context
                                              .read<UserBloc>()
                                              .state
                                              .taskerProfile
                                              ?.user
                                              ?.id ??
                                          '',
                                    ),
                                  );
                              context.read<TaskEntityServiceBloc>().add(
                                    FetchRecommendedSimilar(
                                      id: e.data?.id.toString() ?? '',
                                    ),
                                  );

                              context.read<RatingReviewsBloc>().add(
                                    SetToInitial(
                                      id: e.data?.id.toString() ?? '',
                                    ),
                                  );
                              Navigator.pushNamed(
                                  context, SingleTaskPage.routeName);
                            },
                            child: TaskCard(
                              shareLinked: "$kShareLinks/tasks/${e.data?.id}",
                              id: e.data?.id.toString(),
                              isRange: e.data?.isRange ?? false,
                              isBookmarked: e.data?.isBookmarked,
                              isOwner: e.data?.createdBy?.id ==
                                  context
                                      .read<UserBloc>()
                                      .state
                                      .taskerProfile
                                      ?.user
                                      ?.id,
                              buttonLabel: 'Apply now',
                              startRate: '${e.data?.budgetFrom ?? 0}',
                              endRate: '${e.data?.budgetTo ?? 0}',
                              budgetType: '${e.data?.budgetType}',
                              count: e.data?.count.toString(),
                              imageUrl: e.data?.createdBy?.profileImage ??
                                  kHomaaleImg,
                              createdByName: e.data?.createdBy?.fullName,
                              location: e.data?.location == ''
                                  ? 'Remote'
                                  : e.data?.location,
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
                                        userId: context
                                                .read<UserBloc>()
                                                .state
                                                .taskerProfile
                                                ?.user
                                                ?.id ??
                                            '',
                                      ),
                                    );
                                Navigator.pushNamed(
                                    context, ApplyTaskPage.routeName);
                              },
                              onTapCallback: () {},
                            ),
                          ),
                        );
                      }).toList() ??
                      []),
            );
          case TheStates.failure:
            return Center(child: Text("Could Not Load Data"));
          default:
            return const Center(child: CardLoading(height: 700));
        }
      },
    );
  }
}

class SearchServiceSection extends StatelessWidget {
  final List<Result>? data;
  final SavedBloc savedBloc;
  const SearchServiceSection({Key? key, this.data, required this.savedBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBloc, SavedState>(
      bloc: savedBloc,
      builder: (context, state) {
        switch (state.theStates) {
          case TheStates.initial:
            return CardLoading(height: 700);
          case TheStates.success:
            return GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              childAspectRatio: 0.7,
              children: data?.map((e) {
                    return InkWell(
                      onTap: () {
                        context.read<TaskEntityServiceBloc>().add(
                              TaskEntityServiceSingleLoaded(
                                id: e.data?.id.toString() ?? '',
                              ),
                            );
                        context.read<TaskEntityServiceBloc>().add(
                              FetchRecommendedSimilar(
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
                        location:
                            '${e.data?.location == '' ? 'Remote' : e.data?.location ?? 'Remote'}',
                        createdBy: "${e.data?.createdBy?.fullName}",
                        title: '${e.data?.title}',
                        imagePath: e.data?.images?.length == 0
                            ? kHomaaleImg
                            : e.data?.images?.first['media'].toString() ??
                                kHomaaleImg,
                        rating: e.data?.rating.toString(),
                        isBookmarked: e.data?.isBookmarked,
                        isRange: e.data?.isRange,
                        rateTo: double.parse(e.data?.budgetTo ?? "")
                            .toInt()
                            .toString(),
                        rateFrom: double.parse(e.data?.budgetFrom ?? "")
                            .toInt()
                            .toString(),
                        shareCallback: () {
                          Share.share(
                            "$kShareLinks/tasks/${e.data?.id.toString()}",
                            subject: e.data?.title,
                          );
                        },
                      ),
                    );
                  }).toList() ??
                  [],
            );
          default:
            return CardLoading(
              height: double.maxFinite,
            );
        }
      },
    );
  }
}
