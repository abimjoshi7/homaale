import 'package:cipher/core/carousel_slider/carousel_slider_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/google_maps_constants.dart';
import 'package:cipher/features/google_maps/presentation/bloc/nearby_task_entity_service_bloc.dart';
import 'package:cipher/features/google_maps/presentation/cubit/user_location_cubit.dart';
import 'package:cipher/features/google_maps/presentation/widgets/widgets.dart';
import 'package:cipher/features/search/presentation/widgets/search_card.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({
    super.key,
  });
  static const routeName = '/google-maps-page';

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  MapFilterStatus? _filter = MapFilterStatus.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: bottomDetailsSheet(),
      appBar: CustomAppBar(
        appBarTitle: "Explore Tasks & Services",
        trailingWidget: SizedBox.shrink(),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Wrap(
              spacing: 5.0,
              children:
                  MapFilterStatus.values.map((MapFilterStatus filterStatus) {
                return BlocBuilder<UserLocationCubit, UserLocationState>(
                  builder: (context, state) {
                    return ChoiceChip(
                      label: Text(filterStatus.name.toTitleCase()),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                            color:
                                _filter == filterStatus ? Colors.white : null,
                          ),
                      selectedColor: kColorBlue,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                            color: Colors.grey.shade300,
                          )),
                      selected: _filter == filterStatus,
                      onSelected: (bool selected) {
                        setState(() {
                          _filter = (selected ? filterStatus : null);
                        });
                        context
                            .read<NearbyTaskEntityServiceBloc>()
                            .add(NearbyTaskEntityServiceSelected(
                              location: state.location!,
                              slug: _filter!,
                            ));
                      },
                    );
                  },
                );
              }).toList(),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMapsView(),
                  ),
                  BlocBuilder<NearbyTaskEntityServiceBloc,
                      NearbyTaskEntityServiceState>(
                    builder: (_, state) {
                      print("log : ${state.activeList}");
                      if (state.theStates == TheStates.success) {}
                      return Positioned(
                        bottom: 100.0,
                        child: state.activeList !=[] || state.activeList !=null
                            ? SizedBox.shrink()
                            : SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: CarouselSliderHelper(
                                  controller: kButtonCarouselController,
                                  enlargeCenterPage: true,
                                  autoPlay: false,
                                  viewport: 0.71,
                                  aspectRatio: 3,
                                  list: List.generate(
                                    state.activeList!.length > 5
                                        ? 5
                                        : state.activeList!.length ,
                                    (index) => InkWell(
                                      onTap: () {
                                        context
                                            .read<TaskEntityServiceBloc>()
                                            .add(
                                              TaskEntityServiceSingleLoaded(
                                                id: state.activeList?[index]
                                                        .id.toString() ??
                                                    '',
                                              ),
                                            );
                                        Future.delayed(
                                          Duration(milliseconds: 400),
                                          () => Navigator.popAndPushNamed(
                                              context,
                                              TaskEntityServicePage.routeName),
                                        );
                                      },
                                      child: SizedBox(
                                        width: 283.0,
                                        height: 132.0,
                                        child: SearchCard(
                                          title: state.activeList?[index].title.toString()
                                              .toTitleCase(),
                                          name: state.activeList?[index]
                                              .createdBy?.fullName.toString(),
                                          location: state.activeList?[index].location?.isEmpty ?? false
                                              ? "Remote"
                                              : "${state.activeList?[index].location?.toCapitalized()}, ${state.activeList?[index].city?.name}",
                                          theChild: state.activeList?[index]
                                                      .isRequested ==
                                                  true
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
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      );
                    },
                  ),
                  CustomBottomSheet()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
