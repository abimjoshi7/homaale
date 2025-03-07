import 'package:cipher/core/constants/date_time_representation.dart';
import 'package:cipher/core/mixins/the_modal_bottom_sheet.dart';
import 'package:cipher/features/support/presentation/widgets/report_page.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/edit_task_entity_service_page.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/custom_favourite_icon.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';

import '../../../../support/presentation/bloc/support_ticket_type_options_bloc.dart';
import '../../../../support/presentation/bloc/support_ticket_type_options_event.dart';

class ProfileDetailSection extends StatelessWidget with TheModalBottomSheet {
  final TaskEntityServiceState state;
  const ProfileDetailSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        state.taskEntityService.createdBy?.profileImage ?? kDefaultAvatarNImg,
                      ),
                    ),
                  ),
                ),
                addHorizontalSpace(
                  10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        state.taskEntityService.title ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${state.taskEntityService.createdBy?.fullName ?? ''}",
                      // " ${state.taskEntityService.createdBy?.lastName ?? ''}",
                      style: kLightBlueText14,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                state.taskEntityService.createdBy?.id == context.read<UserBloc>().state.taskerProfile?.user?.id
                    ? SizedBox()
                    : CustomFavoriteIcon(
                        typeID: state.taskEntityService.id ?? '',
                        type: ServiceType.entityservice,
                        isBookmarked: state.taskEntityService.isBookmarked ?? false,
                      ),
                addHorizontalSpace(8),
                InkWell(
                  onTap: () {
                    showCustomBottomSheet(
                      context: context,
                      widget: Column(
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.redo_sharp,
                              color: Colors.blue,
                            ),
                            horizontalTitleGap: 4,
                            title: Text(
                              "Share",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              if (!CacheHelper.isLoggedIn) {
                                notLoggedInPopUp(context);
                              }
                              if (!CacheHelper.isLoggedIn) return;
                              final box = context.findRenderObject() as RenderBox?;
                              Share.share(
                                "$kShareLinks/services/${state.taskEntityService.id}",
                                subject: state.taskEntityService.title,
                                sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                              );
                            },
                          ),
                          Visibility(
                            visible: context.read<UserBloc>().state.taskerProfile?.user?.id !=
                                state.taskEntityService.createdBy?.id,
                            child: ListTile(
                              leading: Icon(
                                Icons.report,
                                color: kColorSecondary,
                              ),
                              horizontalTitleGap: 4,
                              title: Text(
                                'Report',
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                              onTap: () {
                                context
                                    .read<SupportTicketTypeOptionsBloc>()
                                    .add(SupportTicketTypeOptionsLoaded(target: 'entityservice'));
                                Navigator.pushNamed(
                                  context,
                                  CommonReportPage.routeName,
                                  arguments: {
                                    'isType': 'isTask',
                                    'model': 'entityservice',
                                    'objectId': state.taskEntityService.id
                                  },
                                );
                              },
                            ),
                          ),
                          Offstage(
                            offstage: context.read<UserBloc>().state.taskerProfile?.user?.id !=
                                state.taskEntityService.createdBy?.id,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) => Container(
                                        height: MediaQuery.of(context).size.height * 0.75,
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context).viewInsets.bottom,
                                            left: 8,
                                            right: 8,
                                            top: 8),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              EditTaskEntityServiceForm(
                                                id: state.taskEntityService.id,
                                                isRequested: false,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  leading: Icon(
                                    Icons.edit_outlined,
                                    color: kColorOrange,
                                  ),
                                  horizontalTitleGap: 4,
                                  title: Text(
                                    "Edit",
                                    style: Theme.of(context).textTheme.displayMedium,
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(
                                    Icons.delete,
                                    color: kColorSilver,
                                  ),
                                  horizontalTitleGap: 4,
                                  title: Text(
                                    "Remove",
                                    style: Theme.of(context).textTheme.displayMedium,
                                  ),
                                  onTap: () async {
                                    if (!CacheHelper.isLoggedIn) {
                                      notLoggedInPopUp(context);
                                    }
                                    if (!CacheHelper.isLoggedIn) return;
                                    context.read<TaskEntityServiceBloc>().add(
                                          TaskEntityServiceDeleted(
                                            id: state.taskEntityService.id ?? "",
                                          ),
                                        );
                                    await Future.delayed(
                                      Duration.zero,
                                      () => Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        Root.routeName,
                                        (route) => false,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Icon(
                    Icons.more_vert_rounded,
                  ),
                ),
              ],
            ),
          ],
        ),
        addVerticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                IconText(
                  label: state.taskEntityService.rating?.toString() ?? '',
                  iconData: Icons.star_outlined,
                  color: kColorAmber,
                  size: 18,
                ),
                addHorizontalSpace(8),
                IconText(
                  label: state.taskEntityService.bookedCount.toString(),
                  iconData: Icons.people,
                  color: Colors.blue,
                  size: 18,
                ),
              ],
            ),
            IconText(
              label:
                  "${state.taskEntityService.city?.name ?? ''}, ${state.taskEntityService.city?.country?.name ?? ''}",
              iconData: Icons.location_on_outlined,
              size: 18,
              color: Colors.red,
            ),
          ],
        ),
        addVerticalSpace(10),
        Text(
          'Created Date',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        addVerticalSpace(10),
        IconText(
          label:
              "Posted: ${DateFormat('hh:mm a - MMMM dd, y').format(state.taskEntityServiceRes?.createdAt ?? DateTime.now())}",
          iconData: Icons.calendar_month,
          size: 18,
          color: Colors.red,
        ),
        addVerticalSpace(10),
        if (state.taskEntityService.createdBy?.id == context.read<UserBloc>().state.taskerProfile?.user?.id)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price Details',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                state.taskEntityService.isRange ?? false
                    ? "Rs. ${Decimal.parse(state.taskEntityService.budgetFrom ?? '0.0')} - ${Decimal.parse(state.taskEntityService.budgetTo ?? '0.0')}"
                    : "Rs. ${Decimal.parse(state.taskEntityService.budgetTo ?? '0.0')}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        // addVerticalSpace(10),
        Text(
          'Problem Description',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        HtmlRemover(text: state.taskEntityService.description ?? ''),
        addHorizontalSpace(10),
      ],
    );
  }
}
