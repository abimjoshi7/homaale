// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/features/bookings/data/models/approve_req.dart';
import 'package:cipher/features/bookings/presentation/pages/service_booking_page.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/sections/event_section.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/sections/sections.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/locator.dart';
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

  @override
  void initState() {
    super.initState();
    user.add(
      UserLoaded(),
    );
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
        },
        builder: (context, state) {
          if (state.theStates == TheStates.success) {
            return Column(
              children: [
                addVerticalSpace(50),
                CustomHeader(
                  child: Text(state.taskEntityService?.title ?? ''),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(8),
                    children: [
                      ProfileDetailSection(state: state),
                      EventSection(
                        taskEntityService:
                            state.taskEntityService ?? TaskEntityService(),
                        user: user,
                      ),
                      // ScheduleSection(
                      //   taskEntityServiceState: state,
                      //   userState: user.state,
                      // ),
                      if (state.taskEntityService?.highlights?.isNotEmpty ??
                          false) ...[
                        RequirementSection(
                          requirementList:
                              state.taskEntityService?.highlights ?? [],
                        ),
                      ],
                      // const Visibility(
                      //   visible: false,
                      //   child: PackagesOffersSection(),
                      // ),
                      AdditionalInfoSection(),
                      RatingReviewSection(),
                      SimilarEntityServiceSection(),
                      addVerticalSpace(10),
                      if (state.applicantModel?.result?.isNotEmpty ??
                          false) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Text(
                            'Applicants',
                            style: kPurpleText16,
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
                                callback: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CustomToast(
                                        heading:
                                            'Are you sure you want to hire?',
                                        content:
                                            'Do you want to hire ${state.applicantModel?.result?[index].createdBy?.user?.firstName ?? ''} ${state.applicantModel?.result?[index].createdBy?.user?.lastName ?? ''} for your task.',
                                        onTap: () {
                                          context
                                              .read<TaskEntityServiceBloc>()
                                              .add(TaskEntityServiceApprovePeople(
                                                  approveReq: ApproveReq(
                                                      booking: state
                                                              .applicantModel
                                                              ?.result?[index]
                                                              .id ??
                                                          0)));
                                          Navigator.pop(context);
                                        },
                                        isSuccess: true,
                                      );
                                    },
                                  );
                                },
                                callbackLabel: 'Approve',
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
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Visibility(
                  visible: state.taskEntityService?.createdBy?.id !=
                      user.state.taskerProfile?.user?.id,
                  child: PriceBookFooterSection(
                    buttonLabel: getStatus('')["status"] as String,
                    buttonColor: getStatus('')["color"] as Color,
                    price: "Rs. ${state.taskEntityService?.budgetTo}",
                    onPressed: () {
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
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
