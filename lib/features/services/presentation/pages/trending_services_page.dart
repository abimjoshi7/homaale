import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/search/presentation/pages/search_page.dart';
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

class _TrendingServicesPageState extends State<TrendingServicesPage> with TheModalBottomSheet {
  late final TaskEntityServiceBloc entityServiceBloc;
  late final ScrollController _controller;
  final payableFrom = TextEditingController();
  final payableTo = TextEditingController();
  final _categoryKey = GlobalKey<FormFieldState>();
  final _locationKey = GlobalKey<FormFieldState>();

  String? sortBudget;
  String? sortDate;
  String? selectedCategoryId;
  String? selectedLocation;
  DateTime? dateFrom;
  DateTime? dateTo;
  String? category;
  String? serviceId;
  String? location;

  @override
  void initState() {
    super.initState();
    entityServiceBloc = locator<TaskEntityServiceBloc>()..add(TaskEntityServiceInitiated(isTask: false));

    _controller = ScrollController()
      ..addListener(
        () {
          ScrollHelper.nextPageTrigger(
            _controller,
            entityServiceBloc.add(
              TaskEntityServiceInitiated(
                newFetch: false,
                isTask: false,
                dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                payableFrom: payableFrom.text.length == 0 ? null : payableFrom.text,
                payableTo: payableTo.text.length == 0 ? null : payableTo.text,
                serviceId: category,
                city: location,
                category: category,
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "Trending Services",
        trailingWidget: IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              SearchPage.routeName,
            );
          },
          icon: Icon(Icons.search),
        ),
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
                  Expanded(
                    child: GridView.builder(
                      controller: _controller,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        if (index >= state.taskEntityServices!.length) {
                          return Center(child: const BottomLoader());
                        }
                        return ServiceCard(
                          callback: () {
                            context.read<TaskEntityServiceBloc>().add(
                                  TaskEntityServiceSingleLoaded(
                                    id: state.taskEntityServices?[index].id ?? "",
                                  ),
                                );

                            context.read<TaskEntityServiceBloc>().add(
                                  FetchRecommendedSimilar(
                                    id: state.taskEntityServices?[index].id ?? "",
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
                          imagePath: state.taskEntityServices?[index].images?.length == 0
                              ? kHomaaleImg
                              : state.taskEntityServices?[index].images?.first.media,
                          rating: state.taskEntityServiceModel.result?[index].rating?.toString() ?? '0.0',
                          createdBy:
                              "${state.taskEntityServices?[index].createdBy?.firstName} ${state.taskEntityServices?[index].createdBy?.lastName}",
                          description: state.taskEntityServices?[index].description,
                          location: state.taskEntityServices?[index].location == ''
                              ? "Remote"
                              : state.taskEntityServices?[index].location,
                          rateTo: double.parse(state.taskEntityServices?[index].payableTo ?? "").toInt().toString(),
                          rateFrom: double.parse(state.taskEntityServices?[index].payableFrom ?? "").toInt().toString(),
                          isRange: state.taskEntityServices?[index].isRange,
                          isBookmarked: state.taskEntityServices?[index].isBookmarked,
                          isOwner: state.taskEntityServices?[index].owner?.id ==
                              context.read<UserBloc>().state.taskerProfile?.user?.id,
                          editCallback: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => Container(
                                height: MediaQuery.of(context).size.height * 0.75,
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).viewInsets.bottom, left: 8, right: 8, top: 8),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      EditTaskEntityServiceForm(
                                        id: state.taskEntityServices?[index].id ?? "",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      itemCount:
                          state.isLastPage ? state.taskEntityServices?.length : state.taskEntityServices!.length + 1,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.86,
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          Row(
            children: [
              Icon(
                Icons.filter_alt,
                color: kColorGrey,
              ),
              addHorizontalSpace(5),
              _buildCategory(),
              addHorizontalSpace(8),
              _buildLocation(),
              addHorizontalSpace(8),
              _buildFromDate(context),
              addHorizontalSpace(8),
              _buildToDate(context),
              addHorizontalSpace(8),
              _buildPayableFrom(context),
              addHorizontalSpace(8),
              _buildPayableTo(context),
              addHorizontalSpace(8),
              _buildBudgetSort(),
              addHorizontalSpace(8),
              _buildDateSort(),
              addHorizontalSpace(8),
              dateFrom != null ||
                      dateTo != null ||
                      payableFrom.text.length != 0 ||
                      payableTo.text.length != 0 ||
                      category != null ||
                      location != null ||
                      sortBudget != null ||
                      sortDate != null
                  ? _buildClearFilters(context)
                  : SizedBox.shrink(),
            ],
          )
        ],
      ),
    );
  }

  SizedBox _buildLocation() {
    return SizedBox(
      width: 170,
      height: 48,
      child: BlocBuilder<CityBloc, CityState>(
        builder: (context, state) {
          if (state is CityLoadSuccess)
            return CustomDropdownSearch(
              key: _locationKey,
              selectedItem: location,
              serviceId: location,
              hintText: "Location",
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
                  payableFrom: payableFrom.text.isEmpty ? null : payableFrom.text,
                  payableTo: payableTo.length == 0 ? null : payableTo.text,
                  dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                  dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                  serviceId: serviceId,
                  city: location,
                  dateSort: sortDate,
                  budgetSort: sortBudget,
                ));
              },
              onRemovePressed: () {
                setState(() {
                  location = null;
                });
                entityServiceBloc.add(TaskEntityServiceInitiated(
                  newFetch: true,
                  payableFrom: payableFrom.text.isEmpty ? null : payableFrom.text,
                  payableTo: payableTo.text.isEmpty ? null : payableTo.text,
                  dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                  dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                  city: location,
                  serviceId: serviceId,
                  dateSort: sortDate,
                  budgetSort: sortBudget,
                ));
              },
            );
          return SizedBox.shrink();
        },
      ),
    );
  }

  SizedBox _buildCategory() {
    return SizedBox(
      width: 170,
      height: 48,
      child: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          if (state.theStates == TheStates.success)
            return CustomDropdownSearch(
              key: _categoryKey,
              selectedItem: category,
              hintText: "Category",
              serviceId: '',
              list: List.generate(
                state.serviceList!.length,
                (index) => state.serviceList?[index].title ?? "",
              ),
              onChanged: (value) {
                for (var element in state.serviceList!) {
                  if (element.title == value)
                    setState(() {
                      category = value as String;
                      serviceId = element.id.toString();
                    });
                }
                entityServiceBloc.add(
                  TaskEntityServiceInitiated(
                    newFetch: true,
                    payableFrom: payableFrom.text,
                    payableTo: payableTo.length == 0 ? null : payableTo.text,
                    dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                    dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                    serviceId: serviceId,
                    city: location,
                    dateSort: sortDate,
                    budgetSort: sortBudget,
                  ),
                );
              },
              onRemovePressed: () {
                setState(() {
                  category = null;
                  serviceId = null;
                });
                entityServiceBloc.add(TaskEntityServiceInitiated(
                  newFetch: true,
                  payableFrom: payableFrom.text.isEmpty ? null : payableFrom.text,
                  payableTo: payableTo.text.isEmpty ? null : payableTo.text,
                  dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                  dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                  city: location,
                  serviceId: serviceId,
                  dateSort: sortDate,
                  budgetSort: sortBudget,
                ));
              },
            );
          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildPayableFrom(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(content: Text("Enter Amount:"), actions: [
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
                    dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                    dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                    serviceId: serviceId,
                    city: location,
                    dateSort: sortDate,
                    budgetSort: sortBudget,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ]),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(
                Icons.attach_money_sharp,
              ),
              addHorizontalSpace(4.0),
              Text("${payableFrom.text.length == 0 ? "From" : payableFrom.text}"),
              addHorizontalSpace(8.0),
              payableFrom.length != 0
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          payableFrom.clear();
                        });

                        entityServiceBloc.add(
                          TaskEntityServiceInitiated(
                            newFetch: true,
                            isTask: false,
                            dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                            dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            payableTo: payableTo.length == 0 ? null : payableTo.text,
                            payableFrom: payableFrom.length == 0 ? null : payableFrom.text,
                            serviceId: serviceId,
                            city: location,
                            dateSort: sortDate,
                            budgetSort: sortBudget,
                          ),
                        );
                      },
                      child: Icon(Icons.clear))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPayableTo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(content: Text("Enter Amount:"), actions: [
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
                    payableFrom: payableFrom.length == 0 ? null : payableFrom.text,
                    dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                    dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                    serviceId: serviceId,
                    city: location,
                    dateSort: sortDate,
                    budgetSort: sortBudget,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ]),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(
                Icons.attach_money_sharp,
              ),
              addHorizontalSpace(4.0),
              Text("${payableTo.text.length == 0 ? "To" : payableTo.text}"),
              addHorizontalSpace(8.0),
              payableTo.length != 0
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          payableTo.clear();
                        });

                        entityServiceBloc.add(
                          TaskEntityServiceInitiated(
                            newFetch: true,
                            isTask: false,
                            dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                            dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            payableTo: payableTo.length == 0 ? null : payableTo.text,
                            payableFrom: payableFrom.length == 0 ? null : payableFrom.text,
                            serviceId: serviceId,
                            city: location,
                            dateSort: sortDate,
                            budgetSort: sortBudget,
                          ),
                        );
                      },
                      child: Icon(Icons.clear))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFromDate(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: dateFrom ?? DateTime(2000),
          lastDate: DateTime(2050),
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
                      ),
                payableTo: payableTo.length == 0 ? null : payableTo.text,
                payableFrom: payableFrom.length == 0 ? null : payableFrom.text,
                serviceId: serviceId,
                city: location,
                dateSort: sortDate,
                budgetSort: sortBudget,
              ),
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
              ),
              addHorizontalSpace(4.0),
              Text("${dateFrom != null ? DateFormat.MMMd().format(dateFrom!) : "From"}"),
              addHorizontalSpace(8.0),
              dateFrom != null
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          dateFrom = null;
                        });

                        entityServiceBloc.add(
                          TaskEntityServiceInitiated(
                            newFetch: true,
                            isTask: false,
                            dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                            dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            payableTo: payableTo.length == 0 ? null : payableTo.text,
                            payableFrom: payableFrom.length == 0 ? null : payableFrom.text,
                            serviceId: serviceId,
                            city: location,
                            dateSort: sortDate,
                            budgetSort: sortBudget,
                          ),
                        );
                      },
                      child: Icon(Icons.clear))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToDate(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: dateFrom ?? DateTime(2000),
          lastDate: DateTime(2050),
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
                      ),
                payableTo: payableTo.length == 0 ? null : payableTo.text,
                payableFrom: payableFrom.length == 0 ? null : payableFrom.text,
                serviceId: serviceId,
                city: location,
                dateSort: sortDate,
                budgetSort: sortBudget,
              ),
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
              ),
              addHorizontalSpace(4.0),
              Text("${dateTo != null ? DateFormat.MMMd().format(dateTo!) : "To"}"),
              addHorizontalSpace(8.0),
              dateTo != null
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          dateTo = null;
                        });

                        entityServiceBloc.add(
                          TaskEntityServiceInitiated(
                            newFetch: true,
                            isTask: false,
                            dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                            dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            payableTo: payableTo.length == 0 ? null : payableTo.text,
                            payableFrom: payableFrom.length == 0 ? null : payableFrom.text,
                            serviceId: serviceId,
                            city: location,
                            dateSort: sortDate,
                            budgetSort: sortBudget,
                          ),
                        );
                      },
                      child: Icon(Icons.clear))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBudgetSort() {
    return GestureDetector(
      onTap: () {
        setState(() {
          sortBudget = sortBudget == null
              ? '-budget_to'
              : sortBudget == '-budget_to'
                  ? 'budget_to'
                  : '-budget_to';
        });

        entityServiceBloc.add(
          TaskEntityServiceInitiated(
            newFetch: true,
            isTask: false,
            payableTo: payableTo.length == 0 ? null : payableTo.text,
            payableFrom: payableFrom.length == 0 ? null : payableFrom.text,
            dateTo: dateTo == null
                ? null
                : DateFormat("yyyy-MM-dd").format(
                    dateTo!,
                  ),
            dateFrom: dateFrom == null
                ? null
                : DateFormat("yyyy-MM-dd").format(
                    dateFrom!,
                  ),
            serviceId: serviceId,
            city: location,
            dateSort: sortDate,
            budgetSort: sortBudget,
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(Icons.attach_money),
              addHorizontalSpace(4.0),
              Text(
                  "${sortBudget != null ? sortBudget == '-budget_to' ? 'Budget Desc' : 'Budget Asec' : 'Sort Budget'}"),
              addHorizontalSpace(8.0),
              sortBudget != null
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          sortBudget = null;
                        });

                        entityServiceBloc.add(
                          TaskEntityServiceInitiated(
                            newFetch: true,
                            isTask: false,
                            dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                            dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            payableTo: payableTo.length == 0 ? null : payableTo.text,
                            payableFrom: payableFrom.length == 0 ? null : payableFrom.text,
                            serviceId: serviceId,
                            city: location,
                            dateSort: sortDate,
                            budgetSort: sortBudget,
                          ),
                        );
                      },
                      child: Icon(Icons.clear))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSort() {
    return GestureDetector(
      onTap: () {
        setState(() {
          sortDate = sortDate == null
              ? '-created_at'
              : sortDate == '-created_at'
                  ? 'created_at'
                  : '-created_at';
        });
        entityServiceBloc.add(
          TaskEntityServiceInitiated(
            newFetch: true,
            isTask: false,
            payableTo: payableTo.length == 0 ? null : payableTo.text,
            payableFrom: payableFrom.length == 0 ? null : payableFrom.text,
            dateTo: dateTo == null
                ? null
                : DateFormat("yyyy-MM-dd").format(
                    dateTo!,
                  ),
            dateFrom: dateFrom == null
                ? null
                : DateFormat("yyyy-MM-dd").format(
                    dateFrom!,
                  ),
            serviceId: serviceId,
            city: location,
            dateSort: sortDate,
            budgetSort: sortBudget,
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(Icons.date_range),
              addHorizontalSpace(4.0),
              Text("${sortDate != null ? sortDate == '-created_at' ? 'Date Desc' : 'Date Asec' : 'Sort Date'}"),
              addHorizontalSpace(8.0),
              sortDate != null
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          sortDate = null;
                        });

                        entityServiceBloc.add(
                          TaskEntityServiceInitiated(
                            newFetch: true,
                            isTask: false,
                            dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                            dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            payableTo: payableTo.length == 0 ? null : payableTo.text,
                            payableFrom: payableFrom.length == 0 ? null : payableFrom.text,
                            serviceId: serviceId,
                            city: location,
                            dateSort: sortDate,
                            budgetSort: sortBudget,
                          ),
                        );
                      },
                      child: Icon(Icons.clear))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClearFilters(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          dateFrom = null;
          dateTo = null;
          payableFrom.clear();
          payableTo.clear();
          category = null;
          location = null;
          sortBudget = null;
          sortDate = null;
        });
        entityServiceBloc.add(
          TaskEntityServiceInitiated(newFetch: true),
        );
      },
      icon: Icon(
        Icons.clear,
        color: kColorSilver,
      ),
    );
  }
}
