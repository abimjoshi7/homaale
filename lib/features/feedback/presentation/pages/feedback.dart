import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/feedback/bloc/feedback_bloc.dart';
import 'package:cipher/features/feedback/bloc/feedback_post_bloc.dart';
import 'package:cipher/features/feedback/bloc/feedback_post_state.dart';
import 'package:cipher/features/feedback/bloc/feedback_state.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/validations.dart';
import '../../bloc/feedback_post_event.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final subjectController = TextEditingController();
  final feedbackController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedbackBloc, FeedbackState>(builder: (context, state) {
      if (state is FeedbackLoadSuccess) {
        return SizedBox(
          height: 350,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Feedback Form',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 30,
                  child: Text(
                      'Are you enjoying Homaale ? Send us Your Feedbacks.'),
                ),
                CustomFormField(
                  label: 'Subject',
                  isRequired: true,
                  child: CustomDropDownField<String?>(
                    onChanged: (p0) => setState(
                      () {
                        final options = state.list.firstWhere(
                          (element) => p0 == element.name,
                        );
                        subjectController.text = options.name!;
                      },
                    ),
                    list: List.generate(
                      state.list.length,
                      (index) => state.list[index].name,
                    ),
                    hintText: "Subject",
                  ),
                ),
                CustomFormField(
                  label: 'Your feedback',
                  isRequired: true,
                  child: CustomTextFormField(
                    maxLines: 3,
                    validator: validateNotEmpty,
                    controller: feedbackController,
                    onSaved: (p0) => setState(
                      () {
                        feedbackController.text = p0!;
                      },
                    ),
                    hintText:
                        'If you have any additional feedback please type it here...',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                addVerticalSpace(20),
                CustomElevatedButton(
                  callback: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<FeedbackPostBloc>().add(FeedbackPost(
                          subject: subjectController.text ?? "",
                          description: feedbackController.text));
                      Future.delayed(const Duration(seconds: 2), () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              BlocBuilder<FeedbackPostBloc, FeedbackPostState>(
                                  builder: (context, stateM) {
                            return Text(
                                stateM.feedbackPostModel?.message ?? "");
                          }),
                          duration: const Duration(seconds: 1),
                        ));
                        Navigator.pop(context);
                      });
                    }
                  },
                  label: 'Submit',
                ),
              ],
            ),
          ),
        );
      } else {
        return const CardLoading(height: 100);
      }
    });
  }
}
