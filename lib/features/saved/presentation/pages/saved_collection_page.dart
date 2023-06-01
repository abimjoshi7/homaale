import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/saved/data/models/res/saved_model_res.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/tasker/presentation/view/tasker.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SavedCollectionPage extends StatefulWidget {
  static const routeName = '/saved-collection-page';
  const SavedCollectionPage({super.key});

  @override
  State<SavedCollectionPage> createState() => SavedCollectionPageState();
}

class SavedCollectionPageState extends State<SavedCollectionPage> {
  @override
  Widget build(BuildContext context) {
    final routeData = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final heading = routeData?['heading'] as String?;
    final data = routeData?['data'] as List<Result>?;

    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: heading ?? '',
      ),
      body: GridView.count(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16),
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        childAspectRatio: 0.9,
        children: data?.map((e) {
              if (e.type == 'user') {
                return InkWell(
                  onTap: () {
                    context.read<TaskerCubit>().loadSingleTasker(
                          e.data?.user?.id ?? '',
                        );
                    context.read<TaskerCubit>().loadSingleTaskerServices(
                          e.data?.user?.id ?? '',
                        );
                    context.read<TaskerCubit>().loadSingleTaskerTask(
                          e.data?.user?.id ?? '',
                        );
                    context.read<TaskerCubit>().loadSingleTaskerReviews(
                          e.data?.user?.id ?? '',
                        );
                    Navigator.pushNamed(
                      context,
                      TaskerProfileView.routeName,
                    );
                  },
                  child: TaskerCard(
                    id: e.data?.user?.id,
                    networkImageUrl: e.data?.profileImage ?? kServiceImageNImg,
                    label: "${e.data?.user?.fullName}",
                    ratings:
                        "${e.data?.rating != null ? double.tryParse(e.data!.rating['avg_rating'].toString())?.toStringAsFixed(2) : '0'} (${e.data?.rating != null ? e.data!.rating['user_rating_count'] : '0'})",
                    callback: () {},
                    onFavouriteTapped: () {},
                  ),
                );
              } else {
                return InkWell(
                  onTap: () {
                    context.read<TaskEntityServiceBloc>().add(
                          TaskEntityServiceSingleLoaded(
                            id: e.data?.id.toString() ?? '',
                          ),
                        );
                    Navigator.pushNamed(
                      context,
                      TaskEntityServicePage.routeName,
                    );
                  },
                  child: ServiceCard(
                    location: '${e.data?.location == '' ? 'Remote' : e.data?.location ?? 'Remote'}',
                    description: "${e.data?.createdBy?.fullName}",
                    title: '${e.data?.title}',
                    imagePath: kServiceImageNImg,
                    rating:
                        '${e.data?.rating != null ? double.tryParse(e.data!.rating[0]['rating'].toString())?.toStringAsFixed(2) : '0.0'}${e.data?.rating != null ? ' (${e.data!.rating[0]['rating_count'].toString()})' : ' (0)'}',
                  ),
                );
              }
            }).toList() ??
            [],
      ),
    );
  }
}
