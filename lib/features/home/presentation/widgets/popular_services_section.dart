// ignore_for_file: prefer_is_empty

import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/services/presentation/pages/popular_services_page.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TrendingServicesSection extends StatelessWidget {
  static final pServiceKey = GlobalKey();

  const TrendingServicesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskEntityServiceBloc, TaskEntityServiceState>(
      listenWhen: (previous, current) {
        if (previous.theStates == TheStates.loading &&
            current.theStates == TheStates.success) return true;
        return false;
      },
      listener: (context, state) {
        if (state.theStates == TheStates.success) {
          log("YIP");
          Navigator.pushNamed(
            context,
            TaskEntityServicePage.routeName,
          );
        }
      },
      builder: (context, state) {
        return BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
          builder: (context, state) {
            if (state.theStates == TheStates.success) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    SectionHeading(
                      labelName: 'Trending services',
                      onTap: () async {
                        Navigator.pushNamed(
                          context,
                          PopularServicesPage.routeName,
                        );
                      },
                      showKey: pServiceKey,
                      showCaseTitle: 'Trending Service',
                      showCaseDec: 'See All Trending Service from here.',
                    ),
                    SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            state.taskEntityServiceModel.result?.length ?? 0,
                        separatorBuilder: (context, index) =>
                            addHorizontalSpace(10),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            context.read<TaskEntityServiceBloc>().add(
                                  TaskEntityServiceSingleLoaded(
                                    id: state.taskEntityServiceModel
                                            .result?[index].id ??
                                        '',
                                  ),
                                );
                            context.read<RatingReviewsBloc>().add(
                                  SetToInitial(
                                    id: state.taskEntityServiceModel
                                            .result?[index].id ??
                                        '',
                                  ),
                                );
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.46,
                            child: ServiceCard(
                              location: state.taskEntityServiceModel
                                          .result?[index].location ==
                                      ""
                                  ? "Remote"
                                  : state.taskEntityServiceModel.result?[index]
                                      .location,
                              description:
                                  "${state.taskEntityServiceModel.result?[index].createdBy?.firstName} ${state.taskEntityServiceModel.result?[index].createdBy?.lastName}",
                              title: state
                                  .taskEntityServiceModel.result?[index].title,
                              imagePath: state.taskEntityServiceModel
                                          .result?[index].images?.length ==
                                      0
                                  ? kServiceImageNImg
                                  : state.taskEntityServiceModel.result?[index]
                                      .images?.first.media,
                              rating: state.taskEntityServiceModel
                                  .result?[index].rating?.first.rating
                                  .toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormField(
                label: "Popular Services",
                child: CardLoading(
                  height: 230,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
