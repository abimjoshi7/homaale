import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/tasker/presentation/view/tasker.dart';
import 'package:cipher/features/user/data/models/tasker_profile.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskerProfileSearchTile extends StatelessWidget {
  final TaskerProfile taskerProfile;
  const TaskerProfileSearchTile({super.key, required this.taskerProfile});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<TaskerCubit>().loadSingleTasker(
              taskerProfile.user!.id ?? "",
            );
        context.read<TaskerCubit>().loadSingleTaskerServices(
              taskerProfile.user!.id ?? "",
            );
        context.read<TaskerCubit>().loadSingleTaskerTask(
              taskerProfile.user!.id ?? "",
            );
        context.read<TaskerCubit>().loadSingleTaskerReviews(
              taskerProfile.user!.id ?? "",
            );

        Navigator.pushNamed(
          context,
          TaskerProfileView.routeName,
        );
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
      minLeadingWidth: MediaQuery.of(context).size.width,
      leading: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Icon(
            CupertinoIcons.search,
            // color: kColorDarkGrey,
            size: 24,
          ),
          addHorizontalSpace(10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                taskerProfile.fullName.toString(),
                style:Theme.of(context).textTheme.bodySmall,
                // kText14.copyWith(
                //   fontWeight: FontWeight.w400,
                // ),
              ),
              Text(
                "${taskerProfile.designation}",
                style: kLightBlueText12.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 50.0,
                height: 15.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.redAccent.withOpacity(0.9),
                  shape: BoxShape.rectangle,
                ),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: Icon(
        CupertinoIcons.arrow_up_left,
        size: 24,
        // color: kColorDarkGrey,
      ),
    );
  }
}
