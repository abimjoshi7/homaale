import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/validations.dart';
import '../../../../widgets/custom_drop_down_field.dart';
import '../../../../widgets/custom_form_field.dart';
import '../../../../widgets/custom_text_form_field.dart';

class CommonReportPage extends StatefulWidget {
  static const routeName = 'report-problem';
  const CommonReportPage({Key? key}) : super(key: key);

  @override
  State<CommonReportPage> createState() => _CommonReportPageState();
}

class _CommonReportPageState extends State<CommonReportPage> {
  final otherController = TextEditingController();
  final specifyController = TextEditingController();
  final detailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Help & Legal',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormField(
              label: 'Report a problem',
              // isRequired: true,
              // child: CustomDropDownField<String?>(
              //   onChanged: (p0) => setState(
              //         () {
              //       // final options = state.list.firstWhere(
              //       //       (element) => p0 == element.name,
              //       // );
              //       // subjectController.text = options.name!;
              //     },
              //   ),
              //   list: List.generate(
              //     state.list.length,
              //         (index) => state.list[index].name,
              //   ),
              //   hintText: "Subject",
              // ),
            ),
            addVerticalSpace(10),
            CustomFormField(
              label: 'Please Specify',
              isRequired: true,
              // child: CustomDropDownField<String?>(
              //   onChanged: (p0) => setState(
              //         () {
              //       // final options = state.list.firstWhere(
              //       //       (element) => p0 == element.name,
              //       // );
              //       // subjectController.text = options.name!;
              //     },
              //   ),
              //   list: List.generate(
              //     state.list.length,
              //         (index) => state.list[index].name,
              //   ),
              //   hintText: "Subject",
              // ),
            ),
            addVerticalSpace(10),
            CustomFormField(
              label: 'Problem Detail',
              isRequired: true,
              child: CustomTextFormField(
                maxLines: 3,
                validator: validateNotEmpty,
                controller: detailController,
                onSaved: (p0) => setState(
                  () {
                    detailController.text = p0!;
                  },
                ),
                hintText: 'If you have any problem please write here...',
                hintStyle: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
