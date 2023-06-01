import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/archive/presentation/bloc/archive_task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CustomArchivePopup extends StatelessWidget {
  final String id;
  const CustomArchivePopup({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 8,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment:CrossAxisAlignment.start ,
        children: [
          Text(
            "Archive this Task?",
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          addVerticalSpace(8),
          Text(
            "Archive task if you do not need this task to be done again.",
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SizedBox(
                height: 35,
                width: 100,
                child: CustomElevatedButton(
                  callback: () {
                    Navigator.pop(context);
                  },
                  label: "Cancel",
                  mainColor: Colors.white,
                  textColor: kColorPrimary,
                  borderColor: kColorPrimary,
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 35,
                width: 100,
                child: CustomElevatedButton(
                  callback: () {
                    context.read<ArchiveTaskEntityServiceBloc>().add(
                          ArchiveTaskInitiated(id: id),
                        );
                    Navigator.pop(context);
                  },
                  label: "Archive",
                ),
              ),
            ),
          ],
        ),
        addVerticalSpace(5),
      ],
    );
  }
}
