import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/error/error_page.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/chat/models/chat_person_details.dart';
import 'package:cipher/features/chat/view/chat_page.dart';
import 'package:cipher/features/services/presentation/pages/sections/packages_offers_section.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/sections/sections.dart';
import 'package:cipher/locator.dart';
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
  TextEditingController budgetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookingsBloc, BookingsState>(
        builder: (context, state) {
          budgetController.setText(double.parse(
                  state.result.entityService?.isRequested ?? false
                      ? state.result.earning ?? '0.0'
                      : state.result.price ?? '0.0')
              .toInt()
              .toString());
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
                                          // "${booking.entityService?.createdBy?.designation ?? ''} ",
                                          "${booking.entityService?.createdBy?.firstName ?? ''} "
                                          "${booking.entityService?.createdBy?.lastName ?? ''}",
                                          style: kLightBlueText14,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              final box =
                                                  context.findRenderObject()
                                                      as RenderBox?;
                                              Share.share(
                                                "$kShareLinks/box/${booking.id}",
                                                subject: booking
                                                    .entityService?.title,
                                                sharePositionOrigin: box!
                                                        .localToGlobal(
                                                            Offset.zero) &
                                                    box.size,
                                              );
                                            },
                                            title: Text("Share",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            leading: const Icon(
                                              Icons.redo_sharp,
                                            ),
                                          ),
                                          ListTile(
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
                                            leading: Icon(Icons.block_flipped),
                                            title: Text('Cancel',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Icon(Icons.more_vert),
                                ),
                              ],
                            ),
                            addVerticalSpace(16),
                            Row(
                              children: [
                                // Row(
                                //   children: [
                                //     const Icon(
                                //       Icons.star,
                                //       color: Colors.amber,
                                //     ),
                                //     Text(booking.entityService?.viewsCount
                                //             ?.toString() ??
                                //         '0.0 (0)')
                                //   ],
                                // ),
                                // addHorizontalSpace(16),
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
                            Text('Booking Details',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            addVerticalSpace(8),
                            Row(
                              children: [
                                Text(
                                  'Start Date : ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text('${Jiffy(booking.startDate).yMMMd} ',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('End Date : ',
                                    style: TextStyle(color: Colors.grey)),
                                Text('${Jiffy(booking.endDate).yMMMd}',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Proposed Price : ',
                                    style: TextStyle(color: Colors.grey)),
                                Text(
                                    double.parse(booking.entityService
                                                    ?.isRequested ??
                                                false
                                            ? booking.earning.toString()
                                            : booking.price.toString())
                                        .toStringAsFixed(2),
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Task Days : ',
                                    style: TextStyle(color: Colors.grey)),
                                // Text(booking.""),
                              ],
                            ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 8.0),
                            //   child: Column(
                            //     children: [
                            //       AdditionalInfoSection(
                            //         date:
                            //             '${Jiffy(booking.startDate).yMMMd} . ${booking.startTime}',
                            //         location: booking.entityService?.location,
                            //         views: booking.entityService?.viewsCount
                            //                 ?.toString() ??
                            //             '0',
                            //         happyClients: booking
                            //                 .createdBy?.stats?.happyClients
                            //                 ?.toString() ??
                            //             '0',
                            //         successRate: booking
                            //                 .createdBy?.stats?.successRate
                            //                 ?.toString() ??
                            //             '0',
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            addVerticalSpace(16),
                            Text('Description',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
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
                                              videoURL:
                                                  mediaList[index].media ?? '',
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
                    ],
                  ),
                ),
                if ((booking.isAccepted ?? false) &&
                    context.read<UserBloc>().state.taskerProfile?.user?.id !=
                        booking.entityService?.createdBy?.id) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: CustomElevatedButton(
                      callback: () {
                        locator<FirebaseFirestore>()
                            .collection("userChats")
                            .doc(
                                "${context.read<UserBloc>().state.taskerProfile?.user?.id}")
                            .get()
                            .then((value) {
                          value.data()?.forEach((key, value) {
                            if (value['userInfo']['uid'] ==
                                booking.entityService?.createdBy?.id) {
                              Navigator.pushNamed(
                                context,
                                ChatPage.routeName,
                                arguments: ChatPersonDetails(
                                  groupName: key,
                                  fullName:
                                      "${booking.entityService?.createdBy?.firstName ?? ''} ${booking.entityService?.createdBy?.middleName ?? ''} ${booking.entityService?.createdBy?.lastName ?? ''}",
                                  date: (value['date'] as Timestamp)
                                      .toDate()
                                      .toString(),
                                  id: booking.entityService?.createdBy?.id,
                                  isRead: value['read'] as bool,
                                  lastMessage: '',
                                  profileImage: booking.entityService?.createdBy
                                          ?.profileImage ??
                                      kHomaaleImg,
                                ),
                              );
                            }
                          });
                        });
                      },
                      label: 'Open Conversation',
                    ),
                  ),
                  addVerticalSpace(16)
                ],
                Visibility(
                  visible: booking.isAccepted ?? false,
                  child: PriceBookFooterSection(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => Padding(
                          padding: EdgeInsets.only(
                            left: 16.0,
                            top: 16.0,
                            right: 16.0,
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CustomModalSheetDrawerIcon(),
                              Padding(
                                padding: kPadding10,
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Enter Budget',
                                              style: kPurpleText16,
                                            ),
                                          ],
                                        ),
                                        kHeight5,
                                        NumberIncDecField(
                                          width: double.infinity,
                                          onSubmit: (value) {},
                                          controller: budgetController,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              CustomElevatedButton(
                                callback: () async =>
                                    context.read<BookingsBloc>().add(
                                          BookingNegotiationBudgetUpdate(
                                            id: booking.id ?? 0,
                                            budget: budgetController.text,
                                          ),
                                        ),
                                label: 'Update Price',
                              ),
                              kHeight50,
                            ],
                          ),
                        ),
                      );
                    },
                    price:
                        'RS. ${double.parse(booking.entityService?.isRequested ?? false ? booking.earning.toString() : booking.price.toString()).toStringAsFixed(2)}',
                    bgColor: Colors.blue.shade50,
                    buttonLabel: 'Set Budget',
                    buttonColor: kColorPrimary,
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
