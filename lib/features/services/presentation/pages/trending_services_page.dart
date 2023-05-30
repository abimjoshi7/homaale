import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/scroll_helper.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';
import 'package:cipher/features/services/data/models/services_list.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/features/transaction/presentation/pages/views/views.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

enum SortType { budget, date }

class TrendingServicesPage extends StatefulWidget {
  static const routeName = '/trending-services-page';
  const TrendingServicesPage({super.key});

  @override
  State<TrendingServicesPage> createState() => _TrendingServicesPageState();
}

class _TrendingServicesPageState extends State<TrendingServicesPage> {
  late final TaskEntityServiceBloc entityServiceBloc;
  late final ScrollController _controller;

  List<TaskEntityService> serviceList = [];
  List<String>? items = [];

  bool dateSelected = true;
  bool budgetSelected = false;
  bool categorySelected = false;
  bool locationSelected = false;
  bool sortDateIsAscending = true;
  bool sortBudgetIsAscending = true;

  SortType sortType = SortType.date;
  List<String>? order = ['-created_at'];
  String? selectedCategoryId;
  String? selectedLocation;
  DateTime? dateFrom;
  DateTime? dateTo;
  // String? selectedLocation;

  @override
  void initState() {
    super.initState();
    entityServiceBloc = locator<TaskEntityServiceBloc>()
      ..add(
        TaskEntityServiceInitiated(
          isTask: false,
        ),
      );

    _controller = ScrollController()
      ..addListener(
        () {
          ScrollHelper.nextPageTrigger(
            _controller,
            entityServiceBloc.add(
              TaskEntityServiceInitiated(
                isTask: false,
                dateFrom: dateFrom == null
                    ? null
                    : DateFormat("yyyy-MM-dd").format(dateFrom!),
              ),
            ),
          );
        },
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onFilterCategory({String? category}) {
    if (category != null) {
      for (ServiceList element in entityServiceBloc.state.serviceList ?? []) {
        if (element.title == category) {
          setState(() {
            selectedCategoryId = element.id.toString();
          });
          break;
        }
      }
    } else {
      setState(() {
        selectedCategoryId = null;
      });
    }

    entityServiceBloc.add(
      TaskEntityServiceInitiated(
        isTask: false,
        page: 1,
        order: order,
        serviceId: selectedCategoryId,
        city: selectedLocation,
        isFilter: selectedCategoryId != null
            ? true
            : selectedLocation != null
                ? true
                : false,
        isDateSort: entityServiceBloc.state.isDateSort ?? false,
        isBudgetSort: entityServiceBloc.state.isBudgetSort ?? false,
      ),
    );
  }

  void onFilterLocation({String? location}) {
    if (location != null) {
      setState(() {
        selectedLocation = location;
      });
    } else {
      setState(() {
        selectedLocation = null;
      });
    }

    entityServiceBloc.add(TaskEntityServiceInitiated(
      isTask: false,
      page: 1,
      order: order,
      serviceId: selectedCategoryId,
      city: selectedLocation,
      isFilter: selectedCategoryId != null
          ? true
          : selectedLocation != null
              ? true
              : false,
      isDateSort: entityServiceBloc.state.isDateSort ?? false,
      isBudgetSort: entityServiceBloc.state.isBudgetSort ?? false,
    ));
  }

  void onBudgetDateClear({required SortType sortType}) {
    if (sortType == SortType.date) {
      if (order?.contains('-created_at') ?? false) {
        setState(() {
          order?.remove('-created_at');
        });
      }
      if (order?.contains('created_at') ?? false) {
        setState(() {
          order?.remove('created_at');
        });
      }
    }

    if (sortType == SortType.budget) {
      if (order?.contains('-budget_to') ?? false) {
        setState(() {
          order?.remove('-budget_to');
        });
      }
      if (order?.contains('budget_to') ?? false) {
        setState(() {
          order?.remove('budget_to');
        });
      }
    }

    entityServiceBloc.add(TaskEntityServiceInitiated(
        isTask: false,
        page: 1,
        order: order,
        city: selectedLocation,
        serviceId: selectedCategoryId,
        isFilter: selectedCategoryId != null
            ? true
            : selectedLocation != null
                ? true
                : false,
        isDateSort: sortType == SortType.date,
        isBudgetSort: sortType == SortType.budget));
  }

  void onBudgetDateSort(
      {required SortType sortType, required bool isAscending}) {
    if (sortType == SortType.date) {
      if (isAscending) {
        setState(() {
          order?.remove('created_at');
          order?.add('-created_at');
        });
      } else {
        setState(() {
          order?.remove('-created_at');
          order?.add('created_at');
        });
      }
    }

    if (sortType == SortType.budget) {
      if (isAscending) {
        setState(() {
          order?.remove('budget_to');
          order?.add('-budget_to');
        });
      } else {
        setState(() {
          order?.remove('-budget_to');
          order?.add('budget_to');
        });
      }
    }

    entityServiceBloc.add(TaskEntityServiceInitiated(
        isTask: false,
        page: 1,
        order: order,
        city: selectedLocation,
        serviceId: selectedCategoryId,
        isFilter: selectedCategoryId != null
            ? true
            : selectedLocation != null
                ? true
                : false,
        isDateSort: sortType == SortType.date,
        isBudgetSort: sortType == SortType.budget));
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
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      children: [
                        _buildFromDate(context),
                        // items?.isNotEmpty ?? false
                        //     ? Container(
                        //         width: 170,
                        //         padding: EdgeInsets.symmetric(horizontal: 8),
                        //         decoration: BoxDecoration(
                        //           color: categorySelected
                        //               ? kColorAmber
                        //               : Colors.white,
                        //           borderRadius: BorderRadius.circular(30.0),
                        //           border: Border.all(color: kColorGrey),
                        //         ),
                        //         child: Row(
                        //           children: [
                        //             Expanded(
                        //               child: DropdownSearch<String?>(
                        //                 items: items ?? [''],
                        //                 onChanged: (value) {
                        //                   setState(() {
                        //                     categorySelected =
                        //                         value != null ? true : false;
                        //                   });
                        //                   onFilterCategory(category: value);
                        //                 },
                        //                 clearButtonProps: ClearButtonProps(
                        //                   padding: EdgeInsets.zero,
                        //                   iconSize: 16,
                        //                   visualDensity: VisualDensity.compact,
                        //                   alignment: Alignment.centerRight,
                        //                   isVisible: categorySelected,
                        //                   color: categorySelected
                        //                       ? Colors.white
                        //                       : Colors.black,
                        //                 ),
                        //                 dropdownDecoratorProps:
                        //                     DropDownDecoratorProps(
                        //                   dropdownSearchDecoration:
                        //                       InputDecoration(
                        //                     hintText: 'Category',
                        //                     hintStyle:
                        //                         TextStyle(color: Colors.black),
                        //                     border: InputBorder.none,
                        //                     suffixIconColor: categorySelected
                        //                         ? Colors.white
                        //                         : Colors.black,
                        //                   ),
                        //                   baseStyle: TextStyle(
                        //                     color: categorySelected
                        //                         ? Colors.white
                        //                         : Colors.black,
                        //                   ),
                        //                 ),
                        //                 popupProps: PopupProps.modalBottomSheet(
                        //                   showSearchBox: true,
                        //                   modalBottomSheetProps:
                        //                       ModalBottomSheetProps(
                        //                     backgroundColor:
                        //                         Theme.of(context).cardColor,
                        //                     useSafeArea: false,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       )
                        //     : ChoiceChip(
                        //         label: Row(
                        //           children: const [
                        //             Text('Category'),
                        //             Icon(Icons.keyboard_arrow_down_outlined),
                        //           ],
                        //         ),
                        //         backgroundColor: Theme.of(context).cardColor,
                        //         side: const BorderSide(color: kColorGrey),
                        //         selected: false,
                        //         disabledColor: Colors.white,
                        //       ),
                        // addHorizontalSpace(5),
                        // BlocBuilder<CityBloc, CityState>(
                        //   builder: (context, state) {
                        //     if (state is CityLoadSuccess) {
                        //       return Container(
                        //         width: 170,
                        //         padding: EdgeInsets.symmetric(horizontal: 8),
                        //         decoration: BoxDecoration(
                        //           color: locationSelected
                        //               ? kColorAmber
                        //               : Colors.white,
                        //           borderRadius: BorderRadius.circular(30.0),
                        //           border: Border.all(color: kColorGrey),
                        //         ),
                        //         child: Row(
                        //           children: [
                        //             Expanded(
                        //               child: DropdownSearch<String?>(
                        //                 items: state.list
                        //                     .map((e) => e.name)
                        //                     .toList(),
                        //                 onChanged: (value) {
                        //                   setState(() {
                        //                     locationSelected =
                        //                         value != null ? true : false;
                        //                   });
                        //                   onFilterLocation(location: value);
                        //                 },
                        //                 clearButtonProps: ClearButtonProps(
                        //                   padding: EdgeInsets.zero,
                        //                   iconSize: 16,
                        //                   visualDensity: VisualDensity.compact,
                        //                   alignment: Alignment.centerRight,
                        //                   isVisible: locationSelected,
                        //                   color: locationSelected
                        //                       ? Colors.white
                        //                       : Colors.black,
                        //                 ),
                        //                 dropdownDecoratorProps:
                        //                     DropDownDecoratorProps(
                        //                   dropdownSearchDecoration:
                        //                       InputDecoration(
                        //                     hintText: 'Location',
                        //                     hintStyle:
                        //                         TextStyle(color: Colors.black),
                        //                     border: InputBorder.none,
                        //                     suffixIconColor: locationSelected
                        //                         ? Colors.white
                        //                         : Colors.black,
                        //                   ),
                        //                   baseStyle: TextStyle(
                        //                     color: locationSelected
                        //                         ? Colors.white
                        //                         : Colors.black,
                        //                   ),
                        //                 ),
                        //                 popupProps: PopupProps.modalBottomSheet(
                        //                   showSearchBox: true,
                        //                   modalBottomSheetProps:
                        //                       ModalBottomSheetProps(
                        //                     backgroundColor:
                        //                         Theme.of(context).cardColor,
                        //                     useSafeArea: false,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       );
                        //     } else {
                        //       return ChoiceChip(
                        //         label: Row(
                        //           children: [
                        //             Text(
                        //               'Location',
                        //               style:
                        //                   Theme.of(context).textTheme.bodySmall,
                        //             ),
                        //             Icon(Icons.keyboard_arrow_down_outlined),
                        //           ],
                        //         ),
                        //         backgroundColor: Colors.white,
                        //         side: const BorderSide(color: kColorGrey),
                        //         selected: false,
                        //         disabledColor: Colors.white,
                        //       );
                        //     }
                        //   },
                        // ),
                        // addHorizontalSpace(5),
                        // InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       budgetSelected = true;
                        //       sortBudgetIsAscending = !sortBudgetIsAscending;
                        //     });
                        //     onBudgetDateSort(
                        //         sortType: SortType.budget,
                        //         isAscending: sortBudgetIsAscending);
                        //   },
                        //   child: Container(
                        //     width: budgetSelected ? 110 : 95,
                        //     padding: EdgeInsets.symmetric(horizontal: 8),
                        //     decoration: BoxDecoration(
                        //         color:
                        //             budgetSelected ? kColorAmber : Colors.white,
                        //         borderRadius: BorderRadius.circular(30.0),
                        //         border: Border.all(color: kColorGrey)),
                        //     child: Row(
                        //       children: [
                        //         Text(
                        //           'Budget',
                        //           style: TextStyle(
                        //             color: budgetSelected
                        //                 ? Colors.white
                        //                 : Colors.black,
                        //           ),
                        //         ),
                        //         Icon(
                        //           sortBudgetIsAscending
                        //               ? Icons.keyboard_arrow_up_outlined
                        //               : Icons.keyboard_arrow_down_outlined,
                        //           color: budgetSelected
                        //               ? Colors.white
                        //               : Colors.black,
                        //         ),
                        //         if (budgetSelected) ...[
                        //           Spacer(),
                        //           GestureDetector(
                        //             onTap: () {
                        //               setState(() {
                        //                 budgetSelected = false;
                        //               });
                        //               onBudgetDateClear(
                        //                   sortType: SortType.budget);
                        //             },
                        //             child: Icon(
                        //               Icons.close,
                        //               size: 16,
                        //               color: budgetSelected
                        //                   ? Colors.white
                        //                   : Colors.black,
                        //             ),
                        //           )
                        //         ]
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // addHorizontalSpace(5),
                        // InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       dateSelected = true;
                        //       sortDateIsAscending = !sortDateIsAscending;
                        //     });
                        //     onBudgetDateSort(
                        //         sortType: SortType.date,
                        //         isAscending: sortDateIsAscending);
                        //   },
                        //   child: Container(
                        //     width: dateSelected ? 95 : 77,
                        //     padding: EdgeInsets.symmetric(horizontal: 8),
                        //     decoration: BoxDecoration(
                        //         color:
                        //             dateSelected ? kColorAmber : Colors.white,
                        //         borderRadius: BorderRadius.circular(30.0),
                        //         border: Border.all(color: kColorGrey)),
                        //     child: Row(
                        //       children: [
                        //         Text(
                        //           'Date',
                        //           style: TextStyle(
                        //             color: dateSelected
                        //                 ? Colors.white
                        //                 : Colors.black,
                        //           ),
                        //         ),
                        //         Icon(
                        //           sortDateIsAscending
                        //               ? Icons.keyboard_arrow_up_outlined
                        //               : Icons.keyboard_arrow_down_outlined,
                        //           color: dateSelected
                        //               ? Colors.white
                        //               : Colors.black,
                        //         ),
                        //         if (dateSelected) ...[
                        //           Spacer(),
                        //           GestureDetector(
                        //             onTap: () {
                        //               setState(() {
                        //                 dateSelected = false;
                        //               });
                        //               onBudgetDateClear(
                        //                   sortType: SortType.date);
                        //             },
                        //             child: Icon(
                        //               Icons.close,
                        //               size: 16,
                        //               color: dateSelected
                        //                   ? Colors.white
                        //                   : Colors.black,
                        //             ),
                        //           )
                        //         ]
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // addHorizontalSpace(5),
                      ],
                    ),
                  ),
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
                                    id: state.taskEntityServiceModel
                                            .result?[index].id ??
                                        "",
                                  ),
                                );

                            context.read<RatingReviewsBloc>().add(SetToInitial(
                                  id: state.taskEntityServiceModel
                                          .result?[index].id ??
                                      "",
                                ));

                            Navigator.pushNamed(
                              context,
                              TaskEntityServicePage.routeName,
                            );
                          },
                          title: state.taskEntityServices?[index].title,
                          imagePath:
                              state.taskEntityServices?[index].images?.length ==
                                      0
                                  ? kServiceImageNImg
                                  : state.taskEntityServices?[index].images
                                      ?.first.media,
                          rating: state
                              .taskEntityServices?[index].rating?.first.rating
                              .toString(),
                          description:
                              "${state.taskEntityServices?[index].createdBy?.firstName} ${state.taskEntityServices?[index].createdBy?.lastName}",
                          location:
                              state.taskEntityServices?[index].location == ''
                                  ? "Remote"
                                  : state.taskEntityServices?[index].location,
                        );
                      },
                      itemCount: state.isLastPage
                          ? state.taskEntityServices?.length
                          : state.taskEntityServices!.length + 1,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
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

  Widget _buildFromDate(BuildContext context) {
    return BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
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
                context.read<TaskEntityServiceBloc>().add(
                      TaskEntityServiceInitiated(
                        isTask: false,
                        dateFrom: DateFormat("yyyy-MM-dd").format(
                          dateFrom!,
                        ),
                        page: 0,
                      ),
                    );
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: kColorGrey,
              ),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            constraints: BoxConstraints.loose(
              Size(
                100,
                100,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: kColorSilver,
                  ),
                  dateFrom == null
                      ? Text("From")
                      : Text(
                          DateFormat.MMMd().format(
                            dateFrom!,
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
