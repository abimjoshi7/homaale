// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/kyc_constants.dart';
import 'package:cipher/features/bookings/data/models/approve_req.dart';
import 'package:cipher/features/bookings/data/models/reject_req.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/service_booking_page.dart';
import 'package:cipher/features/chat/bloc/chat_bloc.dart';
import 'package:cipher/features/chat/models/chat_person_details.dart';
import 'package:cipher/features/chat/view/chat_page.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart' as tb;
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart' as tes;
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/recommended_services.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/sections/event_section.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/sections/sections.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/applicants_information_dialog.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

class TaskEntityServicePage extends StatefulWidget {
  static const String routeName = '/task_entity_service_page';
  const TaskEntityServicePage({super.key});

  @override
  State<TaskEntityServicePage> createState() => _TaskEntityServicePageState();
}

class _TaskEntityServicePageState extends State<TaskEntityServicePage> {
  int _imageIndex = 0;
  final _firebaseBloc = locator<FirebaseFirestore>();
  bool isExistingUser = false;

  static List<tes.Image> getMedia(TaskEntityServiceState state) {
    final List<tes.Image> mediaList = [
      ...state.taskEntityService.images ?? [],
      ...state.taskEntityService.videos ?? [],
    ];
    return mediaList;
  }

  Future<List<tes.Image>> getMedias(TaskEntityServiceState state) async => await compute(getMedia, state);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskEntityServiceBloc, TaskEntityServiceState>(
      listener: (context, state) async {
        final error = await CacheHelper.getCachedString(kErrorLog);
        if (state.approveFail ?? false) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Failed',
              content: error ?? 'Something went wrong while trying to accept tasker. Please try again!',
              onTap: () {
                context.read<TaskEntityServiceBloc>().add(
                      ResetApproveFailureStatus(),
                    );
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
                context.read<TaskEntityServiceBloc>().add(ResetApproveSuccessStatus());
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
              content: error ?? 'Something went wrong while trying to reject tasker. Please try again!',
              onTap: () {
                context.read<TaskEntityServiceBloc>().add(ResetRejectFailureStatus());
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
                context.read<TaskEntityServiceBloc>().add(ResetRejectSuccessStatus());
                Navigator.pop(context);
              },
              isSuccess: true,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          return Scaffold(
            appBar: CustomAppBar(
              appBarTitle: state.taskEntityService.title ?? '',
              trailingWidget: SizedBox(),
            ),
            body: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<TaskEntityServiceBloc>().add(
                            TaskEntityServiceSingleLoaded(
                              id: state.taskEntityService.id ?? '',
                            ),
                          );
                    },
                    child: ListView(
                      padding: EdgeInsets.only(left: 10),
                      children: [
                        ProfileDetailSection(state: state),
                        _buildEvent(state),
                        if (state.taskEntityService.highlights?.isNotEmpty ?? false) ...[
                          addVerticalSpace(16),
                          RequirementSection(
                            requirementList: state.taskEntityService.highlights ?? [],
                          ),
                        ],
                        _buildMedia(state),

                        //! PAUSED AS SUGGESTED
                        // addVerticalSpace(16),
                        // AdditionalInfoSection(
                        //   location: state.taskEntityService.location,
                        //   startDate: state.taskEntityService.startDate == null
                        //       ? null
                        //       : '${DateFormat('MMMM dd, y').format(state.taskEntityService.startDate!)}',
                        //   startTime: state.taskEntityService.startTime,
                        //   endDate: state.taskEntityService.endDate == null
                        //       ? null
                        //       : '${DateFormat('MMMM dd, y').format(state.taskEntityService.endDate!)}',
                        //   endTime: state.taskEntityService.endTime,
                        //   views: state.taskEntityService.viewsCount.toString(),
                        // ),
                        // BlocBuilder<RatingReviewsBloc, RatingReviewState>(
                        //   builder: (context, ratingBloc) {
                        //     switch (ratingBloc.status) {
                        //       case RatingStatus.success:
                        //         return RatingReviewSection(
                        //           reviews: ratingBloc.ratingResponseDto,
                        //         );
                        //       case RatingStatus.failure:
                        //         return SizedBox();
                        //       default:
                        //         return SizedBox();
                        //     }
                        //   },
                        // ),

                        addVerticalSpace(16),
                        if ((state.taskEntityService.isBooked ?? false) &&
                            context.read<UserBloc>().state.taskerProfile?.user?.id !=
                                state.taskEntityService.createdBy?.id) ...[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: CustomElevatedButton(
                              callback: () {
                                _firebaseBloc
                                    .collection("userChats")
                                    .doc("${context.read<UserBloc>().state.taskerProfile?.user?.id}")
                                    .get()
                                    .then((value) {
                                  value.data()?.forEach((key, value) {
                                    if (value['userInfo']['uid'] == state.taskEntityService.createdBy?.id) {
                                      Navigator.pushNamed(
                                        context,
                                        ChatPage.routeName,
                                        arguments: ChatPersonDetails(
                                          groupName: key,
                                          fullName:
                                              "${state.taskEntityService.createdBy?.firstName ?? ''} ${state.taskEntityService.createdBy?.middleName ?? ''} ${state.taskEntityService.createdBy?.lastName ?? ''}",
                                          date: (value['date'] as Timestamp).toDate().toString(),
                                          id: state.taskEntityService.createdBy?.id,
                                          isRead: value['read'] as bool,
                                          lastMessage: '',
                                          profileImage: state.taskEntityService.createdBy?.profileImage ?? kHomaaleImg,
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
                        if (state.applicantModel?.result?.isNotEmpty ?? false) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Applicants',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          addVerticalSpace(10),
                          GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            crossAxisCount: 2,
                            children: List.generate(
                              state.applicantModel?.result?.length ?? 0,
                              (index) => TaskerCard(
                                onFavouriteTapped: () => {},
                                callback: () => showApplicantDetailsDialog(
                                  context: context,
                                  isNegotiable: state.taskEntityService.isNegotiable ?? false,
                                  profileImage:
                                      state.applicantModel?.result?[index].createdBy?.profileImage ?? kHomaaleImg,
                                  label:
                                      '${state.applicantModel?.result?[index].createdBy?.user?.firstName ?? ''} ${state.applicantModel?.result?[index].createdBy?.user?.lastName ?? ''}',
                                  happyClients:
                                      '${state.applicantModel?.result?[index].createdBy?.stats?.happyClients?.toInt() ?? '0'}',
                                  successRate:
                                      '${state.applicantModel?.result?[index].createdBy?.stats?.successRate?.toInt() ?? '0'}',
                                  rating: '${state.applicantModel?.result?[index].createdBy?.stats?.userReviews}',
                                  designation: state.applicantModel?.result?[index].createdBy?.designation,
                                  isProfileVerified:
                                      state.applicantModel?.result?[index].createdBy?.isProfileVerified ?? false,
                                  title: state.taskEntityService.title ?? '',
                                  budget:
                                      '${state.applicantModel?.result?[index].currency}. ${state.applicantModel?.result?[index].earning}',
                                  status: state.applicantModel?.result?[index].status,
                                  onRejectPressed: () {
                                    context.read<TaskEntityServiceBloc>().add(
                                          TaskRejectPeople(
                                            rejectReq: RejectReq(booking: state.applicantModel?.result?[index].id ?? 0),
                                          ),
                                        );
                                    Navigator.pop(context);
                                  },
                                  onApprovePressed: () {
                                    context.read<TaskEntityServiceBloc>().add(
                                          TaskEntityServiceApprovePeople(
                                            approveReq: ApproveReq(
                                              booking: state.applicantModel?.result?[index].id ?? 0,
                                            ),
                                          ),
                                        );
                                    Navigator.pop(context);
                                  },
                                  onNegotiatePressed: () async {
                                    context.read<BookingsBloc>().add(
                                          BookingSingleLoaded(
                                            state.applicantModel?.result?[index].id ?? 0,
                                          ),
                                        );
                                    final _singleBookingResult = context.read<BookingsBloc>().state.result;

                                    if (_singleBookingResult.isAccepted == false) {
                                      context.read<tb.TaskBloc>().add(
                                            tb.ChangeTaskNegotiationStatus(
                                              id: state.applicantModel?.result?[index].id ?? 0,
                                            ),
                                          );
                                    }
                                    final chatBloc = locator<ChatBloc>();
                                    chatBloc.add(HandleUserCreationChat(
                                      userID: context.read<UserBloc>().state.taskerProfile?.user?.id,
                                      taskerID: state.applicantModel?.result?[index].createdBy!.user!.id,
                                    ));
                                    await Future.delayed(
                                      Duration(seconds: 2),
                                      () => _firebaseBloc
                                          .collection("userChats")
                                          .doc("${context.read<UserBloc>().state.taskerProfile?.user?.id}")
                                          .get()
                                          .then((value) {
                                        value.data()?.forEach((key, v) {
                                          if (v.toString().contains(
                                              "${state.applicantModel?.result?[index].createdBy!.user!.id}")) {
                                            Navigator.pushReplacementNamed(
                                              context,
                                              ChatPage.routeName,
                                              arguments: ChatPersonDetails(
                                                groupName: key,
                                                fullName:
                                                    state.applicantModel?.result?[index].createdBy!.user!.fullName,
                                                // // "${state.taskEntityService.createdBy?.firstName ?? ''} ${state.taskEntityService.createdBy?.middleName ?? ''} ${state.taskEntityService.createdBy?.lastName ?? ''}",
                                                date: (v['date'] as Timestamp).toDate().toString(),
                                                id: state.applicantModel?.result?[index].createdBy!.user!.id,
                                                isRead: v['read'] as bool,
                                                lastMessage: '',
                                                profileImage:
                                                    state.applicantModel?.result?[index].createdBy!.profileImage ??
                                                        kHomaaleImg,
                                              ),
                                            );
                                          }
                                        });
                                      }),
                                    );
                                  },
                                ),
                                callbackLabel: 'View Details',
                                networkImageUrl:
                                    state.applicantModel?.result?[index].createdBy?.profileImage ?? kHomaaleImg,
                                happyClients:
                                    '${state.applicantModel?.result?[index].createdBy?.stats?.happyClients?.toInt() ?? '0'}',
                                rewardPercentage:
                                    '${state.applicantModel?.result?[index].createdBy?.stats?.successRate?.toInt() ?? '0'}',
                                label:
                                    '${state.applicantModel?.result?[index].createdBy?.user?.firstName ?? ''} ${state.applicantModel?.result?[index].createdBy?.user?.lastName ?? ''}',
                                designation: state.applicantModel?.result?[index].createdBy?.designation,
                                rate:
                                    '${state.applicantModel?.result?[index].currency}. ${state.applicantModel?.result?[index].price}',
                                ratings: '${state.applicantModel?.result?[index].createdBy?.stats?.userReviews}',
                                buttonWidth: 100,
                              ),
                            ),
                          ),
                        ],
                        _buildRecommendedServices(state),
                        _buildSimilarServices(state),
                      ],
                    ),
                  ),
                ),
                _buildPriceFooter(state, context),
              ],
            ),
          );
        } else {
          return CardLoading(
            height: 200,
          );
        }
      },
    );
  }

  RecommendedSimilarServices _buildRecommendedServices(TaskEntityServiceState state) {
    return RecommendedSimilarServices(
      isRecommended: true,
      recommend: state.recommendedSimilarDto.recommend,
    );
  }

  Padding _buildSimilarServices(TaskEntityServiceState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: RecommendedSimilarServices(
        isRecommended: false,
        recommend: state.recommendedSimilarDto.similar,
      ),
    );
  }

  Widget _buildEvent(TaskEntityServiceState state) {
    return CacheHelper.isLoggedIn
        ? EventSection(
            taskEntityService: state.taskEntityService,
          )
        : SizedBox();
  }

  Visibility _buildPriceFooter(TaskEntityServiceState state, BuildContext context) {
    return Visibility(
      visible: state.taskEntityService.createdBy?.id != context.read<UserBloc>().state.taskerProfile?.user?.id,
      child: PriceBookFooterSection(
        bgColor: Colors.blue.shade200,
        isNegotiable: state.taskEntityService.isNegotiable ?? false,
        buttonLabel: getStatus('', isService: true)["status"] as String,
        buttonColor: getStatus('')["color"] as Color,
        price: state.taskEntityService.isRange ?? false
            ? "Rs. ${Decimal.parse(state.taskEntityService.payableFrom ?? '0.0')} - ${Decimal.parse(state.taskEntityService.payableTo ?? '0.0')}"
            : "Rs. ${Decimal.parse(state.taskEntityService.payableTo ?? '0.0')}",
        onPressed: () {
          if (!CacheHelper.isLoggedIn) {
            notLoggedInPopUp(context);
          }
          if (!CacheHelper.isLoggedIn) return;
          if (CacheHelper.isKycVerified == false) {
            notVerifiedPopup(context);
          }
          if (CacheHelper.isKycVerified == false) return;
          context.read<EventBloc>().add(
                EventLoaded(
                  id: state.taskEntityService.event?.id ?? 'Null Case',
                ),
              );
          Navigator.pushNamed(
            context,
            ServiceBookingPage.routeName,
          );
        },
      ),
    );
  }

  FutureBuilder<List<tes.Image>> _buildMedia(TaskEntityServiceState state) {
    return FutureBuilder(
      future: getMedias(state),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data?.length != 0) {
          List<tes.Image> mediaList = [];
          if (snapshot.data != null) mediaList.addAll(snapshot.data!);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(10),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  'Media',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.22,
                child: CarouselSlider.builder(
                  itemCount: mediaList.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.21,
                      margin: EdgeInsets.only(right: 32),
                      child: mediaList[index].mediaType?.toLowerCase() == 'mp4'
                          ? VideoPlayerWidget(
                              videoURL: (mediaList[index].media) ?? '',
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Image.network(
                                    mediaList[index].media.toString(),
                                    errorBuilder: (context, error, stackTrace) => Image.network(
                                      kHomaaleImg,
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height * 0.2,
                                      fit: BoxFit.cover,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * 0.2,
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
                      setState(
                        () {
                          _imageIndex = index;
                        },
                      );
                    },
                  ),
                ),
              ),
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
                          color: _imageIndex == ind ? Colors.amber : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        if (!snapshot.hasData || snapshot.hasError || snapshot.data?.length == 0)
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CustomFormField(
              label: "Media",
              textStyle: Theme.of(context).textTheme.bodyMedium,
              child: Center(
                child: Text("No media found."),
              ),
            ),
          );
        return CardLoading(
          height: 500,
        );
      },
    );
  }
}
