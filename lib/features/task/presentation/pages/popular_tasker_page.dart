// import 'package:cipher/core/app/root.dart';
// import 'package:cipher/core/cache/cache_helper.dart';
// import 'package:cipher/core/constants/constants.dart';
// import 'package:cipher/features/tasker/data/models/tasker_list_res.dart';
// import 'package:cipher/features/tasker/presentation/bloc/tasker_bloc.dart';
// import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
// import 'package:cipher/features/tasker/presentation/view/tasker.dart';
// import 'package:cipher/locator.dart';
// import 'package:cipher/widgets/widgets.dart';
// import 'package:dependencies/dependencies.dart';
// import 'package:flutter/material.dart';

// class PopularTaskerPage extends StatefulWidget {
//   static const routeName = '/popular-tasker-page';
//   const PopularTaskerPage({super.key});

//   @override
//   State<PopularTaskerPage> createState() => _PopularTaskerPageState();
// }

// class _PopularTaskerPageState extends State<PopularTaskerPage> {
//   List<Tasker> taskerList = [];

//   //initialize page controller
//   PagingController<int, Tasker> _pagingController = PagingController(firstPageKey: 1);

//   @override
//   void initState() {
//     super.initState();
//     //so at event add list of records
//     _pagingController.addPageRequestListener(
//       (pageKey) => context.read<TaskerCubit>().loadTaskerList(page: pageKey),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _pagingController.dispose();
//   }

//   void _refresh() {
//     _pagingController.itemList?.clear();
//     _pagingController.refresh();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<TaskerCubit, TaskerState>(
//         listener: (context, state) {
//           if (state.status == TheStates.success) {
//             taskerList = state.taskerListRes.result!;

//             final lastPage = state.taskerListRes.totalPages!;
//             final next = 1 + state.taskerListRes.current!;

//             if (next > lastPage) {
//               _pagingController.appendLastPage(taskerList);
//             } else {
//               _pagingController.appendPage(taskerList, next);
//             }
//           }
//           if (state.status == TheStates.failure) {
//             _pagingController.error = 'Error';
//           }
//         },
//         child: BlocBuilder<TaskerCubit, TaskerState>(
//           builder: (context, state) {
//             return Column(
//               children: [
//                 addVerticalSpace(50),
//                 const CustomHeader(label: 'Popular Taskers'),
//                 const Divider(),
//                 addVerticalSpace(16),
//                 Expanded(
//                   child: PagedGridView(
//                     shrinkWrap: true,
//                     pagingController: _pagingController,
//                     builderDelegate: PagedChildBuilderDelegate(
//                       itemBuilder: (context, Tasker item, index) => Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: InkWell(
//                           onTap: () {
//                             context.read<TaskerCubit>().loadSingleTasker(
//                                   item.user?.id ?? '',
//                                 );
//                             context.read<TaskerCubit>().loadSingleTaskerServices(
//                                   item.user?.id ?? '',
//                                 );
//                             context.read<TaskerCubit>().loadSingleTaskerTask(
//                                   item.user?.id ?? '',
//                                 );
//                             context.read<TaskerCubit>().loadSingleTaskerReviews(
//                                   item.user?.id ?? '',
//                                 );
//                             Navigator.pushNamed(
//                               context,
//                               TaskerProfileView.routeName,
//                             );
//                           },
//                           child: TaskerCard(
//                             id: item.user?.id.toString() ?? '',
//                             networkImageUrl: item.profileImage,
//                             label: "${item.user?.firstName} ${item.user?.lastName}",
//                             designation: item.designation,
//                             happyClients: item.stats?.happyClients.toString(),
//                             ratings:
//                                 "${item.rating?.avgRating?.toStringAsFixed(2) ?? '5'} (${item.rating?.userRatingCount ?? '0'})",
//                             rate: "Rs. ${item.hourlyRate}",
//                             callbackLabel: item.isFollowed ?? false ? 'Following' : 'Follow',
//                             isFollowed: item.isFollowed ?? false,
//                             callback: () {
//                               if (CacheHelper.isLoggedIn == false) {
//                                 notLoggedInPopUp(context);
//                               } else {
//                                 if (item.isFollowed ?? false) {
//                                   context
//                                       .read<TaskerCubit>()
//                                       .handleFollowUnFollow(id: item.user?.id ?? '', follow: false)
//                                       .then((value) => _refresh());
//                                 } else {
//                                   context
//                                       .read<TaskerCubit>()
//                                       .handleFollowUnFollow(id: item.user?.id ?? '', follow: true)
//                                       .then((value) => _refresh());
//                                 }
//                               }
//                             },
//                             onFavouriteTapped: () {},
//                           ),
//                         ),
//                       ),
//                     ),
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.8,
//                     ),
//                     padding: EdgeInsets.zero,
//                   ),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
