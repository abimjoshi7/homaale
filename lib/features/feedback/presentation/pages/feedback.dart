import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/feedback/bloc/feedback_bloc.dart';
import 'package:cipher/features/feedback/bloc/feedback_post_bloc.dart';
import 'package:cipher/features/feedback/bloc/feedback_post_state.dart';
import 'package:cipher/features/feedback/bloc/feedback_state.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../bloc/feedback_post_event.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String? optionsName;
  final identityTypeController = TextEditingController();
  final feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedbackBloc, FeedbackState>(builder: (context, state) {
      if (state is FeedbackLoadSuccess) {
        return SizedBox(
          height: 350,
          child: Column(
            children: [
              Text(
                'Feedback Form',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              addVerticalSpace(10),
              Text('Are you enjoying Homaale ? Send us Your Feedbacks.'),
              addVerticalSpace(20),
              CustomFormField(
                label: 'Subject',
                isRequired: true,
                child: CustomDropDownField<String?>(
                  onChanged: (p0) => setState(
                    () {
                      final options = state.list.firstWhere(
                        (element) => p0 == element.name,
                      );
                      optionsName = options.name;
                    },
                  ),
                  list: List.generate(
                    state.list.length,
                    (index) => state.list[index].name,
                  ),
                  hintText: "Subject",
                ),
              ),
              addVerticalSpace(20),
              CustomFormField(
                label: 'Your feedback',
                isRequired: true,
                child: CustomTextFormField(
                  controller: feedbackController,
                  hintText:
                      'If you have any additional feedback please type it here...',
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                callback: () {
                  context.read<FeedbackPostBloc>().add(FeedbackPost(
                      subject: optionsName ?? "",
                      description: feedbackController.text));
                  Future.delayed(const Duration(seconds: 2), () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: BlocBuilder<FeedbackPostBloc, FeedbackPostState>(
                          builder: (context, stateM) {
                        return Text(stateM.feedbackPostModel?.message ?? "");
                      }),
                      duration: const Duration(seconds: 1),
                    ));
                    Navigator.pop(context);
                  });
                },
                label: 'Submit',
              ),
            ],
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
