import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';
import 'package:cipher/features/services/data/models/services_list.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

enum SortType { budget, date }

class PopularServicesPage extends StatefulWidget {
  static const routeName = '/popular-services-page';
  const PopularServicesPage({super.key});

  @override
  State<PopularServicesPage> createState() => _PopularServicesPageState();
}

class _PopularServicesPageState extends State<PopularServicesPage> {
  late final entityServiceBloc = locator<TaskEntityServiceBloc>();
  final PagingController<int, TaskEntityService> _pagingController =
      PagingController(firstPageKey: 1);

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

  @override
  void initState() {
    //so at event add list of records
    entityServiceBloc.add(FetchServicesList());

    _pagingController.addPageRequestListener(
      (pageKey) => entityServiceBloc.add(
        TaskEntityServiceInitiated(
          isTask: false,
          page: pageKey,
          order: order,
          city: selectedLocation,
          serviceId: selectedCategoryId,
          isBudgetSort: false,
          isDateSort: false,
        ),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    entityServiceBloc.close();
    _pagingController.dispose();
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
      body: BlocListener<TaskEntityServiceBloc, TaskEntityServiceState>(
        bloc: entityServiceBloc,
        listener: (context, state) {
          if ((state.isFilter ?? false) ||
              (state.isDateSort ?? false) ||
              (state.isBudgetSort ?? false)) {
            _pagingController.refresh();
            entityServiceBloc.add(ResetFilterSort());
          }

          if (state.serviceLoaded ?? false) {
            setState(() {
              items = [...?state.serviceList?.map((e) => e.title!).toList()];
            });
          }

          if (state.theStates == TheStates.failure) {
            _pagingController.error = 'Error';
          }

          if (state.theStates == TheStates.success) {
            serviceList = state.taskEntityServiceModel.result!;
            final lastPage = state.taskEntityServiceModel.totalPages!;
            final next = 1 + state.taskEntityServiceModel.current!;

            if (next > lastPage) {
              _pagingController.appendLastPage(serviceList);
            } else {
              _pagingController.appendPage(serviceList, next);
            }
          }
        },
        child: BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
          builder: (context, state) {
            return Column(
              children: [
                addVerticalSpace(50),
                const CustomHeader(
                  label: 'Popular Services',
                ),
                const Divider(),
                addVerticalSpace(8),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    children: [
                      items?.isNotEmpty ?? false
                          ? Container(
                              width: 170,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: categorySelected
                                    ? kColorAmber
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(color: kColorGrey),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DropdownSearch<String?>(
                                      items: items ?? [''],
                                      onChanged: (value) {
                                        setState(() {
                                          categorySelected =
                                              value != null ? true : false;
                                        });
                                        onFilterCategory(category: value);
                                      },
                                      clearButtonProps: ClearButtonProps(
                                        padding: EdgeInsets.zero,
                                        iconSize: 16,
                                        visualDensity: VisualDensity.compact,
                                        alignment: Alignment.centerRight,
                                        isVisible: categorySelected,
                                        color: categorySelected
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          hintText: 'Category',
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          border: InputBorder.none,
                                          suffixIconColor: categorySelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        baseStyle: TextStyle(
                                          color: categorySelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      popupProps: PopupProps.modalBottomSheet(
                                        showSearchBox: true,
                                        modalBottomSheetProps:
                                            ModalBottomSheetProps(
                                          backgroundColor:
                                              Theme.of(context).cardColor,
                                          useSafeArea: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ChoiceChip(
                              label: Row(
                                children: const [
                                  Text('Category'),
                                  Icon(Icons.keyboard_arrow_down_outlined),
                                ],
                              ),
                              backgroundColor: Theme.of(context).cardColor,
                              side: const BorderSide(color: kColorGrey),
                              selected: false,
                              disabledColor: Colors.white,
                            ),
                      addHorizontalSpace(5),
                      BlocBuilder<CityBloc, CityState>(
                        builder: (context, state) {
                          if (state is CityLoadSuccess) {
                            return Container(
                              width: 170,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: locationSelected
                                    ? kColorAmber
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(color: kColorGrey),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DropdownSearch<String?>(
                                      items: state.list
                                          .map((e) => e.name)
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          locationSelected =
                                              value != null ? true : false;
                                        });
                                        onFilterLocation(location: value);
                                      },
                                      clearButtonProps: ClearButtonProps(
                                        padding: EdgeInsets.zero,
                                        iconSize: 16,
                                        visualDensity: VisualDensity.compact,
                                        alignment: Alignment.centerRight,
                                        isVisible: locationSelected,
                                        color: locationSelected
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          hintText: 'Location',
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          border: InputBorder.none,
                                          suffixIconColor: locationSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        baseStyle: TextStyle(
                                          color: locationSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      popupProps: PopupProps.modalBottomSheet(
                                        showSearchBox: true,
                                        modalBottomSheetProps:
                                            ModalBottomSheetProps(
                                          backgroundColor:
                                              Theme.of(context).cardColor,
                                          useSafeArea: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return ChoiceChip(
                              label: Row(
                                children: [
                                  Text(
                                    'Location',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Icon(Icons.keyboard_arrow_down_outlined),
                                ],
                              ),
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: kColorGrey),
                              selected: false,
                              disabledColor: Colors.white,
                            );
                          }
                        },
                      ),
                      addHorizontalSpace(5),
                      InkWell(
                        onTap: () {
                          setState(() {
                            budgetSelected = true;
                            sortBudgetIsAscending = !sortBudgetIsAscending;
                          });
                          onBudgetDateSort(
                              sortType: SortType.budget,
                              isAscending: sortBudgetIsAscending);
                        },
                        child: Container(
                          width: budgetSelected ? 110 : 95,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color:
                                  budgetSelected ? kColorAmber : Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(color: kColorGrey)),
                          child: Row(
                            children: [
                              Text(
                                'Budget',
                                style: TextStyle(
                                  color: budgetSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Icon(
                                sortBudgetIsAscending
                                    ? Icons.keyboard_arrow_up_outlined
                                    : Icons.keyboard_arrow_down_outlined,
                                color: budgetSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              if (budgetSelected) ...[
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      budgetSelected = false;
                                    });
                                    onBudgetDateClear(
                                        sortType: SortType.budget);
                                  },
                                  child: Icon(
                                    Icons.close,
                                    size: 16,
                                    color: budgetSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                      addHorizontalSpace(5),
                      InkWell(
                        onTap: () {
                          setState(() {
                            dateSelected = true;
                            sortDateIsAscending = !sortDateIsAscending;
                          });
                          onBudgetDateSort(
                              sortType: SortType.date,
                              isAscending: sortDateIsAscending);
                        },
                        child: Container(
                          width: dateSelected ? 95 : 77,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: dateSelected ? kColorAmber : Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(color: kColorGrey)),
                          child: Row(
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(
                                  color: dateSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Icon(
                                sortDateIsAscending
                                    ? Icons.keyboard_arrow_up_outlined
                                    : Icons.keyboard_arrow_down_outlined,
                                color:
                                    dateSelected ? Colors.white : Colors.black,
                              ),
                              if (dateSelected) ...[
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      dateSelected = false;
                                    });
                                    onBudgetDateClear(sortType: SortType.date);
                                  },
                                  child: Icon(
                                    Icons.close,
                                    size: 16,
                                    color: dateSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                      addHorizontalSpace(5),
                    ],
                  ),
                ),
                Expanded(
                  child: PagedGridView(
                    pagingController: _pagingController,
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, TaskEntityService item, index) =>
                          Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            context.read<TaskEntityServiceBloc>().add(
                                  TaskEntityServiceSingleLoaded(id: item.id!),
                                );

                            context.read<RatingReviewsBloc>().add(SetToInitial(
                                  id: item.id!,
                                ));

                            Navigator.pushNamed(
                              context,
                              TaskEntityServicePage.routeName,
                            );
                          },
                          child: ServiceCard(
                            title: item.title,
                            imagePath: item.images?.length == 0
                                ? kServiceImageNImg
                                : item.images?.first.media,
                            rating: item.rating?.first.rating.toString(),
                            description:
                                "${item.createdBy?.firstName} ${item.createdBy?.lastName}",
                            location:
                                item.location == '' ? "Remote" : item.location,
                          ),
                        ),
                      ),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
