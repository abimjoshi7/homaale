import 'package:cipher/core/constants/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/const_info_list.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/text.dart';
import '../../../../core/constants/validations.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_check_box.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_form_field.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../content_client/presentation/pages/privacy_policy.dart';
import '../../../content_client/presentation/pages/terms_of_use.dart';

class BookingCancelPage extends StatefulWidget {
  static const routeName = '/booking-cancel';

  const BookingCancelPage({Key? key}) : super(key: key);

  @override
  State<BookingCancelPage> createState() => _BookingCancelPageState();
}

class _BookingCancelPageState extends State<BookingCancelPage> {
  final descriptionController = TextEditingController();
  final reasonController = TextEditingController();
  bool isChecked = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Reason For Cancellation',
        trailingWidget: SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.blue.shade50,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.blue,
                  size: 20,
                ),
                Text(
                  ' There will be penalty for cancelling this task or service.',
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: BookingCancelReasonTypeList.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  onChanged: (p0) => setState(
                    () {
                      final options = BookingCancelReasonTypeList.firstWhere(
                        (element) => p0 == element,
                      );
                      reasonController.text = options;
                      currentIndex = index;
                    },
                  ),
                  title: Text(
                    BookingCancelReasonTypeList[index],
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  value: BookingCancelReasonTypeList[currentIndex],
                  groupValue: BookingCancelReasonTypeList[index],
                );
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomFormField(
              label: 'Please explain further ',
              isRequired: true,
              child: CustomTextFormField(
                maxLines: 3,
                validator: validateNotEmpty,
                controller: descriptionController,
                onSaved: (p0) => setState(
                  () {
                    descriptionController.text = p0!;
                  },
                ),
                hintText: 'Describe reason...',
                hintStyle: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 18,
                  height: 18,
                  child: CustomCheckBox(
                    boxColor: Colors.blue,
                    isChecked: isChecked,
                    onTap: () => setState(() {
                      isChecked = !isChecked;
                    }),
                  ),
                ),
                addHorizontalSpace(8),
                Flexible(
                  child: RichText(
                    strutStyle: const StrutStyle(fontFamily: 'Poppins'),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: 'agree to the ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                        TextSpan(
                          text: 'terms & Conditions',
                          style: kHeading3.copyWith(
                              color: Colors.black,
                              letterSpacing: 0.3,
                              fontSize: 12),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushNamed(
                                  context,
                                  TermsOfUsePage.routeName,
                                ),
                        ),
                        const TextSpan(
                          text: ' and ',
                        ),
                        TextSpan(
                          text: ' privacy policy.',
                          style: kHeading3.copyWith(
                              color: Colors.black,
                              letterSpacing: 0.3,
                              fontSize: 12),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushNamed(
                                  context,
                                  PrivacyPolicyPage.routeName,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            callback: () {},
            label: 'Proceed to Cancel',
          ),
          addVerticalSpace(10),
          CustomElevatedButton(
            callback: () {},
            label: 'Close',
            textColor: kColorPrimary,
            mainColor: Colors.white,
            borderColor: Theme.of(context).primaryColor,
          ),
        ]),
      ),
    );
  }
}
