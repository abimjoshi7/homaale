import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/kyc_constants.dart';
import 'package:cipher/features/bloc/scroll_bloc.dart';
import 'package:cipher/features/bookings/data/models/approve_req.dart';
import 'package:cipher/features/bookings/data/models/reject_req.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/support/presentation/widgets/report_page.dart';
import 'package:cipher/features/task/presentation/pages/apply_task_page.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart'
    as tes;
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart'
    as tsk;
import 'package:cipher/features/task_entity_service/presentation/pages/edit_task_entity_service_page.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/sections/sections.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/custom_favourite_icon.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';

import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/widgets/show_more_text_widget.dart';
import 'package:cipher/widgets/widgets.dart';

import '../../../../widgets/applicants_information_dialog.dart';
import '../../../support/presentation/bloc/support_ticket_type_options_bloc.dart';
import '../../../support/presentation/bloc/support_ticket_type_options_event.dart';

class SingleTaskPage extends StatefulWidget {
  const SingleTaskPage({super.key});
  static const routeName = '/single-task-page';

  @override
  State<SingleTaskPage> createState() => _SingleTaskPageState();
}

class _SingleTaskPageState extends State<SingleTaskPage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) async {
        final error = await CacheHelper.getCachedString(kErrorLog);
        if (state.approveFail ?? false) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Failed',
              content: error ??
                  'Something went wrong while trying to accept tasker. Please try again!',
              onTap: () {
                context.read<TaskBloc>().add(ResetApproveFailureStatus());
                Navigator.pop(context);
              },
              isSuccess: true,
            ),
          );
        }

        if (state.approveSuccess ?? false) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Success',
              content: 'Successfully hired!',
              onTap: () {
                context.read<TaskBloc>().add(ResetApproveSuccessStatus());
                Navigator.pop(context);
              },
              isSuccess: true,
            ),
          );
        }

        if (state.rejectFail ?? false) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Failed',
              content: error ??
                  'Something went wrong while trying to reject tasker. Please try again!',
              onTap: () {
                context.read<TaskBloc>().add(ResetRejectFailureStatus());
                Navigator.pop(context);
              },
              isSuccess: true,
            ),
          );
        }

        if (state.rejectSuccess ?? false) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Success',
              content: 'The Applicant has been rejected!',
              onTap: () {
                context.read<TaskBloc>().add(ResetRejectSuccessStatus());
                Navigator.pop(context);
              },
              isSuccess: true,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.theState == TheStates.success && state.taskModel != null) {
          final documentDescription =
              Bidi.stripHtmlIfNeeded(state.taskModel?.description ?? "");
          final List<tes.Image> taskMedia = [
            ...state.taskModel?.images ?? [],
            ...state.taskModel?.videos ?? [],
          ];

          return Scaffold(
            appBar: CustomAppBar(
              appBarTitle: state.taskModel?.service?.title ?? '',
              trailingWidget: SizedBox(),
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<TaskBloc>().add(
                            SingleEntityTaskLoadInitiated(
                              id: state.taskModel?.id ?? '',
                              userId: context
                                      .read<UserBloc>()
                                      .state
                                      .taskerProfile
                                      ?.user
                                      ?.id ??
                                  '',
                            ),
                          );
                    },
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        if (state.applicantModel?.result?.length != 0)
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            color: Colors.blue.shade50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: kColorBlue,
                                  size: 20,
                                ),
                                addHorizontalSpace(5),
                                Expanded(
                                  child: Text(
                                    'Taskers have applied for your tasks. You can select best candidate for your task.',
                                    style: TextStyle(
                                        color: kColorBlue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: kPadding10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              state.taskModel?.createdBy
                                                      ?.profileImage ??
                                                  kDefaultAvatarNImg,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      addHorizontalSpace(
                                        10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(
                                              state.taskModel?.title ?? '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "${state.taskModel?.createdBy?.firstName ?? ''}"
                                            " ${state.taskModel?.createdBy?.lastName ?? ''}",
                                            style: kLightBlueText12,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      state.taskModel?.createdBy?.id ==
                                              context
                                                  .read<UserBloc>()
                                                  .state
                                                  .taskerProfile
                                                  ?.user
                                                  ?.id
                                          ? SizedBox()
                                          : CustomFavoriteIcon(
                                              typeID: state.taskModel?.id ?? '',
                                              type: ServiceType.entityservice,
                                              isBookmarked: state.taskModel
                                                      ?.isBookmarked ??
                                                  false,
                                            ),
                                      // kWidth10,
                                      GestureDetector(
                                        onTap: () async {
                                          if (CacheHelper.isLoggedIn == false) {
                                            await notLoggedInPopUp(context);
                                          }
                                          if (CacheHelper.isLoggedIn == true) {
                                            final box =
                                                context.findRenderObject()
                                                    as RenderBox?;
                                            Share.share(
                                              "$kShareLinks/tasks/${state.taskModel?.id}",
                                              subject: state.taskModel?.title,
                                              sharePositionOrigin: box!
                                                      .localToGlobal(
                                                          Offset.zero) &
                                                  box.size,
                                            );
                                          }
                                        },
                                        child: Icon(
                                          Icons.redo_sharp,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (!CacheHelper.isLoggedIn) {
                                            notLoggedInPopUp(context);
                                          }
                                          if (CacheHelper.isLoggedIn) {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (context) => Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Visibility(
                                                    visible: context
                                                            .read<UserBloc>()
                                                            .state
                                                            .taskerProfile
                                                            ?.user
                                                            ?.id !=
                                                        state.taskModel
                                                            ?.createdBy?.id,
                                                    child: ListTile(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                SupportTicketTypeOptionsBloc>()
                                                            .add(SupportTicketTypeOptionsLoaded(
                                                                target:
                                                                    'entityservice'));
                                                        Navigator.pushNamed(
                                                            context,
                                                            CommonReportPage
                                                                .routeName,
                                                            arguments: {
                                                              'isType':
                                                                  'isService',
                                                              'model':
                                                                  'entityservice',
                                                              'objectId': state
                                                                      .taskModel
                                                                      ?.id ??
                                                                  "",
                                                            });
                                                      },
                                                      leading:
                                                          Icon(Icons.report),
                                                      title: Text('Report'),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: context
                                                            .read<UserBloc>()
                                                            .state
                                                            .taskerProfile
                                                            ?.user
                                                            ?.id ==
                                                        state.taskModel
                                                            ?.createdBy?.id,
                                                    child: ListTile(
                                                      onTap: () {
                                                        showModalBottomSheet(
                                                          context: context,
                                                          isScrollControlled:
                                                              true,
                                                          builder: (context) =>
                                                              Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.75,
                                                            padding: EdgeInsets.only(
                                                                bottom: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets
                                                                    .bottom,
                                                                left: 8,
                                                                right: 8,
                                                                top: 8),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  EditTaskEntityServiceForm(
                                                                    id: state
                                                                            .taskModel
                                                                            ?.id ??
                                                                        "",
                                                                    isRequested:
                                                                        true,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      leading: Icon(
                                                        Icons.edit,
                                                      ),
                                                      title: Text('Edit'),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: context
                                                            .read<UserBloc>()
                                                            .state
                                                            .taskerProfile
                                                            ?.user
                                                            ?.id ==
                                                        state.taskModel
                                                            ?.createdBy?.id,
                                                    child: ListTile(
                                                      onTap: () async {
                                                        context
                                                            .read<
                                                                tsk.TaskEntityServiceBloc>()
                                                            .add(
                                                              tsk.TaskEntityServiceDeleted(
                                                                id: state
                                                                        .taskModel
                                                                        ?.id ??
                                                                    "",
                                                              ),
                                                            );

                                                        Navigator.pop(context);
                                                        Navigator
                                                            .popAndPushNamed(
                                                          context,
                                                          Profile.routeName,
                                                        );
                                                      },
                                                      leading: Icon(
                                                        Icons
                                                            .delete_forever_rounded,
                                                      ),
                                                      title: Text('Delete'),
                                                    ),
                                                  ),
                                                  addVerticalSpace(16)
                                                ],
                                              ),
                                            );
                                          }
                                          ;
                                        },
                                        child: const Icon(
                                          Icons.more_vert,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              addVerticalSpace(10),
                              Row(
                                children: <Widget>[
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.red,
                                        size: 18,
                                      ),
                                      kWidth5,
                                      SizedBox(
                                        width: 180,
                                        child: AutoSizeText(
                                          "${state.taskModel?.city?.name ?? ''}, ${state.taskModel?.city?.country?.name ?? ''}",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.people_alt_outlined,
                                        color: kColorPrimary,
                                        size: 18,
                                      ),
                                      kWidth5,
                                      Text(
                                        '${state.taskApplyCountModel?.count?.first.taskerCount ?? 0} Applied',
                                      ),
                                    ],
                                  ),
                                  // addHorizontalSpace(20),
                                ],
                              ),
                              addVerticalSpace(10),
                              Text(
                                "Date & Time",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              addVerticalSpace(10),
                              Row(
                                children: <Widget>[
                                  Text('Start Date : ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall),
                                  Text(
                                      Jiffy(
                                        state.taskModel?.startDate ??
                                            DateTime.now().toString(),
                                      ).yMMMMd,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text('End Date : ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall),
                                  Text(
                                      Jiffy(
                                        state.taskModel?.endDate ??
                                            DateTime.now().toString(),
                                      ).yMMMMd,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall),
                                ],
                              ),
                              // addVerticalSpace(10),
                              // Visibility(
                              //   visible: state.taskModel?.startTime != null,
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Row(
                              //         children: [
                              //           const Icon(
                              //             Icons.watch_later_outlined,
                              //             color: Colors.blue,
                              //             size: 18,
                              //           ),
                              //           kWidth5,
                              //           state.taskModel?.startTime == null
                              //               ? Text('00:00')
                              //               : Text(
                              //                   '${DateFormat.jm().format(
                              //                     DateFormat('hh:mm:ss')
                              //                         .parse(state.taskModel!
                              //                             .startTime!),
                              //                   )}',
                              //                 ),
                              //         ],
                              //       ),
                              //       Row(
                              //         children: [
                              //           const Icon(
                              //             Icons.remove_red_eye_outlined,
                              //             color: kColorPrimary,
                              //             size: 18,
                              //           ),
                              //           kWidth5,
                              //           Text(
                              //             "${state.taskModel?.count ?? 0} Views",
                              //           ),
                              //         ],
                              //       )
                              //     ],
                              //   ),
                              // ),
                              addVerticalSpace(10),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Problem Description',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              kHeight10,
                              ShowMoreTextWidget(
                                text: documentDescription,
                              ),
                              addVerticalSpace(24),
                              Visibility(
                                visible:
                                    state.taskModel?.highlights?.length != 0,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Requirements',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ),
                              ),
                              kHeight10,
                              ListView.separated(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => Row(
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.orange,
                                    ),
                                    kWidth10,
                                    Text(
                                      StringUtils.capitalize(
                                        state.taskModel?.highlights?[index] ??
                                            '',
                                      ),
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )
                                  ],
                                ),
                                separatorBuilder: (context, index) =>
                                    addVerticalSpace(8.0),
                                itemCount:
                                    state.taskModel?.highlights?.length ?? 0,
                              ),
                              BlocBuilder<RatingReviewsBloc, RatingReviewState>(
                                builder: (context, ratingBloc) {
                                  switch (ratingBloc.status) {
                                    case RatingStatus.success:
                                      return RatingReviewSection(
                                        reviews: ratingBloc.ratingResponseDto,
                                      );
                                    case RatingStatus.failure:
                                      return SizedBox();
                                    default:
                                      return SizedBox();
                                  }
                                },
                              ),
                              addVerticalSpace(16),
                              if (taskMedia.isNotEmpty)
                                CarouselSlider.builder(
                                  itemCount: taskMedia.length,
                                  itemBuilder: (context, index, realIndex) {
                                    return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      child: Stack(
                                        children: [
                                          Text('Images',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall),
                                          if (taskMedia[index]
                                                  .mediaType
                                                  ?.toLowerCase() ==
                                              'mp4')
                                            VideoPlayerWidget(
                                              videoURL:
                                                  taskMedia[index].media ?? '',
                                            )
                                          else
                                            Image.network(
                                              taskMedia[index].media.toString(),
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.network(kHomaaleImg),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              fit: BoxFit.cover,
                                            ),
                                          Positioned(
                                            bottom: 10,
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: List.generate(
                                                    taskMedia.length,
                                                    (ind) => Container(
                                                      height: 10,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              2),
                                                      width: index == ind
                                                          ? 20
                                                          : 10,
                                                      decoration: BoxDecoration(
                                                        color: index == ind
                                                            ? kColorGrey
                                                            : Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  options: CarouselOptions(
                                    viewportFraction: 1,
                                    enableInfiniteScroll: false,
                                  ),
                                )
                              else
                                SizedBox(),
                              // SizedBox(
                              // height: MediaQuery.of(context).size.height * 0.2,
                              // child: Image.network(
                              //   kHomaaleImg,
                              //   width: MediaQuery.of(context).size.width,
                              //   fit: BoxFit.cover,
                              // ),
                              // ),

                              if (state.applicantModel?.result?.length !=
                                  0) ...[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    'Taskers',
                                    style: kPurpleText16,
                                  ),
                                ),
                                GridView.count(
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  childAspectRatio: 0.9,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: List.generate(
                                    state.applicantModel?.result?.length ?? 0,
                                    (index) => TaskerCard(
                                      onFavouriteTapped: () {},
                                      callback: () =>
                                          showApplicantDetailsDialog(
                                        description:
                                            '${state.applicantModel?.result?[index].description}',
                                        context: context,
                                        isNegotiable:
                                            state.taskModel?.isNegotiable ??
                                                false,
                                        profileImage: state
                                                .applicantModel
                                                ?.result?[index]
                                                .createdBy
                                                ?.profileImage ??
                                            kHomaaleImg,
                                        label:
                                            '${state.applicantModel?.result?[index].createdBy?.user?.firstName ?? ''} ${state.applicantModel?.result?[index].createdBy?.user?.lastName ?? ''}',
                                        happyClients:
                                            '${state.applicantModel?.result?[index].createdBy?.stats?.happyClients?.toInt() ?? '0'}',
                                        successRate:
                                            '${state.applicantModel?.result?[index].createdBy?.stats?.successRate?.toInt() ?? '0'}',
                                        rating:
                                            '${state.applicantModel?.result?[index].createdBy?.stats?.userReviews}',
                                        designation: state
                                            .applicantModel
                                            ?.result?[index]
                                            .createdBy
                                            ?.designation,
                                        isProfileVerified: state
                                                .applicantModel
                                                ?.result?[index]
                                                .createdBy
                                                ?.isProfileVerified ??
                                            false,
                                        title: state.taskModel?.title ?? '',
                                        budget:
                                            '${state.applicantModel?.result?[index].currency ?? ''}. ${state.applicantModel?.result?[index].price ?? ''}',
                                        status: state.applicantModel
                                            ?.result?[index].status,
                                        onRejectPressed: () {
                                          context.read<TaskBloc>().add(
                                                TaskRejectPeople(
                                                  rejectReq: RejectReq(
                                                      booking: state
                                                              .applicantModel
                                                              ?.result?[index]
                                                              .id ??
                                                          0),
                                                ),
                                              );
                                          Navigator.pop(context);
                                        },
                                        onApprovePressed: () {
                                          context.read<TaskBloc>().add(
                                                TaskApprovePeople(
                                                  approveReq: ApproveReq(
                                                      booking: state
                                                              .applicantModel
                                                              ?.result?[index]
                                                              .id ??
                                                          0),
                                                ),
                                              );
                                          Navigator.pop(context);
                                        },
                                        onNegotiatePressed: () {
                                          context.read<BookingsBloc>().add(
                                                BookingSingleLoaded(
                                                  state.applicantModel
                                                          ?.result?[index].id ??
                                                      0,
                                                ),
                                              );
                                          final _singleBookingResult = context
                                              .read<BookingsBloc>()
                                              .state
                                              .result;

                                          if (_singleBookingResult.isAccepted ==
                                              false)
                                            context.read<TaskBloc>().add(
                                                  ChangeTaskNegotiationStatus(
                                                    id: state
                                                            .applicantModel
                                                            ?.result?[index]
                                                            .id ??
                                                        0,
                                                  ),
                                                );
                                          //TODO: chat navigation
                                          else
                                            print("chat navigated");
                                          //TODO: chat navigations
                                        },
                                      ),
                                      buttonWidth:
                                          MediaQuery.of(context).size.width *
                                              0.22,
                                      callbackLabel: 'View detail',
                                      networkImageUrl: state
                                              .applicantModel
                                              ?.result?[index]
                                              .createdBy
                                              ?.profileImage ??
                                          kHomaaleImg,
                                      happyClients:
                                          '${state.applicantModel?.result?[index].createdBy?.stats?.happyClients?.toInt() ?? '0'}',
                                      rewardPercentage:
                                          '${state.applicantModel?.result?[index].createdBy?.stats?.successRate?.toInt() ?? '0'}',
                                      label:
                                          '${state.applicantModel?.result?[index].createdBy?.user?.firstName ?? ''} ${state.applicantModel?.result?[index].createdBy?.user?.lastName ?? ''}',
                                      designation: state
                                          .applicantModel
                                          ?.result?[index]
                                          .createdBy
                                          ?.designation,
                                      rate:
                                          'Rs. ${state.applicantModel?.result?[index].currency ?? ""} - ${state.applicantModel?.result?[index].price ?? ""}',
                                      ratings:
                                          '${state.applicantModel?.result?[index].createdBy?.stats?.userReviews?.toInt()}',
                                    ),
                                  ),
                                ),
                              ],
                              // RecommendedSimilarServices(
                              //   isRecommended: true,
                              //   recommend:
                              //       context.read<tsk.TaskEntityServiceBloc>().state.recommendedSimilarDto.recommend,
                              // ),
                              // kHeight15,
                              // RecommendedSimilarServices(
                              //   isRecommended: false,
                              //   recommend:
                              //       context.read<tsk.TaskEntityServiceBloc>().state.recommendedSimilarDto.similar,
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: PriceBookFooterSection(
                    bgColor: Colors.blue.shade50,
                    isNegotiable: state.taskModel?.isNegotiable ?? false,
                    isUser: state.taskModel?.createdBy?.id ==
                        context.read<UserBloc>().state.taskerProfile?.user?.id,
                    buttonLabel: getStatus('')["status"] as String,
                    buttonColor: getStatus('')["color"] as Color,
                    // buttonColor: getStatus('')["color"] as Color,
                    price:
                        "Rs. ${Decimal.parse(state.taskModel?.budgetTo ?? '0.0')}",
                    onPressed: () {
                      if (!CacheHelper.isLoggedIn) {
                        notLoggedInPopUp(context);
                      }
                      if (!CacheHelper.isLoggedIn) return;
                      if (CacheHelper.isKycVerified == false) {
                        notVerifiedPopup(context);
                      }
                      if (CacheHelper.isKycVerified == false) return;
                      context.read<TaskBloc>().add(
                            SingleEntityTaskLoadInitiated(
                              id: state.taskModel?.id ?? '',
                              userId: context
                                      .read<UserBloc>()
                                      .state
                                      .taskerProfile
                                      ?.user
                                      ?.id ??
                                  '',
                            ),
                          );
                      Navigator.pushNamed(context, ApplyTaskPage.routeName);
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return CardLoading(
            height: 700,
          );
        }
      },
    );
  }
}
