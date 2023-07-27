import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/marketing/presentation/bloc/marketing_ads_bloc.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/edit_task_entity_service_page.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/scroll_helper.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';

class TrendingServicesPage extends StatefulWidget {
  static const routeName = '/trending-services-page';
  const TrendingServicesPage({super.key});

  @override
  State<TrendingServicesPage> createState() => _TrendingServicesPageState();
}

class _TrendingServicesPageState extends State<TrendingServicesPage>
    with TheModalBottomSheet {
  late final TaskEntityServiceBloc entityServiceBloc;
  late final ScrollController _controller;
  final searchController = TextEditingController();
  final payableFrom = TextEditingController();
  final payableTo = TextEditingController();
  final _serviceTypeKey = GlobalKey<FormFieldState>();
  final _locationKey = GlobalKey<FormFieldState>();

  String? sortBudget;
  String? sortDate;
  String? selectedCategoryId;
  String? selectedLocation;
  DateTime? dateFrom;
  DateTime? dateTo;
  String? serviceType = "Pilot";
  String? serviceId;
  String? location;

  @override
  void initState() {
    super.initState();
    entityServiceBloc = locator<TaskEntityServiceBloc>()
      ..add(TaskEntityServiceInitiated(isTask: false));

    _controller = ScrollController()
      ..addListener(
        () {
          ScrollHelper.nextPageTrigger(
            _controller,
            entityServiceBloc.add(
              TaskEntityServiceInitiated(
                newFetch: false,
                isTask: false,
                dateFrom: dateFrom == null
                    ? null
                    : DateFormat("yyyy-MM-dd").format(dateFrom!),
                dateTo: dateTo == null
                    ? null
                    : DateFormat("yyyy-MM-dd").format(dateTo!),
                payableFrom:
                    payableFrom.text.length == 0 ? null : payableFrom.text,
                payableTo: payableTo.text.length == 0 ? null : payableTo.text,
                serviceId: serviceType,
                city: location,
                category: serviceType,
                dateSort: sortDate,
                budgetSort: sortBudget,
              ),
            ),
          );
        },
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    entityServiceBloc.close();
    payableFrom.dispose();
    payableTo.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "Trending Services",
        trailingWidget: SizedBox.shrink(),
      ),
      body: BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
        bloc: entityServiceBloc,
        builder: (context, state) {
          switch (state.theStates) {
            case TheStates.success:
              return Column(
                children: [
                  addVerticalSpace(8),
                  _buildFilters(context),
                  addVerticalSpace(8),
                  Expanded(
                    child: MasonryGridView.builder(
                      controller: _controller,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        if (index >= state.taskEntityServices!.length) {
                          return Center(child: const BottomLoader());
                        }
                        if (index % 5 == 4)
                          return SizedBox(
                            height: 250,
                            child: Card(
                              child: BlocBuilder<MarketingAdsBloc,
                                  MarketingAdsState>(
                                builder: (context, state) {
                                  var list = [];
                                  if (state.marketingAdsDto.result != null &&
                                      state.marketingAdsDto.result!.isNotEmpty)
                                    list.addAll(
                                      state.marketingAdsDto.result!
                                          .map((e) => e.image)
                                          .toList(),
                                    );
                                  return Image.network(
                                    list.last.toString(),
                                    fit: BoxFit.fill,
                                  );
                                },
                              ),
                            ),
                          );
                        return ServiceCard(
                          theHeight: (index % 5) == 0
                              ? 272
                              : (index % 5) == 1
                                  ? 290
                                  : (index % 5) == 2
                                      ? 300
                                      : (index % 5) == 3
                                          ? 280
                                          : 320,
                          shareCallback: () {
                            Share.share(
                              "$kShareLinks/tasks/${state.taskEntityServices?[index].id}",
                              subject: state.taskEntityServices?[index].title,
                            );
                          },
                          createdByProfileImg:
                              "${state.taskEntityServices?[index].createdBy?.profileImage}",
                          callback: () {
                            context.read<TaskEntityServiceBloc>().add(
                                  TaskEntityServiceSingleLoaded(
                                    id: state.taskEntityServices?[index].id ??
                                        "",
                                  ),
                                );

                            context.read<TaskEntityServiceBloc>().add(
                                  FetchRecommendedSimilar(
                                    id: state.taskEntityServices?[index].id ??
                                        "",
                                  ),
                                );

                            context.read<RatingReviewsBloc>().add(SetToInitial(
                                  id: state.taskEntityServices?[index].id ?? "",
                                ));

                            Navigator.pushNamed(
                              context,
                              TaskEntityServicePage.routeName,
                            );
                          },
                          id: state.taskEntityServices?[index].id,
                          title: state.taskEntityServices?[index].title,
                          imagePath:
                              state.taskEntityServices?[index].images?.length ==
                                      0
                                  ? kHomaaleImg
                                  : state.taskEntityServices?[index].images
                                      ?.first.media,
                          rating: state.taskEntityServices?[index].rating
                              ?.toString(),
                          createdBy:
                              "${state.taskEntityServices?[index].createdBy?.firstName} ${state.taskEntityServices?[index].createdBy?.lastName}",
                          description:
                              state.taskEntityServices?[index].description,
                          location:
                              state.taskEntityServices?[index].location == ''
                                  ? "Remote"
                                  : state.taskEntityServices?[index].location,
                          rateTo: double.parse(
                                  state.taskEntityServices?[index].payableTo ??
                                      "")
                              .toInt()
                              .toString(),
                          rateFrom: double.parse(state
                                      .taskEntityServices?[index].payableFrom ??
                                  "")
                              .toInt()
                              .toString(),
                          isRange: state.taskEntityServices?[index].isRange,
                          isBookmarked:
                              state.taskEntityServices?[index].isBookmarked,
                          isOwner: state.taskEntityServices?[index].owner?.id ==
                              context
                                  .read<UserBloc>()
                                  .state
                                  .taskerProfile
                                  ?.user
                                  ?.id,
                          editCallback: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.75,
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                    left: 8,
                                    right: 8,
                                    top: 8),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      EditTaskEntityServiceForm(
                                        id: state.taskEntityServices?[index]
                                                .id ??
                                            "",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      itemCount: state.isLastPage
                          ? state.taskEntityServices?.length
                          : state.taskEntityServices!.length + 1,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ),
                  ),
                ],
              );
            default:
              return CardLoading(
                height: double.maxFinite,
              );
          }
        },
      ),
    );
  }

  SizedBox _buildFilters(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Icon(
                  Icons.filter_alt,
                  color: kColorGrey,
                ),
              ),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.35,
                  height: 52,
                  child: CustomTextFormField(
                    hintText: "Search",
                    controller: searchController,
                    inputAction: TextInputAction.done,
                    onFieldSubmitted: (p0) {
                      if (p0!.length >= 3) {
                        entityServiceBloc.add(
                          TaskEntityServiceInitiated(
                            query: p0,
                            newFetch: true,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              _buildServiceType(),
              _buildLocation(),
              _buildFromDate(context),
              _buildToDate(context),
              _buildPayableFrom(context),
              _buildPayableTo(context),
              _buildClearFilters(context),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.5,
        height: 48,
        child: Row(
          children: [
            Expanded(
              child: BlocBuilder<CityBloc, CityState>(
                builder: (context, state) {
                  if (state is CityLoadSuccess)
                    return CustomDropdownSearch(
                      key: _locationKey,
                      hintText: location ?? "Location",
                      list: List.generate(
                        state.list.length,
                        (index) => state.list[index].name,
                      ),
                      onChanged: (value) {
                        setState(() {
                          location = value as String;
                        });
                        entityServiceBloc.add(TaskEntityServiceInitiated(
                          newFetch: true,
                          payableFrom: payableFrom.text,
                          payableTo:
                              payableTo.length == 0 ? null : payableTo.text,
                          dateFrom: dateFrom == null
                              ? null
                              : DateFormat("yyyy-MM-dd").format(dateFrom!),
                          dateTo: dateTo == null
                              ? null
                              : DateFormat("yyyy-MM-dd").format(dateTo!),
                          city: location,
                          serviceId: serviceId,
                        ));
                      },
                    );
                  return SizedBox.shrink();
                },
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  location = null;
                  entityServiceBloc.add(
                    TaskEntityServiceInitiated(
                      newFetch: true,
                      serviceId: serviceId,
                      city: location,
                      dateFrom: dateFrom == null
                          ? null
                          : DateFormat("yyyy-MM-dd").format(dateFrom!),
                      dateTo: dateTo == null
                          ? null
                          : DateFormat("yyyy-MM-dd").format(dateTo!),
                    ),
                  );
                });
              },
              child: Icon(
                Icons.clear,
                color: kColorGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceType() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.5,
        height: 48,
        child: BlocBuilder<ServicesBloc, ServicesState>(
          builder: (context, state) {
            if (state.theStates == TheStates.success)
              return Row(
                children: [
                  Expanded(
                    child: CustomDropdownSearch(
                      key: _serviceTypeKey,
                      hintText: serviceType ?? "Service Type",
                      list: List.generate(
                        state.serviceList!.length,
                        (index) => state.serviceList?[index].title ?? "",
                      ),
                      onChanged: (value) {
                        for (var element in state.serviceList!) {
                          if (element.title == value)
                            setState(() {
                              serviceType = value as String;
                              serviceId = element.id.toString();
                            });
                        }
                        print(serviceType);
                        entityServiceBloc.add(
                          TaskEntityServiceInitiated(
                            newFetch: true,
                            payableFrom: payableFrom.text,
                            payableTo:
                                payableTo.length == 0 ? null : payableTo.text,
                            dateFrom: dateFrom == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            dateTo: dateTo == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateTo!),
                            serviceId: serviceId,
                            city: location,
                          ),
                        );
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        serviceType = null;
                        serviceId = null;
                        entityServiceBloc.add(
                          TaskEntityServiceInitiated(
                            newFetch: true,
                            city: location,
                            dateFrom: dateFrom == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            dateTo: dateTo == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateTo!),
                            serviceId: serviceId,
                          ),
                        );
                      });
                    },
                    child: Icon(
                      Icons.clear,
                      color: kColorGrey,
                    ),
                  ),
                ],
              );
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildPayableFrom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: CustomFilterChip(
        iconData: Icons.attach_money_sharp,
        label: payableFrom.text.length == 0 ? "From" : payableFrom.text,
        callback: (value) {
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(content: Text("Enter Amount:"), actions: [
              CustomTextFormField(
                autofocus: true,
                controller: payableFrom,
                hintText: "2000",
                textInputType: TextInputType.number,
                inputAction: TextInputAction.done,
                onFieldSubmitted: (p0) {
                  setState(() {
                    payableFrom.text = p0!;
                  });
                  entityServiceBloc.add(
                    TaskEntityServiceInitiated(
                      newFetch: true,
                      payableFrom: payableFrom.text,
                      payableTo: payableTo.length == 0 ? null : payableTo.text,
                      dateFrom: dateFrom == null
                          ? null
                          : DateFormat("yyyy-MM-dd").format(dateFrom!),
                      dateTo: dateTo == null
                          ? null
                          : DateFormat("yyyy-MM-dd").format(dateTo!),
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ]),
          );
        },
      ),
    );
  }

  Widget _buildPayableTo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: CustomFilterChip(
        iconData: Icons.attach_money_sharp,
        label: payableTo.text.length == 0 ? "To" : payableTo.text,
        callback: (value) {
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(content: Text("Enter Amount:"), actions: [
              CustomTextFormField(
                autofocus: true,
                controller: payableTo,
                hintText: "2000",
                textInputType: TextInputType.number,
                inputAction: TextInputAction.done,
                onFieldSubmitted: (p0) {
                  setState(() {
                    payableTo.text = p0!;
                  });
                  entityServiceBloc.add(
                    TaskEntityServiceInitiated(
                      newFetch: true,
                      payableTo: payableTo.text,
                      payableFrom:
                          payableFrom.length == 0 ? null : payableFrom.text,
                      dateFrom: dateFrom == null
                          ? null
                          : DateFormat("yyyy-MM-dd").format(dateFrom!),
                      dateTo: dateTo == null
                          ? null
                          : DateFormat("yyyy-MM-dd").format(dateTo!),
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ]),
          );
        },
      ),
    );
  }

  Widget _buildFromDate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: CustomFilterChip(
        label: dateFrom != null ? DateFormat.MMMd().format(dateFrom!) : "From",
        iconData: Icons.calendar_today_outlined,
        callback: (value) {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
              2000,
            ),
            lastDate: DateTime(
              2050,
            ),
          ).then(
            (value) {
              setState(() {
                dateFrom = value;
              });
              entityServiceBloc.add(
                TaskEntityServiceInitiated(
                    newFetch: true,
                    isTask: false,
                    dateFrom: DateFormat("yyyy-MM-dd").format(
                      dateFrom!,
                    ),
                    dateTo: dateTo == null
                        ? null
                        : DateFormat("yyyy-MM-dd").format(
                            dateTo!,
                          )),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildToDate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomFilterChip(
        label: dateTo != null ? DateFormat.MMMd().format(dateTo!) : "To",
        iconData: Icons.calendar_today_outlined,
        callback: (value) {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
              2000,
            ),
            lastDate: DateTime(
              2050,
            ),
          ).then(
            (value) {
              setState(() {
                dateTo = value;
              });

              entityServiceBloc.add(
                TaskEntityServiceInitiated(
                    newFetch: true,
                    isTask: false,
                    dateTo: DateFormat("yyyy-MM-dd").format(
                      dateTo!,
                    ),
                    dateFrom: dateFrom == null
                        ? null
                        : DateFormat("yyyy-MM-dd").format(
                            dateFrom!,
                          )),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildClearFilters(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: () {
          setState(() {
            dateFrom = null;
            dateTo = null;
            payableFrom.clear();
            payableTo.clear();
            serviceType = null;
            location = null;
            serviceId = null;
          });
          entityServiceBloc.add(
            TaskEntityServiceInitiated(
              newFetch: true,
            ),
          );
        },
        child: Icon(
          Icons.clear,
          color: kColorSilver,
        ),
      ),
    );
  }
}
