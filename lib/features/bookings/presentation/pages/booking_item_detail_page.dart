import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/error/error_page.dart';
import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/archive/presentation/bloc/archive_task_entity_service_bloc.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/widgets/sections/custom_archive_popup.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/rating_reviews/presentation/rating_reviews_form.dart';
import 'package:cipher/features/services/presentation/pages/sections/packages_offers_section.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/sections/sections.dart';
import 'package:cipher/features/bookings/data/models/bookings_response_dto.dart'
    as bm;
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/show_more_text_widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/dashed_line_vertical_painter.dart';
import '../../../booking_cancel/presentation/pages/booking_cancel_page.dart';

class BookingItemDetailPage extends StatefulWidget {
  static const routeName = '/booking-item-detail-page';
  const BookingItemDetailPage({super.key});

  @override
  State<BookingItemDetailPage> createState() => _BookingItemDetailPageState();
}

class _BookingItemDetailPageState extends State<BookingItemDetailPage>
    with TheModalBottomSheet {
  int _imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final client = routeData?['client'] as String?;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<ArchiveTaskEntityServiceBloc,
          ArchiveTaskEntityServiceState>(
        listener: (context, state) {
          if (state.theStates == TheStates.success) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Task Archived Successfully."),
              backgroundColor: kColorGreen,
            ));
          }
          if (state.theStates == TheStates.failure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Task Archive Failed."),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: BlocListener<RatingReviewsBloc, RatingReviewState>(
          listener: (context, state) {
            if (state.ratingSubmitStatus == RatingSubmitStatus.success) {
              context.read<BookingsBloc>().add(BookingSingleLoaded(
                  context.read<BookingsBloc>().state.bookingRes.id));
              final isAssignee =
                  context.read<BookingsBloc>().state.bookingRes.assignee?.id ==
                      context.read<UserBloc>().state.taskerProfile?.user?.id;
              if (!isAssignee) {
                showDialog(
                  context: context,
                  builder: (context) => CustomArchivePopup(
                    id: state.taskId,
                  ),
                );
              }

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.ratingSubmitMessage),
                backgroundColor: kColorGreen,
              ));
            }
            if (state.ratingSubmitStatus == RatingSubmitStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.ratingSubmitMessage),
                backgroundColor: Colors.red,
              ));
            }
          },
          child: BlocListener<BookingsBloc, BookingsState>(
            listener: (context, state) {
              if (state.bookingRes.isRated == false &&
                  state.bookingRes.status == 'Completed' &&
                  (state.bookingRes.assignee?.id ==
                      context.read<UserBloc>().state.taskerProfile?.user?.id)) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Task Completed'),
                      content: Text('Give a review?'),
                      actions: [
                        CustomElevatedButton(
                          theWidth: MediaQuery.of(context).size.width * 0.2,
                          theHeight: 30,
                          callback: () {
                            Navigator.pop(context);
                          },
                          mainColor: Colors.white,
                          borderColor: kColorPrimary,
                          textColor: kColorPrimary,
                          label: 'No',
                        ),
                        CustomElevatedButton(
                          theWidth: MediaQuery.of(context).size.width * 0.2,
                          theHeight: 30,
                          callback: () {
                            Navigator.pop(context);
                            showCustomBottomSheet(
                              context: context,
                              widget: RatingReviewsForm(),
                            );
                            // showModalBottomSheet(
                            //   constraints: BoxConstraints(
                            //     maxHeight:
                            //         MediaQuery.of(context).size.height * 0.8,
                            //   ),
                            //   isScrollControlled: true,
                            //   isDismissible: false,
                            //   context: context,
                            //   builder: (context) => RatingReviewsForm(),
                            // );
                          },
                          label: 'Sure',
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: BlocBuilder<BookingsBloc, BookingsState>(
              builder: (context, state) {
                if (state.states == TheStates.initial) {
                  return const Center(
                    child: CardLoading(
                      height: 200,
                    ),
                  );
                } else if (state.states == TheStates.success) {
                  final booking = state.bookingRes;
                  final mediaList = <bm.Image>[
                    ...?booking.entityService?.images,
                    ...?booking.entityService?.videos
                  ];
                  final isAssignee = booking.assignee?.id ==
                      context.read<UserBloc>().state.taskerProfile?.user?.id;
                  print('object');
                  print(booking.cancellationReason);
                  return Column(
                    children: [
                      addVerticalSpace(
                        50,
                      ),
                      CustomHeader(
                        label: StringUtils.capitalize(booking.title!),
                      ),
                      Divider(),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Padding(
                              padding: kPadding10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  booking
                                                          .entityService
                                                          ?.createdBy
                                                          ?.profileImage ??
                                                      kDefaultAvatarNImg,
                                                ),
                                              ),
                                            ),
                                          ),
                                          addHorizontalSpace(10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6,
                                                child: Text(
                                                  '${StringUtils.capitalize(booking.title ?? '')}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                "${booking.entityService?.createdBy?.firstName ?? ''} "
                                                "${booking.entityService?.createdBy?.lastName ?? ''}",
                                                style: kLightBlueText14,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.bookmark_border,
                                            color: Colors.red,
                                          ),
                                          kWidth10,
                                          GestureDetector(
                                            onTap: () {
                                              final box =
                                                  context.findRenderObject()
                                                      as RenderBox?;
                                              Share.share(
                                                "$kShareLinks/bookings/${booking.entityService?.createdBy?.id}",
                                                subject: booking.entityService
                                                    ?.createdBy?.fullName,
                                                sharePositionOrigin: box!
                                                        .localToGlobal(
                                                            Offset.zero) &
                                                    box.size,
                                              );
                                            },
                                            child: const Icon(
                                              Icons.redo_sharp,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          if (booking.status == 'Open' ||
                                              booking.status == 'Waiting' ||
                                              booking.status == 'Approved' ||
                                              booking.status == 'Initiated' ||
                                              booking.status == 'On Progress')
                                            InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) =>
                                                      ListTile(
                                                    onTap: () {
                                                      Navigator.pop(context);

                                                      Navigator.pushNamed(
                                                          context,
                                                          BookingCancelPage
                                                              .routeName,
                                                          arguments: {
                                                            'client': client,
                                                          });
                                                    },
                                                    leading: Icon(
                                                        Icons.cancel_rounded),
                                                    title: Text('Cancel'),
                                                  ),
                                                );
                                              },
                                              child: Icon(Icons.more_vert),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  addVerticalSpace(16),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.red,
                                      ),
                                      Text(
                                          '${booking.entityService?.location ?? 'Nepal'}')
                                    ],
                                  ),
                                  addVerticalSpace(16),
                                  ShowMoreTextWidget(
                                      text: Bidi.stripHtmlIfNeeded(booking
                                              .description ??
                                          'Root canal treatment (endodontics) is a dental procedure used to treat infection at the centre of a tooth. Root canal treatment is not painful and can save a tooth that might otherwise have to be removed completely.')),
                                  if (booking.entityService?.highlights
                                          ?.isNotEmpty ??
                                      false) ...[
                                    addVerticalSpace(10),
                                    RequirementSection(
                                      requirementList:
                                          booking.entityService?.highlights,
                                    ),
                                  ],
                                  if (mediaList.isNotEmpty) ...[
                                    addVerticalSpace(10),
                                    Text(
                                      'Images',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.21,
                                      child: CarouselSlider.builder(
                                        itemCount: mediaList.length,
                                        itemBuilder:
                                            (context, index, realIndex) {
                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            margin: EdgeInsets.only(right: 32),
                                            child: mediaList[index]
                                                        .mediaType
                                                        ?.toLowerCase() ==
                                                    'mp4'
                                                ? VideoPlayerWidget(
                                                    videoURL: mediaList[index]
                                                            .media ??
                                                        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                                                  )
                                                : Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        child: Image.network(
                                                          mediaList[index]
                                                              .media
                                                              .toString(),
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.network(
                                                                  kServiceImageNImg),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.2,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          );
                                        },
                                        options: CarouselOptions(
                                          padEnds: mediaList.length == 1,
                                          enlargeCenterPage:
                                              mediaList.length == 1,
                                          viewportFraction: 0.8,
                                          enableInfiniteScroll: false,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              _imageIndex = index;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                          mediaList.length,
                                          (ind) => Container(
                                            height: 10,
                                            margin: const EdgeInsets.all(2),
                                            width: 10,
                                            decoration: BoxDecoration(
                                              color: _imageIndex == ind
                                                  ? Colors.amber
                                                  : Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            addVerticalSpace(10),
                            Image.asset(
                              'assets/banners/2.png',
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                            addVerticalSpace(10),
                            if (booking.status == 'Cancelled')
                              Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.redAccent.shade200,
                                      width: 1.5),
                                  color: Colors.red.shade50,
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Reason for cancellation',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Reason : ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                            Text(
                                              booking.cancellationReason ?? "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Description : ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                            Text(
                                              booking.cancellationDescription ??
                                                  "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )

                                    // BlocBuilder<BookingCancelBloc, BookingCancelState>(builder: (context, state) {
                                    //   print(state.bookingCancelModel?.cancellationReason);
                                    //   return
                                    // }),
                                    ),
                              ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date & Time',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  addVerticalSpace(4),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                              '${Jiffy(booking.startDate).MMMd} - ${Jiffy(booking.endDate).MMMd}')
                                        ],
                                      ),
                                      addVerticalSpace(8),
                                      if (booking.startTime != null &&
                                          booking.endTime != null) ...[
                                        addHorizontalSpace(8),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.alarm_on,
                                              color: kColorBlue,
                                            ),
                                            Text(
                                                '${booking.startTime} - ${booking.endTime}')
                                          ],
                                        )
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            addVerticalSpace(10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Task Status',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  addVerticalSpace(4),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Task Status :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(3),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: BookingTimelineStatus(
                                                  '${booking.status}')["color"]
                                              as Color,
                                          // color: (booking.status == 'Closed' ||
                                          //         booking.status == 'Cancelled')
                                          //     ? Colors.red.shade50
                                          //     : Colors.green.shade50,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Center(
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(
                                                BookingTimelineStatus(
                                                        '${booking.status}')[
                                                    "status"] as String,
                                                style: TextStyle(
                                                  color: BookingTimelineStatus(
                                                          '${booking.status}')[
                                                      "textColor"] as Color,

                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Visibility(
                              visible: false,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: PackagesOffersSection(),
                              ),
                            ),
                            addVerticalSpace(10),
                          ],
                        ),
                      ),
                      booking.status == 'Closed'
                          ? booking.isRated ?? false
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: kColorLightSkyBlue,
                                  height: 100,
                                  child: Center(
                                      child: Text('Your task is completed')),
                                )
                              : Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: kColorLightSkyBlue,
                                  height: 100,
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Your task is completed'),
                                        GestureDetector(
                                          onTap: () {
                                            showCustomBottomSheet(
                                              context: context,
                                              widget: RatingReviewsForm(),
                                            );
                                            // showModalBottomSheet(
                                            //   constraints: BoxConstraints(
                                            //     maxHeight:
                                            //         MediaQuery.of(context)
                                            //                 .size
                                            //                 .height *
                                            //             0.5,
                                            //   ),
                                            //   isScrollControlled: false,
                                            //   isDismissible: false,
                                            //   context: context,
                                            //   builder: (context) =>
                                            //       RatingReviewsForm(),
                                            // );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: kColorPrimary,
                                            ),
                                            constraints: BoxConstraints(
                                              minHeight: 30,
                                              minWidth: 100,
                                            ),
                                            child: AutoSizeText(
                                              textAlign: TextAlign.center,
                                              'Review Task',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                          : PriceBookFooterSection(
                              buttonLabel: statusToUpdate('${booking.status}',
                                  isAssignee)["buttonLabel"] as String,
                              buttonColor: statusToUpdate(
                                      '${booking.status}', isAssignee)["color"]
                                  as Color,
                              price: booking.entityService?.budgetFrom != null
                                  ? 'Rs. ${Decimal.parse(booking.entityService?.budgetFrom.toString() ?? '0.0')} - Rs. ${Decimal.parse(booking.entityService?.budgetTo.toString() ?? '0.0')}'
                                  : 'Rs. ${Decimal.parse(booking.entityService?.budgetTo.toString() ?? '0.0')}',
                              onPressed: () {
                                var taskToUpdate = statusToUpdate(
                                    '${booking.status}',
                                    isAssignee)["status"] as String;

                                if (booking.status == 'Initiated') {
                                  return;
                                }

                                if (booking.status == 'Completed') {
                                  if (isAssignee) {
                                    return;
                                  } else {
                                    context.read<BookingsBloc>().add(
                                          BookingStatusUpdate(
                                            id: booking.id!,
                                            status: taskToUpdate,
                                          ),
                                        );
                                  }
                                } else {
                                  context.read<BookingsBloc>().add(
                                        BookingStatusUpdate(
                                          id: booking.id!,
                                          status: taskToUpdate,
                                        ),
                                      );
                                }
                              },
                            ),
                    ],
                  );
                }
                return ErrorPage();
              },
            ),
          ),
        ),
      ),
    );
  }
}
