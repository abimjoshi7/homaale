import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/error/error_page.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/services/presentation/pages/sections/packages_offers_section.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/sections/sections.dart';
import 'package:cipher/widgets/show_more_text_widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../booking_cancel/presentation/pages/booking_cancel_page.dart';
import '../../../user/presentation/bloc/user/user_bloc.dart';

class BookedServicePage extends StatefulWidget {
  static const routeName = '/booked-service-page';
  const BookedServicePage({super.key});

  @override
  State<BookedServicePage> createState() => _BookedServicePageState();
}

class _BookedServicePageState extends State<BookedServicePage> {
  int _imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookingsBloc, BookingsState>(
        builder: (context, state) {
          if (state.states == TheStates.initial) {
            return const Center(
              child: CardLoading(
                height: 200,
              ),
            );
          } else if (state.states == TheStates.success) {
            final booking = state.result;
            final mediaList = [
              ...?booking.entityService?.images,
              ...?booking.entityService?.videos
            ];

            return Column(
              children: [
                addVerticalSpace(
                  50,
                ),
                CustomHeader(
                  label: booking.entityService?.title,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            booking.entityService?.createdBy
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
                                            '${booking.entityService?.title ?? ''}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                            overflow: TextOverflow.ellipsis,
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
                                        final box = context.findRenderObject()
                                            as RenderBox?;
                                        Share.share(
                                          "$kShareLinks/box/${booking.id}",
                                          subject: booking.entityService?.title,
                                          sharePositionOrigin:
                                              box!.localToGlobal(Offset.zero) &
                                                  box.size,
                                        );
                                      },
                                      child: const Icon(
                                        Icons.redo_sharp,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) => ListTile(
                                            onTap: () {
                                              Navigator.pop(context);
                                              Navigator.pushNamed(context,
                                                  BookingCancelPage.routeName,
                                                  //Todo: Need to send client and merchant on the basics of task and service
                                                  // if TASK send ->Client or Service ->Send merchant
                                                  arguments: {
                                                    'client': booking
                                                                .entityService
                                                                ?.createdBy
                                                                ?.id ==
                                                            context
                                                                .read<
                                                                    UserBloc>()
                                                                .state
                                                                .taskerProfile
                                                                ?.user
                                                                ?.id
                                                        ? 'client'
                                                        : 'merchant',
                                                  });
                                            },
                                            leading: Icon(Icons.cancel_rounded),
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
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(booking.entityService?.viewsCount
                                            ?.toString() ??
                                        '0.0 (0)')
                                  ],
                                ),
                                addHorizontalSpace(16),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.red,
                                    ),
                                    Text(
                                        '${booking.entityService?.city?.name ?? 'Kathmandu'}, ${booking.entityService?.city?.country?.name ?? 'Nepal'}')
                                  ],
                                ),
                              ],
                            ),
                            addVerticalSpace(16),
                            ShowMoreTextWidget(
                                text: Bidi.stripHtmlIfNeeded(booking
                                        .description ??
                                    'Root canal treatment (endodontics) is a dental procedure used to treat infection at the centre of a tooth. Root canal treatment is not painful and can save a tooth that might otherwise have to be removed completely.')),
                            if (booking.entityService?.highlights?.isNotEmpty ??
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
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.21,
                                child: CarouselSlider.builder(
                                  itemCount: mediaList.length,
                                  itemBuilder: (context, index, realIndex) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  child: Image.network(
                                                    mediaList[index]
                                                        .media
                                                        .toString(),
                                                    errorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.network(
                                                            kHomaaleImg),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
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
                                    enlargeCenterPage: mediaList.length == 1,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        borderRadius: BorderRadius.circular(10),
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
                      const Visibility(
                        visible: false,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: PackagesOffersSection(),
                        ),
                      ),
                      addVerticalSpace(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            AdditionalInfoSection(
                              date:
                                  '${Jiffy(booking.startDate).yMMMd} . ${booking.startTime}',
                              location: booking.entityService?.location,
                              views: booking.entityService?.viewsCount
                                      ?.toString() ??
                                  '0',
                              happyClients: booking
                                      .createdBy?.stats?.happyClients
                                      ?.toString() ??
                                  '0',
                              successRate: booking.createdBy?.stats?.successRate
                                      ?.toString() ??
                                  '0',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return ErrorPage();
        },
      ),
    );
  }
}
