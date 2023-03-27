// ignore_for_file: prefer_is_empty

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/data/models/entity_service_model.dart';
import 'package:cipher/features/services/presentation/manager/entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class PopularServicesPage extends StatefulWidget {
  static const routeName = '/popular-services-page';
  const PopularServicesPage({super.key});

  @override
  State<PopularServicesPage> createState() => _PopularServicesPageState();
}

class _PopularServicesPageState extends State<PopularServicesPage> {
  late final entityServiceBloc = locator<EntityServiceBloc>();
  List<EntityService> serviceList = [];

  //initialize page controller
  final PagingController<int, EntityService> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    //so at event add list of records
    _pagingController.addPageRequestListener(
      (pageKey) => entityServiceBloc.add(EntityServiceInitiated(page: pageKey)),
    );
  }

  @override
  void dispose() {
    super.dispose();
    entityServiceBloc.close();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => entityServiceBloc,
        child: BlocListener<EntityServiceBloc, EntityServiceState>(
          listener: (context, state) {
            if (state is EntityServiceLoadSuccess) {
              serviceList = state.service.result!;

              final lastPage = state.service.totalPages!;
              final next = 1 + state.service.current!;

              if (next > lastPage) {
                _pagingController.appendLastPage(serviceList);
              } else {
                _pagingController.appendPage(serviceList, next);
              }
            }
            if (state is EntityServiceLoadFailure) {
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
                  SizedBox(
                    height: 35,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      children: [
                        const Icon(
                          Icons.filter_alt_outlined,
                          color: kColorSilver,
                        ),
                        addHorizontalSpace(5),
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
                                'Buddhanagar',
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
                        ChoiceChip(
                          label: Row(
                            children: const [
                              Text(
                                'Any Price',
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
      ),
    );
  }
}
