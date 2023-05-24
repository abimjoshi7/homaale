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
  final userBloc = locator<UserBloc>();
  int selectedIndex = 0;
  late PageController _pageController;
  final List<Widget> widgetList = [
    const ScheduleView(),
    const DetailsView(),
  ];
  late final UploadBloc uploadBloc;

  @override
  void initState() {
    super.initState();
    uploadBloc = context.read<UploadBloc>();
    userBloc.add(UserLoaded());
    _pageController = PageController(
      initialPage: selectedIndex,
    );
  }

  @override
  void dispose() {
    userBloc.close();
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
          if (eventState.theStates == TheStates.initial) {
            return const Center(
              child: CardLoading(
                height: 200,
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ServiceBookingHeaderSection(
                        selectedIndex: selectedIndex,
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
                            final error = await CacheHelper.getCachedString(
                              kErrorLog,
                            );
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
                                      userID: userBloc
                                          .state.taskerProfile?.user?.id,
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
                            if (bookingState.states == TheStates.failure &&
                                bookingState.isBooked == false) {
                              showDialog(
                                context: context,
                                builder: (context) => CustomToast(
                                  heading: 'Failure',
                                  content: error?.toTitleCase() ??
                                      'Something went wrong. Please try again later.',
                                  onTap: () async {},
                                  isSuccess: false,
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
          builder: (context, state) {
            return CustomElevatedButton(
              mainColor: Colors.white,
              textColor: kColorPrimary,
              borderColor: kColorPrimary,
              callback: () {
                if (state.theStates == TheStates.success) print(321);
                if (state.theStates == TheStates.loading) print(3211);
                if (state.theStates == TheStates.failure) print(13211);
                print(state.imageFileList);
                // if (_pageController.page == 1) {
                //   setState(() {
                //     selectedIndex = 0;
                //   });
                //   _pageController.jumpToPage(0);
                // } else {
                //   Navigator.pop(context);
                // }
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
      listener: (context, eventState) {
        if (eventState.theStates == TheStates.success &&
            eventState.isLoaded == true) {
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
            images: context.read<UploadBloc>().state.uploadedImageList ?? [],
            videos: context.read<UploadBloc>().state.uploadedVideoList ?? [],
          );
          context.read<BookingsBloc>().add(
                BookingCreated(req),
              );
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

    uploadBloc
      ..add(
        VideoToFilestoreUploaded(
          list: uploadBloc.state.videoFileList,
        ),
      )
      ..add(
        ImageToFilestoreUploaded(
          list: uploadBloc.state.imageFileList,
        ),
      );

    await Future.delayed(
      Duration(
        seconds: 15,
      ),
    );
  }
}
