// ignore_for_file: prefer_is_empty

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/presentation/manager/entity_service_bloc.dart';
import 'package:cipher/features/services/presentation/manager/single_entity_service_cubit.dart';
import 'package:cipher/features/services/presentation/pages/popular_services_page.dart';
import 'package:cipher/features/services/presentation/pages/service_provider_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class PopularServicesSection extends StatelessWidget {
  const PopularServicesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntityServiceBloc, EntityServiceState>(
      builder: (context, state) {
        if (state is EntityServiceLoadSuccess) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SectionHeading(
                  labelName: 'Popular services',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PopularServicesPage.routeName,
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.service.result?.length ?? 0,
                    separatorBuilder: (context, index) => addHorizontalSpace(
                      10,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        context
                            .read<SingleEntityServiceCubit>()
                            .getSingleService(
                              state.service.result?[index].id ?? '',
                            );
                        Navigator.pushNamed(
                          context,
                          ServiceProviderPage.routeName,
                        );
                      },
                      child: ServiceCard(
                        title: state.service.result?[index].title,
                        imagePath:
                            state.service.result?[index].images?.length == 0
                                ? kServiceImageNImg
                                : state
                                    .service.result?[index].images?.first.media,
                        rating: state
                            .service.result?[index].rating?.first.rating
                            .toString(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
