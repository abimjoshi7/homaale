import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/security_question/presentation/bloc/security_bloc.dart';
import 'package:cipher/features/security_question/presentation/bloc/security_event.dart';
import 'package:cipher/features/security_question/presentation/bloc/security_state.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_drop_down_field.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_form_field.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../../widgets/custom_toast.dart';

class SecurityModalSheet extends StatefulWidget {
  const SecurityModalSheet({
    super.key,
  });

  @override
  State<SecurityModalSheet> createState() => _SecurityModalSheetState();
}

class _SecurityModalSheetState extends State<SecurityModalSheet> {
  final question = TextEditingController();
  final answer = TextEditingController();
  final _key = GlobalKey<FormState>();
  String? otpValue;
  int? currentIndex;

  @override
  void dispose() {
    question.dispose();
    answer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecurityBloc, SecurityState>(builder: (context, state) {
      if (state.theState == TheStates.success) {
        return SizedBox(
          height: 380,
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Security Questions',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                CustomFormField(
                  label: "Category",
                  isRequired: true,
                  child: CustomDropDownField(
                    validator: (p0) =>
                        question.text.isEmpty ? "Required Field" : null,
                    onChanged: (p0) => setState(
                      () {
                        final options = state.securityQuestionReq?.firstWhere(
                          (element) => p0 == element.question,
                        );
                        question.text = options?.question ?? "";
                      },
                    ),
                    list: List.generate(
                      state.securityQuestionReq?.length ?? 0,
                      (index) {
                        currentIndex = index;
                        return state.securityQuestionReq?[index].question ?? "";
                      },
                    ),
                    hintText: "Select a question category",
                  ),
                ),
                CustomFormField(
                  label: 'Answer',
                  isRequired: true,
                  child: CustomTextFormField(
                    maxLines: 3,
                    validator: validateNotEmpty,
                    controller: answer,
                    onSaved: (p0) => setState(
                      () {
                        answer.text = p0!;
                      },
                    ),
                    hintText: 'Write your answer...',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                addVerticalSpace(10),
                CustomElevatedButton(
                  callback: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      context.read<SecurityBloc>().add(SecurityAnswerPost(
                          id: state.securityQuestionReq?[currentIndex!].id ?? 0,
                          answer: answer.text));

                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.pop(context);
                      });
                      // if (state.securityAnswerRes?.answer == answer.text)
                      //   showDialog(
                      //       context: context,
                      //       builder: (context) => CustomToast(
                      //             heading: 'Success',
                      //             content: 'Security Question is added',
                      //             onTap: () {
                      //               Navigator.pop(context);
                      //             },
                      //             isSuccess: true,
                      //           ));
                    }
                  },
                  label: 'Submit',
                ),
                CustomElevatedButton(
                  borderColor: kColorPrimary,
                  mainColor: Colors.white,
                  textColor: kColorPrimary,
                  callback: () {
                    Navigator.pop(context);
                  },
                  label: 'Cancel',
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
