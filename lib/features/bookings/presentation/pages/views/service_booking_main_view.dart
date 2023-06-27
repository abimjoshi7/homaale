import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/upload_helper.dart';
import 'package:cipher/features/bookings/data/models/models.dart';
import 'package:cipher/features/bookings/presentation/bloc/book_event_handler_bloc.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/views/views.dart';
import 'package:cipher/features/chat/bloc/chat_bloc.dart';
import 'package:cipher/features/services/presentation/pages/sections/service_detail_header_section.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ServiceBookingMainView extends StatefulWidget {
  ServiceBookingMainView({super.key});

  @override
  State<ServiceBookingMainView> createState() => _ServiceBookingMainViewState();
}

class _ServiceBookingMainViewState extends State<ServiceBookingMainView> {
  final uploadBloc = locator<UploadBloc>();
  final bookEventHandlerBloc = locator<BookEventHandlerBloc>();
  int selectedIndex = 0;
  late PageController _pageController;
  final List<Widget> widgetList = [];

  @override
  void initState() {
    super.initState();
    widgetList.addAll(
      [
        ScheduleView(
          bookEventHandlerBloc: bookEventHandlerBloc,
        ),
        DetailsView(
          uploadBloc: uploadBloc,
          bookEventHandlerBloc: bookEventHandlerBloc,
        ),
      ],
    );
    _pageController = PageController(
      initialPage: selectedIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "Service Booking",
        trailingWidget: SizedBox.shrink(),
      ),
      body: Column(
        children: [
          _buildHeaders(),
          _buildButtons(context),
        ],
      ),
    );
  }

  Column _buildButtons(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
          builder: (context, state) {
            if (state.theStates == TheStates.success) {
              return BlocListener<BookingsBloc, BookingsState>(
                listenWhen: (previous, current) {
                  if (previous.isBooked == false) {
                    return true;
                  } else {
                    return false;
                  }
                },
                listener: (context, bookingState) async {
                  if (bookingState.states == TheStates.success &&
                      bookingState.isBooked == true) {
                    showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                        heading: 'Success',
                        content: 'Booking is successful',
                        onTap: () async {
                          final chatBloc = locator<ChatBloc>();
                          chatBloc.add(HandleUserCreationChat(
                            userID: context
                                .read<UserBloc>()
                                .state
                                .taskerProfile
                                ?.user
                                ?.id,
                            taskerID: state.taskEntityService?.createdBy?.id,
                          ));

                          await CacheHelper.clearCachedData(kBookedMap)
                              .whenComplete(
                            () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                Root.routeName,
                                (route) => false,
                              );
                            },
                          );
                        },
                        isSuccess: true,
                      ),
                    );
                  }
                },
                child: showBookButton(state, context),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        showCancelButton(context),
      ],
    );
  }

  Widget _buildHeaders() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
              ),
              child: ServiceBookingHeaderSection(
                selectedIndex: selectedIndex,
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: widgetList.length,
                itemBuilder: (context, index) =>
                    widgetList[index % widgetList.length],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showCancelButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: Visibility(
        visible: selectedIndex == 1,
        child: CustomElevatedButton(
          mainColor: Colors.white,
          textColor: kColorPrimary,
          borderColor: kColorPrimary,
          callback: () {
            if (_pageController.page == 1) {
              setState(() {
                selectedIndex = 0;
              });
              _pageController.jumpToPage(0);
            } else {
              Navigator.pop(context);
            }
          },
          label: "Cancel",
        ),
      ),
    );
  }

  Widget showBookButton(TaskEntityServiceState state, BuildContext context) {
    final upload = UploadHelper(bloc: uploadBloc, context: context);
    return BlocListener<UploadBloc, UploadState>(
      bloc: uploadBloc,
      listenWhen: (previous, current) {
        if (previous.isImageUploaded != true && current.isImageUploaded == true)
          return true;
        if (previous.isVideoUploaded != true && current.isVideoUploaded == true)
          return true;
        return false;
      },
      listener: (context, uploadState) {
        if (uploadState.isImageUploaded && uploadState.isVideoUploaded) {
          final req = BookEntityServiceReq(
            location: bookEventHandlerBloc.state.address,
            entityService: state.taskEntityService?.id,
            price: bookEventHandlerBloc.state.budget,
            budgetTo: bookEventHandlerBloc.state.budget,
            requirements: context
                        .read<BookEventHandlerBloc>()
                        .state
                        .requirements
                        ?.length ==
                    0
                ? []
                : bookEventHandlerBloc.state.requirements,
            startDate: DateTime.parse(bookEventHandlerBloc.state.startDate!),
            endDate: DateTime.parse(bookEventHandlerBloc.state.endDate!),
            startTime: bookEventHandlerBloc.state.startTime,
            endTime: bookEventHandlerBloc.state.endTime,
            description: bookEventHandlerBloc.state.description,
            city: int.parse(
              bookEventHandlerBloc.state.city,
            ),
            images: uploadBloc.state.uploadedImageList,
            videos: uploadBloc.state.uploadedVideoList,
          );
          context.read<BookingsBloc>().add(
                BookingCreated(req),
              );
        }
      },
      child: CustomElevatedButton(
        callback: () async {
          if (_pageController.page == 0) {
            setState(
              () {
                selectedIndex = 1;
              },
            );
            _pageController.jumpToPage(1);
          } else {
            if (bookEventHandlerBloc.state.isTermAccepted) {
              if (uploadBloc.state.imageFileList.isEmpty &&
                  uploadBloc.state.videoFileList.isEmpty) {
                final req = BookEntityServiceReq(
                  location: bookEventHandlerBloc.state.address,
                  entityService: state.taskEntityService?.id,
                  price: bookEventHandlerBloc.state.budget,
                  budgetTo: bookEventHandlerBloc.state.budget,
                  requirements: context
                              .read<BookEventHandlerBloc>()
                              .state
                              .requirements
                              ?.length ==
                          0
                      ? []
                      : bookEventHandlerBloc.state.requirements,
                  startDate:
                      DateTime.parse(bookEventHandlerBloc.state.startDate!),
                  endDate: DateTime.parse(bookEventHandlerBloc.state.endDate!),
                  startTime: bookEventHandlerBloc.state.startTime,
                  endTime: bookEventHandlerBloc.state.endTime,
                  description: bookEventHandlerBloc.state.description,
                  city: int.parse(
                    bookEventHandlerBloc.state.city,
                  ),
                  images: [],
                  videos: [],
                );
                context.read<BookingsBloc>().add(
                      BookingCreated(req),
                    );
              } else {
                await upload
                  ..uploadImage()
                  ..uploadVideo();
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Please accept terms and conditions.",
                  ),
                ),
              );
            }

            // if (state.taskEntityService?.event == null) {
            //   // await upload
            //   //   ..uploadImage()
            //   //   ..uploadVideo();
            //   // // if (uploadBloc.state.imageFileList.length != 0 ||
            //   //     uploadBloc.state.videoFileList.length != 0)
            //   //   await _uploadFile();
            //   final req = BookEntityServiceReq(
            //     location: bookEventHandlerBloc.state.address,
            //     entityService: state.taskEntityService?.id,
            //     price: bookEventHandlerBloc.state.budget,
            //     budgetTo: bookEventHandlerBloc.state.budget,
            //     requirements: context
            //                 .read<BookEventHandlerBloc>()
            //                 .state
            //                 .requirements
            //                 ?.length ==
            //             0
            //         ? []
            //         : bookEventHandlerBloc.state.requirements,
            //     startDate: DateTime.parse(
            //         bookEventHandlerBloc.state.startDate!),
            //     endDate: DateTime.parse(
            //         bookEventHandlerBloc.state.endDate!),
            //     startTime:
            //         bookEventHandlerBloc.state.startTime,
            //     endTime: bookEventHandlerBloc.state.endTime,
            //     description:
            //         bookEventHandlerBloc.state.description,
            //     city: int.parse(
            //       bookEventHandlerBloc.state.city,
            //     ),
            //     images: uploadBloc.state.uploadedImageList.isEmpty
            //         ? []
            //         : uploadBloc.state.uploadedImageList,
            //     videos: uploadBloc.state.uploadedVideoList.isEmpty
            //         ? []
            //         : uploadBloc.state.uploadedVideoList,
            //   );
            //   context.read<BookingsBloc>().add(
            //         BookingCreated(req),
            //       );
            // } else {
            //   final availableReq = EventAvailability(
            //     date: bookEventHandlerBloc.state.endDate,
            //     start: bookEventHandlerBloc.state.startTime,
            //     end: bookEventHandlerBloc.state.endTime,
            //   );

            //   context.read<EventBloc>().add(
            //         EventAvailabilityChecked(
            //           eventAvailability: availableReq,
            //           id: state.taskEntityService?.event?.id ?? "",
            //         ),
            //       );
            // }
            // } else {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     SnackBar(
            //       content: Text(
            //         "Please accept terms and conditions.",
            //       ),
            //     ),
            //   );
            // }
          }
        },
        label: selectedIndex == 0 ? "Next" : "Book",
      ),
    );
  }

  // Future<void> _uploadFile() async {
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (context) => Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );

  //   uploadBloc
  //     ..add(
  //       VideoToFilestoreUploaded(
  //         list: uploadBloc.state.videoFileList,
  //       ),
  //     )
  //     ..add(
  //       ImageToFilestoreUploaded(
  //         list: uploadBloc.state.imageFileList,
  //       ),
  //     );

  //   await Future.delayed(
  //     Duration(
  //       seconds: 15,
  //     ),
  //   );
  // }
}
