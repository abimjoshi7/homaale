import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/google_maps/presentation/bloc/nearby_task_entity_service_bloc.dart';
import 'package:cipher/features/search/presentation/widgets/search_card.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NearbyTaskEntityServiceBloc,
        NearbyTaskEntityServiceState>(
      builder: (context, state) {
        return DraggableScrollableSheet(
          initialChildSize: 0.1,
          minChildSize: 0.09,
          maxChildSize: 0.98,
          snap: true,
          builder: (context, scrollController) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
              child: Container(
                width: double.infinity,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: ListView(
                  controller: scrollController,
                  children: <Widget>[
                        addVerticalSpace(8.0),
                        BottomSheetHeader(),
                      ] +
                      List.generate(
                        state.activeList!.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 10.0,
                          ),
                          child: SizedBox(
                            height: 180.0,
                            child: SearchCard(
                              title:
                                  state.activeList?[index].title?.toTitleCase(),
                              name:
                                  state.activeList?[index].createdBy?.fullName,
                              location: state.activeList?[index].location
                                          ?.isEmpty ??
                                      false
                                  ? "Remote"
                                  : "${state.activeList?[index].location?.toCapitalized()}, ${state.activeList?[index].city?.name}",
                              theChild:
                                  state.activeList?[index].isRequested == true
                                      ? Row(
                                          children: [
                                            Text(
                                              "Rs ${state.activeList?[index].budgetFrom?.split('.')[0]} - Rs ${state.activeList?[index].budgetTo?.split('.')[0]}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ),
                                            Text(
                                              "/per project",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            )
                                          ],
                                        )
                                      : IconText(
                                          color: kColorAmber,
                                          label:
                                              "${((state.activeList?[index].rating ?? []).first.rating)}(${((state.activeList?[index].rating ?? []).first.ratingCount)})",
                                          iconData: Icons.star_rounded,
                                        ),
                              callback: () {
                                context.read<TaskEntityServiceBloc>().add(
                                      TaskEntityServiceSingleLoaded(
                                        id: state.activeList?[index].id ?? '',
                                      ),
                                    );
                                Future.delayed(
                                  Duration(milliseconds: 400),
                                  () => Navigator.popAndPushNamed(
                                      context, TaskEntityServicePage.routeName),
                                );
                              },
                              showButton: true,
                            ),
                          ),
                        ),
                      ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
