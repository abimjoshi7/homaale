import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task/presentation/pages/client_post_task_view.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TasksSuggestionSection extends StatelessWidget {
  const TasksSuggestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 400,
        width: double.infinity,
        child: Column(
          children: [
            SectionHeading(
              labelName: 'Tasks you may like',
              onTap: () {},
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ClientPostTaskViewPage.routeName,
                    );
                  },
                  child: const TaskCard(),
                ),
                separatorBuilder: (context, index) => kHeight10,
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
