// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/features/bookings/data/models/approve_req.dart';
import 'package:cipher/features/bookings/data/models/reject_req.dart';
import 'package:cipher/features/bookings/presentation/pages/service_booking_page.dart';
import 'package:cipher/features/chat/models/chat_person_details.dart';
import 'package:cipher/features/chat/view/chat_page.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart'
    as tes;
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/sections/event_section.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/sections/sections.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/applicants_information_dialog.dart';
import 'package:dependencies/dependencies.dart';
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
  late final user = locator<UserBloc>();
  int _imageIndex = 0;

  @override
  void initState() {
    super.initState();
    user.add(UserLoaded());
  }

  @override
  void dispose() {
    user.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TaskEntityServiceBloc, TaskEntityServiceState>(
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
                  context
                      .read<TaskEntityServiceBloc>()
                      .add(ResetApproveFailureStatus());
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
                  context
                      .read<TaskEntityServiceBloc>()
                      .add(ResetApproveSuccessStatus());
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
                  context
                      .read<TaskEntityServiceBloc>()
                      .add(ResetRejectFailureStatus());
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
                  context
                      .read<TaskEntityServiceBloc>()
                      .add(ResetRejectSuccessStatus());
                  Navigator.pop(context);
                },
                isSuccess: true,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.theStates == TheStates.success) {
            final List<tes.Image> mediaList = [
              ...state.taskEntityService?.images ?? [],
              ...state.taskEntityService?.videos ?? [],
            ];
            return Column(
              children: [
                addVerticalSpace(50),
                CustomHeader(
                  child: Text(state.taskEntityService?.title ?? ''),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<TaskEntityServiceBloc>().add(
                            TaskEntityServiceSingleLoaded(
                              id: state.taskEntityService?.id ?? '',
                            ),
                          );
                    },
                    child: ListView(
                      padding: EdgeInsets.all(8),
                      children: [
                        ProfileDetailSection(state: state),
                        EventSection(
                          taskEntityService: state.taskEntityService ??
                              tes.TaskEntityService(),
                          user: user,
                        ),
                        if (state.taskEntityService?.highlights?.isNotEmpty ??
                            false) ...[
                          RequirementSection(
                            requirementList:
                                state.taskEntityService?.highlights ?? [],
                          ),
                        ],
                        AdditionalInfoSection(),
                        RatingReviewSection(),
                        if (mediaList.isNotEmpty) ...[
                          addVerticalSpace(10),
                          Text(
                            'Media',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.21,
                            child: CarouselSlider.builder(
                              itemCount: mediaList.length,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  margin: EdgeInsets.only(right: 32),
                                  child: mediaList[index].mediaType == 'mp4'
                                      ? VideoPlayerWidget(
                                          videoURL: mediaList[index].media ??
                                              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                                        )
                                      : Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                mediaList[index]
                                                    .media
                                                    .toString(),
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.network(
                                                  kServiceImageNImg,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2,
                                                  fit: BoxFit.cover,
                                                ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
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
                        SimilarEntityServiceSection(),
                        addVerticalSpace(16),
                        if ((state.taskEntityService?.isBooked ?? false) &&
                            user.state.taskerProfile?.user?.id !=
                                state.taskEntityService?.createdBy?.id) ...[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: CustomElevatedButton(
                              callback: () {
                                locator<FirebaseFirestore>()
                                    .collection("userChats")
                                    .doc(
                                        "${user.state.taskerProfile?.user?.id}")
                                    .get()
                                    .then((value) {
                                  value.data()?.forEach((key, value) {
                                    if (value['userInfo']['uid'] ==
                                        state
                                            .taskEntityService?.createdBy?.id) {
                                      Navigator.pushNamed(
                                        context,
                                        ChatPage.routeName,
                                        arguments: ChatPersonDetails(
                                          groupName: key,
                                          fullName:
                                              "${state.taskEntityService?.createdBy?.firstName ?? ''} ${state.taskEntityService?.createdBy?.middleName ?? ''} ${state.taskEntityService?.createdBy?.lastName ?? ''}",
                                          date: (value['date'] as Timestamp)
                                              .toDate()
                                              .toString(),
                                          id: state
                                              .taskEntityService?.createdBy?.id,
                                          isRead: value['read'] as bool,
                                          lastMessage: '',
                                          profileImage: state.taskEntityService
                                                  ?.createdBy?.profileImage ??
                                              kServiceImageNImg,
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
                        if (state.applicantModel?.result?.isNotEmpty ??
                            false) ...[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Applicants',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          addVerticalSpace(10),
                          SizedBox(
                            height: 500,
                            child: GridView.count(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              crossAxisCount: 2,
                              children: List.generate(
                                state.applicantModel?.result?.length ?? 0,
                                (index) => TaskerCard(
                                  onFavouriteTapped: () => {},
                                  callback: () => showApplicantDetailsDialog(
                                    context: context,
                                    profileImage: state
                                            .applicantModel
                                            ?.result?[index]
                                            .createdBy
                                            ?.profileImage ??
                                        kServiceImageNImg,
                                    label:
                                        '${state.applicantModel?.result?[index].createdBy?.user?.firstName ?? 'Harry'} ${state.applicantModel?.result?[index].createdBy?.user?.lastName ?? 'Smith'}',
                                    happyClients:
                                        '${state.applicantModel?.result?[index].createdBy?.stats?.happyClients?.toInt() ?? '0'}',
                                    successRate:
                                        '${state.applicantModel?.result?[index].createdBy?.stats?.successRate?.toInt() ?? '0'}',
                                    rating:
                                        '${state.applicantModel?.result?[index].createdBy?.stats?.avgRating?.toStringAsFixed(2) ?? '0'} (${state.applicantModel?.result?[index].createdBy?.stats?.userReviews})',
                                    designation: state.applicantModel
                                        ?.result?[index].createdBy?.designation,
                                    isProfileVerified: state
                                            .applicantModel
                                            ?.result?[index]
                                            .createdBy
                                            ?.isProfileVerified ??
                                        false,
                                    title: state.taskEntityService?.title ?? '',
                                    budget:
                                        'Rs. ${state.applicantModel?.result?[index].budgetFrom ?? 0} - ${state.applicantModel?.result?[index].budgetTo ?? 0}',
                                    status: state
                                        .applicantModel?.result?[index].status,
                                    onRejectPressed: () {
                                      context.read<TaskEntityServiceBloc>().add(
                                            TaskRejectPeople(
                                              rejectReq: RejectReq(
                                                  booking: state.applicantModel
                                                          ?.result?[index].id ??
                                                      0),
                                            ),
                                          );
                                      Navigator.pop(context);
                                    },
                                    onApprovePressed: () {
                                      context.read<TaskEntityServiceBloc>().add(
                                          TaskEntityServiceApprovePeople(
                                              approveReq: ApproveReq(
                                                  booking: state.applicantModel
                                                          ?.result?[index].id ??
                                                      0)));
                                      Navigator.pop(context);
                                    },
                                  ),
                                  // callback: () {
                                  //   showDialog(
                                  //     context: context,
                                  //     builder: (context) {
                                  //       return CustomToast(
                                  //         heading: 'Are you sure you want to hire?',
                                  //         content:
                                  //             'Do you want to hire ${state.applicantModel?.result?[index].createdBy?.user?.firstName ?? ''} ${state.applicantModel?.result?[index].createdBy?.user?.lastName ?? ''} for your task.',
                                  //         onTap: () {
                                  //           context.read<TaskEntityServiceBloc>().add(TaskEntityServiceApprovePeople(
                                  //               approveReq:
                                  //                   ApproveReq(booking: state.applicantModel?.result?[index].id ?? 0)));
                                  //           Navigator.pop(context);
                                  //         },
                                  //         isSuccess: true,
                                  //       );
                                  //     },
                                  //   );
                                  // },
                                  callbackLabel: 'View Details',
                                  networkImageUrl: state
                                          .applicantModel
                                          ?.result?[index]
                                          .createdBy
                                          ?.profileImage ??
                                      kServiceImageNImg,
                                  happyClients:
                                      '${state.applicantModel?.result?[index].createdBy?.stats?.happyClients?.toInt() ?? '0'}',
                                  rewardPercentage:
                                      '${state.applicantModel?.result?[index].createdBy?.stats?.successRate?.toInt() ?? '0'}',
                                  label:
                                      '${state.applicantModel?.result?[index].createdBy?.user?.firstName ?? ''} ${state.applicantModel?.result?[index].createdBy?.user?.lastName ?? ''}',
                                  designation: state.applicantModel
                                      ?.result?[index].createdBy?.designation,
                                  rate:
                                      'Rs. ${state.applicantModel?.result?[index].budgetFrom ?? 0} - ${state.applicantModel?.result?[index].budgetTo ?? 0}',
                                  ratings:
                                      '${state.applicantModel?.result?[index].createdBy?.stats?.avgRating?.toStringAsFixed(2) ?? '0'} (${state.applicantModel?.result?[index].createdBy?.stats?.userReviews})',
                                  buttonWidth: 100,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: state.taskEntityService?.createdBy?.id !=
                      user.state.taskerProfile?.user?.id,
                  child: PriceBookFooterSection(
                    buttonLabel: getStatus('')["status"] as String,
                    buttonColor: getStatus('')["color"] as Color,
                    price: "Rs. ${Decimal.parse(state.taskEntityService?.budgetTo ?? '0.0')}",
                    onPressed: () {
                      if (!CacheHelper.isLoggedIn) {
                        notLoggedInPopUp(context);
                      }
                      if (!CacheHelper.isLoggedIn) return;
                      context.read<EventBloc>().add(
                            EventLoaded(
                              id: state.taskEntityService?.event?.id ??
                                  'Null Case',
                            ),
                          );
                      Navigator.pushNamed(
                        context,
                        ServiceBookingPage.routeName,
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CardLoading(
                height: 200,
              ),
            );
          }
        },
      ),
    );
  }
}
