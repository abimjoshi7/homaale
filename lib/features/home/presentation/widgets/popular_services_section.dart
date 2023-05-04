// ignore_for_file: prefer_is_empty

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/services/presentation/pages/popular_services_page.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class PopularServicesSection extends StatelessWidget {
  static final pServiceKey = GlobalKey();

  const PopularServicesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
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
                    itemCount: state.service?.result?.length ?? 0,
                    separatorBuilder: (context, index) => addHorizontalSpace(10),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        context.read<TaskEntityServiceBloc>().add(
                              TaskEntityServiceSingleLoaded(
                                id: state.service?.result?[index].id ?? '',
                              ),
                            );
                        Navigator.pushNamed(
                          context,
                          TaskEntityServicePage.routeName,
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.46,
                        child: ServiceCard(
                          location: state.service?.result?[index].location == ""
                              ? "Remote"
                              : state.service?.result?[index].location,
                          description:
                              "${state.service?.result?[index].createdBy?.firstName} ${state.service?.result?[index].createdBy?.lastName}",
                          title: state.service?.result?[index].title,
                          imagePath: state.service?.result?[index].images?.length == 0
                              ? kServiceImageNImg
                              : state.service?.result?[index].images?.first.media,
                          rating: state.service?.result?[index].rating?.first.rating.toString(),
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
  }
}
