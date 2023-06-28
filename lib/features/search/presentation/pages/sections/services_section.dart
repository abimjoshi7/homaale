import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/presentation/widgets/search_card.dart';
import 'package:cipher/features/services/presentation/pages/trending_services_page.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../data/models/search_res.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({
    super.key,
    required this.service,
  });

  final List<ServiceElement>? service;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.maxFinite,
        child: CustomFormField(
          label: "Services",
          rightSection: TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                TrendingServicesPage.routeName,
              );
            },
            child: Text(
              "See all >",
            ),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: service?.length,
              itemBuilder: (context, index) => SizedBox(
                width: 300,
                child: InkWell(
                  onTap: () {
                    context.read<TaskEntityServiceBloc>().add(
                          TaskEntityServiceSingleLoaded(
                            id: service?[index].id ?? '',
                          ),
                        );
                    Future.delayed(
                      Duration(milliseconds: 400),
                      () => Navigator.popAndPushNamed(
                          context, TaskEntityServicePage.routeName),
                    );
                  },
                  child: SearchCard(
                    title: service?[index].title?.toTitleCase(),
                    name: service?[index].createdBy?.fullName,
                    location: service?[index].location?.isEmpty ?? false
                        ? "Remote"
                        : service?[index].location?.toCapitalized(),
                    theChild: IconText(
                      color: kColorAmber,
                      label:
                          "${((service?[index].rating ?? "0.0"))}(${((service?[index].ratingCount ?? "0"))})",
                      iconData: Icons.star_rounded,
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
