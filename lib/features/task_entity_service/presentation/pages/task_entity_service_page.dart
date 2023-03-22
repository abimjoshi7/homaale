// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/features/bookings/data/models/approve_req.dart';
import 'package:cipher/features/event/presentation/bloc/event_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/service_booking_page.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/sections/sections.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/presentation/pages/sections/packages_offers_section.dart';
import 'package:cipher/widgets/widgets.dart';

class TaskEntityServicePage extends StatefulWidget {
  static const String routeName = '/task_entity_service_page';
  const TaskEntityServicePage({super.key});

  @override
  State<TaskEntityServicePage> createState() => _TaskEntityServicePageState();
}

class _TaskEntityServicePageState extends State<TaskEntityServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TaskEntityServiceBloc, TaskEntityServiceState>(
        listener: (context, state) async {
          final error = await CacheHelper.getCachedString(kErrorLog);
          if (state.approveFail ?? false) {
            showDialog(
              context: context,
              builder: (context) => CustomToast(
                heading: 'Failed',
                content: error ?? 'Something went wrong while trying to accept tasker. Please try again!',
                onTap: () {
                  context.read<TaskEntityServiceBloc>().add(ResetApproveFailureStatus());
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
        },
        child: BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
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
                      padding: EdgeInsets.zero,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Image.network(
                                state.taskEntityService?.images?.length == 0
                                    ? kServiceImageNImg
                                    : state.taskEntityService?.images?.first.media.toString() ?? kServiceImageNImg,
                                fit: BoxFit.cover,
                              ),
                            ),
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
                                                  state.taskEntityService?.createdBy?.profileImage ??
                                                      kDefaultAvatarNImg,
                                                ),
                                              ),
                                            ),
                                          ),
                                          addHorizontalSpace(
                                            10,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.7,
                                                child: Text(
                                                  state.taskEntityService?.title ?? '',
                                                  style: kPurpleText16,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                "${state.taskEntityService?.createdBy?.firstName ?? ''}"
                                                " ${state.taskEntityService?.createdBy?.lastName ?? ''}",
                                                style: kLightBlueText14,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.red,
                                          ),
                                          kWidth10,
                                          GestureDetector(
                                            onTap: () {
                                              final box = context.findRenderObject() as RenderBox?;
                                              Share.share(
                                                "Share this Hommale with friends.",
                                                sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                                              );
                                            },
                                            child: const Icon(
                                              Icons.share,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  addVerticalSpace(10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconText(
                                        label: state.taskEntityService?.rating?.first.rating.toString() ?? '4.5',
                                        iconData: Icons.star_outlined,
                                        color: kColorAmber,
                                        size: 18,
                                      ),
                                      IconText(
                                        label:
                                            "${state.taskEntityService?.city?.name ?? ''}, ${state.taskEntityService?.city?.country?.name ?? ''}",
                                        iconData: Icons.location_on_outlined,
                                        size: 18,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                  addVerticalSpace(10),
                                  HtmlRemover(
                                      text: state.taskEntityService?.description ??
                                          'Root canal treatment (endodontics) is a dental procedure used to treat infection at the centre of a tooth. Root canal treatment is not painful and can save a tooth that might otherwise have to be removed completely.'),
                                  addHorizontalSpace(10),
                                  RequirementSection(
                                    requirementList: state.taskEntityService?.highlights ?? [],
                                  ),
                                  const Visibility(
                                    visible: false,
                                    child: PackagesOffersSection(),
                                  ),
                                  AdditionalInfoSection(),
                                  RatingReviewSection(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SimilarEntityServiceSection(),
                        addVerticalSpace(10),
                        if (state.applicantModel?.result?.isNotEmpty ?? false) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Taskers',
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
                                  callback: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          insetPadding: EdgeInsets.zero,
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.5,
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Hire ${state.applicantModel?.result?[index].createdBy?.user?.firstName ?? ''} ${state.applicantModel?.result?[index].createdBy?.user?.lastName ?? ''}?',
                                                  style: kText20,
                                                ),
                                                addVerticalSpace(32),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Cancel'),
                                                    ),
                                                    addHorizontalSpace(16),
                                                    CustomElevatedButton(
                                                      theHeight: 30,
                                                      theWidth: 100,
                                                      callback: () {
                                                        context.read<TaskEntityServiceBloc>().add(
                                                            TaskEntityServiceApprovePeople(
                                                                approveReq: ApproveReq(
                                                                    booking:
                                                                        state.applicantModel?.result?[index].id ?? 0)));
                                                        Navigator.pop(context);
                                                      },
                                                      label: 'Accept',
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  networkImageUrl:
                                      state.applicantModel?.result?[index].createdBy?.profileImage ?? kServiceImageNImg,
                                  happyClients:
                                      '${state.applicantModel?.result?[index].createdBy?.stats?.happyClients?.toInt() ?? '0'}',
                                  rewardPercentage:
                                      '${state.applicantModel?.result?[index].createdBy?.stats?.successRate?.toInt() ?? '0'}',
                                  label:
                                      '${state.applicantModel?.result?[index].createdBy?.user?.firstName ?? ''} ${state.applicantModel?.result?[index].createdBy?.user?.lastName ?? ''}',
                                  designation: state.applicantModel?.result?[index].createdBy?.designation,
                                  rate:
                                      'Rs. ${state.applicantModel?.result?[index].budgetFrom ?? 0} - ${state.applicantModel?.result?[index].budgetTo ?? 0}',
                                  ratings:
                                      '${state.applicantModel?.result?[index].createdBy?.stats?.avgRating?.toStringAsFixed(2) ?? '0'} (${state.applicantModel?.result?[index].createdBy?.stats?.userReviews})',
                                ),
                              ),
                            ),
                          ),
                        ],
                        PriceBookFooterSection(
                          buttonLabel: getStatus('')["status"] as String,
                          buttonColor: getStatus('')["color"] as Color,
                          price: "Rs. ${state.taskEntityService?.budgetTo}",
                          onPressed: () {
                            print(123);
                            context.read<EventBloc>().add(
                                  EventRetrieveInitiated(
                                    id: state.taskEntityService?.event?.id ?? 'Null Case',
                                  ),
                                );
                            Navigator.pushNamed(
                              context,
                              ServiceBookingPage.routeName,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: LinearProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
