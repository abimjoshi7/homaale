import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/presentation/bloc/book_event_handler_bloc.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/chat/bloc/chat_bloc.dart';
import 'package:cipher/features/event/data/models/event_availability.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/services/presentation/pages/sections/service_detail_header_section.dart';
import 'package:cipher/features/bookings/presentation/pages/views/details_view.dart';
import 'package:cipher/features/bookings/presentation/pages/views/schedule_view.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ServiceBookingPage extends StatelessWidget {
  static const routeName = '/service-booking-page';
  const ServiceBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookEventHandlerBloc(),
      child: ServiceBookingMainView(),
    );
  }
}

class ServiceBookingMainView extends StatefulWidget {
  const ServiceBookingMainView({super.key});

  @override
  State<ServiceBookingMainView> createState() => _ServiceBookingMainViewState();
}

class _ServiceBookingMainViewState extends State<ServiceBookingMainView> {
  int selectedIndex = 0;
  late PageController _pageController;
  final List<Widget> widgetList = [
    const ScheduleView(),
    const DetailsView(),
  ];
  final _uploadBloc = locator<UploadBloc>();

  @override
  void initState() {
    super.initState();
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
      body: BlocBuilder<EventBloc, EventState>(
        builder: (context, eventState) {
          return Column(
            children: [
              Expanded(
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
              ),
              Column(
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
                                      taskerID: state
                                          .taskEntityService?.createdBy?.id,
                                    ));

                                    await CacheHelper.clearCachedData(
                                            kBookedMap)
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
              ),
            ],
          );
        },
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
        child: BlocBuilder<UploadBloc, UploadState>(
          bloc: _uploadBloc,
          builder: (context, state) {
            return CustomElevatedButton(
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
            );
          },
        ),
      ),
    );
  }

  Widget showBookButton(TaskEntityServiceState state, BuildContext context) {
    return BlocListener<EventBloc, EventState>(
      listenWhen: (previous, current) {
        if (previous.isLoaded == false && current.isLoaded == false)
          return false;
        return true;
      },
      listener: (context, eventState) async {
        if (eventState.theStates == TheStates.success &&
            eventState.isLoaded == true) {
          if (_uploadBloc.state.imageFileList.length != 0 ||
              _uploadBloc.state.videoFileList.length != 0) await _uploadFile();
          final req = BookEntityServiceReq(
            location: state.taskEntityService!.location!.isEmpty
                ? "Remote"
                : state.taskEntityService?.location,
            entityService: state.taskEntityService?.id,
            price: context.read<BookEventHandlerBloc>().state.budget,
            budgetTo: context.read<BookEventHandlerBloc>().state.budget,
            requirements:
                context.read<BookEventHandlerBloc>().state.requirements == null
                    ? []
                    : List<String>.from(
                        state.taskEntityService?.highlights as Iterable,
                      ),
            startDate: DateTime.parse(
                context.read<BookEventHandlerBloc>().state.endDate!),
            endDate: DateTime.parse(
                context.read<BookEventHandlerBloc>().state.endDate!),
            startTime: context.read<BookEventHandlerBloc>().state.startTime,
            endTime: context.read<BookEventHandlerBloc>().state.endTime,
            description: context.read<BookEventHandlerBloc>().state.description,
            city: context.read<BookEventHandlerBloc>().state.city,
            images: _uploadBloc.state.uploadedImageList,
            videos: _uploadBloc.state.uploadedVideoList,
          );
          context.read<BookingsBloc>().add(BookingCreated(req));
        }
        if (eventState.theStates == TheStates.failure &&
            eventState.isLoaded == false) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: "Error",
              content: "Schedule not available for given time",
              onTap: () {},
              isSuccess: false,
            ),
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
            if (state.taskEntityService?.event == null) {
              if (_uploadBloc.state.imageFileList.length != 0 ||
                  _uploadBloc.state.videoFileList.length != 0)
                await _uploadFile();
              final req = BookEntityServiceReq(
                location: state.taskEntityService!.location!.isEmpty
                    ? "Remote"
                    : state.taskEntityService?.location,
                entityService: state.taskEntityService?.id,
                price: context.read<BookEventHandlerBloc>().state.budget,
                budgetTo: context.read<BookEventHandlerBloc>().state.budget,
                requirements:
                    context.read<BookEventHandlerBloc>().state.requirements ==
                            null
                        ? []
                        : List<String>.from(
                            state.taskEntityService?.highlights as Iterable,
                          ),
                startDate: DateTime.parse(
                    context.read<BookEventHandlerBloc>().state.endDate!),
                endDate: DateTime.parse(
                    context.read<BookEventHandlerBloc>().state.endDate!),
                startTime: context.read<BookEventHandlerBloc>().state.startTime,
                endTime: context.read<BookEventHandlerBloc>().state.endTime,
                description:
                    context.read<BookEventHandlerBloc>().state.description,
                city: context.read<BookEventHandlerBloc>().state.city,
                images:
                    context.read<BookEventHandlerBloc>().state.images == null
                        ? []
                        : List<int>.from(
                            context.read<BookEventHandlerBloc>().state.images
                                as Iterable,
                          ),
                videos:
                    context.read<BookEventHandlerBloc>().state.videos == null
                        ? []
                        : List<int>.from(
                            context.read<BookEventHandlerBloc>().state.videos
                                as Iterable,
                          ),
              );
              context.read<BookingsBloc>().add(
                    BookingCreated(req),
                  );
            } else {
              final availableReq = EventAvailability(
                date: context.read<BookEventHandlerBloc>().state.endDate,
                start: context.read<BookEventHandlerBloc>().state.startTime,
                end: context.read<BookEventHandlerBloc>().state.endTime,
              );

              context.read<EventBloc>().add(
                    EventAvailabilityChecked(
                      eventAvailability: availableReq,
                      id: state.taskEntityService?.event?.id ?? "",
                    ),
                  );
            }
          }
        },
        label: selectedIndex == 0 ? "Next" : "Book",
      ),
    );
  }

  Future<void> _uploadFile() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    _uploadBloc
      ..add(
        VideoToFilestoreUploaded(
          list: _uploadBloc.state.videoFileList,
        ),
      )
      ..add(
        ImageToFilestoreUploaded(
          list: _uploadBloc.state.imageFileList,
        ),
      );

    await Future.delayed(
      Duration(
        seconds: 15,
      ),
    );
  }
}
