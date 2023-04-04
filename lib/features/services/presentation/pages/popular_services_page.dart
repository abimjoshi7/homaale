import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/data/models/entity_service_model.dart';
import 'package:cipher/features/services/presentation/manager/entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
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
  late final entityServiceBloc = locator<EntityServiceBloc>();
  final PagingController<int, EntityService> _pagingController = PagingController(firstPageKey: 1);

  List<EntityService> serviceList = [];

  bool sortDateIsAscending = true;
  bool sortBudgetIsAscending = true;
  SortType sortType = SortType.date;
  String? order = '-created_at';

  @override
  void initState() {
    //so at event add list of records
    _pagingController.addPageRequestListener(
      (pageKey) => entityServiceBloc.add(
        EntityServiceInitiated(
          page: pageKey,
          order: order,
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

  void onBudgetDateSort({required SortType sortType, required bool isAscending}) {
    setState(() {
      order = sortType == SortType.date
          ? isAscending
              ? '-created_at'
              : 'created_at'
          : isAscending
              ? '-budget_to'
              : 'budget_to';
    });

    entityServiceBloc.add(EntityServiceInitiated(
        page: 1, order: order, isDateSort: sortType == SortType.date, isBudgetSort: sortType == SortType.budget));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<EntityServiceBloc, EntityServiceState>(
        bloc: entityServiceBloc,
        listener: (context, state) {
          if ((state.isDateSort ?? false) || (state.isBudgetSort ?? false)) {
            _pagingController.refresh();
          }

          if (state.theStates == TheStates.success) {
            serviceList = state.service!.result!;
            final lastPage = state.service!.totalPages!;
            final next = 1 + state.service!.current!;

            if (next > lastPage) {
              _pagingController.appendLastPage(serviceList);
            } else {
              _pagingController.appendPage(serviceList, next);
            }
          }
          if (state.theStates == TheStates.failure) {
            _pagingController.error = 'Error';
          }
        },
        child: BlocBuilder<EntityServiceBloc, EntityServiceState>(
          builder: (context, state) {
            return Column(
              children: [
                addVerticalSpace(
                  50,
                ),
                const CustomHeader(
                  label: 'Popular Services',
                ),
                const Divider(),
                addVerticalSpace(8),
                SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    children: [
                      // const Icon(
                      //   Icons.filter_alt_outlined,
                      //   color: kColorSilver,
                      // ),
                      // addHorizontalSpace(5),
                      ChoiceChip(
                        label: Row(
                          children: const [
                            Text(
                              'Category',
                            ),
                            Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: kColorGrey),
                        selected: false,
                        disabledColor: Colors.white,
                      ),
                      addHorizontalSpace(5),
                      ChoiceChip(
                        label: Row(
                          children: const [
                            Text(
                              'Location',
                            ),
                            Icon(Icons.keyboard_arrow_down_outlined),
                          ],
                        ),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: kColorGrey),
                        selected: false,
                        disabledColor: Colors.white,
                      ),
                      addHorizontalSpace(5),
                      InkWell(
                        onTap: () {
                          setState(() {
                            sortBudgetIsAscending = !sortBudgetIsAscending;
                          });
                          onBudgetDateSort(sortType: SortType.budget, isAscending: sortBudgetIsAscending);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(color: kColorGrey)),
                          child: Row(
                            children: [
                              Text('Budget'),
                              Icon(sortBudgetIsAscending
                                  ? Icons.keyboard_arrow_up_outlined
                                  : Icons.keyboard_arrow_down_outlined)
                            ],
                          ),
                        ),
                      ),
                      addHorizontalSpace(5),
                      InkWell(
                        onTap: () {
                          setState(() {
                            sortDateIsAscending = !sortDateIsAscending;
                          });
                          onBudgetDateSort(sortType: SortType.date, isAscending: sortDateIsAscending);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(color: kColorGrey)),
                          child: Row(
                            children: [
                              Text('Date'),
                              Icon(sortDateIsAscending
                                  ? Icons.keyboard_arrow_up_outlined
                                  : Icons.keyboard_arrow_down_outlined)
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
                      itemBuilder: (context, EntityService item, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            context.read<TaskEntityServiceBloc>().add(
                                  TaskEntityServiceSingleLoaded(
                                    id: item.id!,
                                  ),
                                );

                            Navigator.pushNamed(
                              context,
                              TaskEntityServicePage.routeName,
                            );
                          },
                          child: ServiceCard(
                            title: item.title,
                            imagePath: item.images?.length == 0 ? kServiceImageNImg : item.images?.first.media,
                            rating: item.rating?.first.rating.toString(),
                            description: "${item.createdBy?.firstName} ${item.createdBy?.lastName}",
                          ),
                        ),
                      ),
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
