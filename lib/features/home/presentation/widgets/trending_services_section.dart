import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/services/presentation/pages/trending_services_page.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TrendingServicesSection extends StatefulWidget {
  static final pServiceKey = GlobalKey();

  const TrendingServicesSection({
    super.key,
  });

  @override
  State<TrendingServicesSection> createState() => _TrendingServicesSectionState();
}

class _TrendingServicesSectionState extends State<TrendingServicesSection> {
  @override
  Widget build(BuildContext context) {
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
                      TrendingServicesPage.routeName,
                    );
                  },
                  showKey: TrendingServicesSection.pServiceKey,
                  showCaseTitle: 'Trending Service',
                  showCaseDec: 'See All Trending Service from here.',
                ),
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.taskEntityServiceModel.result?.length ?? 0,
                    separatorBuilder: (context, index) => addHorizontalSpace(10),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        context.read<TaskEntityServiceBloc>().add(
                              TaskEntityServiceSingleLoaded(
                                id: state.taskEntityServiceModel.result?[index].id ?? '',
                              ),
                            );
                        context.read<RatingReviewsBloc>().add(
                              SetToInitial(
                                id: state.taskEntityServiceModel.result?[index].id ?? '',
                              ),
                            );
                        Navigator.pushNamed(
                          context,
                          TaskEntityServicePage.routeName,
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.48,
                        child: ServiceCard(
                          location: state.taskEntityServiceModel.result?[index].location == ""
                              ? "Remote"
                              : state.taskEntityServiceModel.result?[index].location,
                          createdBy:
                              "${state.taskEntityServiceModel.result?[index].createdBy?.firstName} ${state.taskEntityServiceModel.result?[index].createdBy?.lastName}",
                          title: state.taskEntityServiceModel.result?[index].title,
                          imagePath: state.taskEntityServiceModel.result?[index].images?.length == 0
                              ? kServiceImageNImg
                              : state.taskEntityServiceModel.result?[index].images?.first.media,
                          rating: state.taskEntityServiceModel.result?[index].rating.toString(),
                          isRange: state.taskEntityServiceModel.result?[index].isRange,
                          rateTo: double.parse(state.taskEntityServiceModel.result?[index].payableTo ?? "")
                              .toInt()
                              .toString(),
                          rateFrom: double.parse(state.taskEntityServiceModel.result?[index].payableFrom ?? "")
                              .toInt()
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
            label: "Trending Services",
            child: CardLoading(
              height: 230,
            ),
          ),
        );
      },
    );
  }
}
