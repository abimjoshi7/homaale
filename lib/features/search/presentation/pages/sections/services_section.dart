import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/presentation/widgets/search_card.dart';
import 'package:cipher/features/services/presentation/pages/popular_services_page.dart';
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
        height: 200,
        width: double.maxFinite,
        child: CustomFormField(
          label: "Services",
          rightSection: TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                PopularServicesPage.routeName,
              );
            },
            child: Text(
              "See all >",
            ),
          ),
          child: Expanded(
            child: ListView.builder(
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
                      Duration(milliseconds: 500),
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
                          "${((service?[index].rating ?? []).first.rating)}(${((service?[index].rating ?? []).first.ratingCount)})",
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
