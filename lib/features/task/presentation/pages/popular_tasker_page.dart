import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/tasker/data/models/tasker_list_res.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/tasker/presentation/view/tasker.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class PopularTaskerPage extends StatefulWidget {
  static const routeName = '/popular-tasker-page';
  const PopularTaskerPage({super.key});

  @override
  State<PopularTaskerPage> createState() => _PopularTaskerPageState();
}

class _PopularTaskerPageState extends State<PopularTaskerPage> {
  late final taskerCubit = locator<TaskerCubit>();
  List<Tasker> taskerList = [];

  //initialize page controller
  final PagingController<int, Tasker> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    //so at event add list of records
    _pagingController.addPageRequestListener(
      (pageKey) => taskerCubit.loadTaskerList(
        page: pageKey,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    taskerCubit.close();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TaskerCubit, TaskerState>(
        bloc: taskerCubit,
        listener: (context, state) {
          if (state.states == TheStates.success) {
            taskerList = state.taskerListRes!.result!;

            final lastPage = state.taskerListRes!.totalPages!;
            final next = 1 + state.taskerListRes!.current!;

            if (next > lastPage) {
              _pagingController.appendLastPage(taskerList);
            } else {
              _pagingController.appendPage(taskerList, next);
            }
          }
          if (state.states == TheStates.failure) {
            _pagingController.error = 'Error';
          }
        },
        child: BlocBuilder<TaskerCubit, TaskerState>(
          builder: (context, state) {
            return Column(
              children: [
                addVerticalSpace(50),
                const CustomHeader(label: 'Popular Taskers'),
                const Divider(),
                addVerticalSpace(16),
                // SizedBox(
                //   height: 35,
                //   width: double.infinity,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 10,
                //     ),
                //     children: [
                //       const Icon(
                //         Icons.filter_alt_outlined,
                //         color: kColorSilver,
                //       ),
                //       addHorizontalSpace(5),
                //       ChoiceChip(
                //         label: Row(
                //           children: const [
                //             Text(
                //               'Category',
                //             ),
                //             Icon(Icons.keyboard_arrow_down_outlined)
                //           ],
                //         ),
                //         backgroundColor: Colors.white,
                //         side: const BorderSide(color: kColorGrey),
                //         selected: false,
                //         disabledColor: Colors.white,
                //       ),
                //       addHorizontalSpace(5),
                //       ChoiceChip(
                //         label: Row(
                //           children: const <Widget>[
                //             Text(
                //               'Buddhanagar',
                //             ),
                //             Icon(Icons.keyboard_arrow_down_outlined)
                //           ],
                //         ),
                //         backgroundColor: Colors.white,
                //         side: const BorderSide(color: kColorGrey),
                //         selected: false,
                //         disabledColor: Colors.white,
                //       ),
                //       addHorizontalSpace(5),
                //       ChoiceChip(
                //         label: Row(
                //           children: const <Widget>[
                //             Text(
                //               'Any Price',
                //             ),
                //             Icon(Icons.keyboard_arrow_down_outlined)
                //           ],
                //         ),
                //         backgroundColor: Colors.white,
                //         side: const BorderSide(color: kColorGrey),
                //         selected: false,
                //         disabledColor: Colors.white,
                //       ),
                //       addHorizontalSpace(5),
                //     ],
                //   ),
                // ),
                // addVerticalSpace(8),
                Expanded(
                  child: PagedGridView(
                    pagingController: _pagingController,
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, Tasker item, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            context.read<TaskerCubit>().loadSingleTasker(
                                  item.user?.id ?? '',
                                );
                            context.read<TaskerCubit>().loadSingleTaskerServices(
                                  item.user?.id ?? '',
                                );
                            context.read<TaskerCubit>().loadSingleTaskerTask(
                                  item.user?.id ?? '',
                                );
                            context.read<TaskerCubit>().loadSingleTaskerReviews(
                                  item.user?.id ?? '',
                                );
                            Navigator.pushNamed(
                              context,
                              TaskerProfileView.routeName,
                            );
                          },
                          child: TaskerCard(
                            networkImageUrl: item.profileImage,
                            label: "${item.user?.firstName} ${item.user?.lastName}",
                            designation: item.designation,
                            happyClients: item.stats?.happyClients.toString(),
                            ratings:
                                "${item.rating?.avgRating?.toStringAsFixed(2) ?? '5'} (${item.rating?.userRatingCount ?? '0'})",
                            rate: "Rs. ${item.hourlyRate}",
                            callback: () {
                              if (CacheHelper.isLoggedIn == false) {
                                notLoggedInPopUp(context);
                              }
                              if (CacheHelper.isLoggedIn == false) return;
                            },
                            onFavouriteTapped: () {},
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
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
