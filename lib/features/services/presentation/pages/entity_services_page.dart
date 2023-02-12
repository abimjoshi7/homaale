import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/presentation/manager/entity_service_bloc.dart';
import 'package:cipher/features/services/presentation/manager/single_entity_service_cubit.dart';
import 'package:cipher/features/services/presentation/pages/service_provider_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntityServicesPage extends StatelessWidget {
  static const routeName = '/entity-services-page';

  const EntityServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EntityServiceBloc, EntityServiceState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is EntityServiceInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is EntityServiceLoadSuccess) {
            if (state.service.result == null || state.service.result!.isEmpty) {
              return const Center(
                child: Text('No Services to load'),
              );
            }
            return Column(
              children: [
                kHeight50,
                CustomHeader(
                  leadingWidget: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  trailingWidget: IconButton(
                    onPressed: () async {},
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  child: Text(
                    state.service.result?.first.service?.title ?? '',
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: kPadding20,
                          child: CustomFormText(
                            name: 'Professional Services',
                            child: SizedBox(
                              height: 250,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () async {
                                    await context
                                        .read<SingleEntityServiceCubit>()
                                        .getSingleEntity(
                                          state.service.result?[index].id ?? '',
                                        )
                                        .then(
                                          (value) => Navigator.pushNamed(
                                            context,
                                            ServiceProviderPage.routeName,
                                          ),
                                        );
                                  },
                                  child: ServiceCard(
                                    imagePath: state.service.result![index]
                                            .images!.isEmpty
                                        ? kServiceImage
                                        : state.service.result?[index].images!
                                                .first.media ??
                                            kServiceImage,
                                    title: state.service.result?[index].title ??
                                        '',
                                    description:
                                        '${state.service.result?[index].createdBy?.firstName ?? ''} ${state.service.result?[index].createdBy?.lastName ?? ''}',
                                    location:
                                        '${state.service.result?[index].city?.name ?? ''}, ${state.service.result?[index].city?.country?.name ?? ''}',
                                    rating: state.service.result?[index].rating
                                            ?.first.rating
                                            .toString() ??
                                        '5',
                                  ),
                                ),
                                itemCount: state.service.result?.length ?? 0,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: kPadding20,
                          child: CustomFormText(
                            name: 'Popular Services',
                            child: SizedBox(
                              height: 150,
                              width: double.infinity,
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    CustomImageTextBox(
                                  image: Image.asset('assets/services/111.png'),
                                  text: 'Machine Repair',
                                ),
                                itemCount: 5,
                                separatorBuilder: (context, index) => kWidth10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Placeholder(
                            fallbackHeight: 200,
                            child: Image.asset(
                              'assets/banners/banner.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: kPadding20,
                          child: CustomFormText(
                            name: 'Verified Services',
                            child: SizedBox(
                              height: 250,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) => ServiceCard(
                                  title:
                                      state.service.result?[index].title ?? '',
                                  description: state.service.result?[index]
                                          .service?.title ??
                                      '',
                                  location:
                                      state.service.result?[index].location ??
                                          '',
                                  rating: state.service.result?[index].rating
                                          ?.first.rating
                                          .toString() ??
                                      '5',
                                ),
                                itemCount: state.service.result?.length ?? 0,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/banners/Sliding Banner.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: kPadding20,
                          child: CustomFormText(
                            name: 'Tasks you may like',
                            child: SizedBox(
                              height: 400,
                              child: ListView.separated(
                                itemBuilder: (context, index) => TaskCard(
                                  child: Image.asset(
                                    'assets/services/Rectangle 3541.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                separatorBuilder: (context, index) => kHeight10,
                                itemCount: 5,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
                child: Text(
                    'Services cannot be loaded at the moment. Please try again later.'));
          }
        },
      ),
    );
  }
}
