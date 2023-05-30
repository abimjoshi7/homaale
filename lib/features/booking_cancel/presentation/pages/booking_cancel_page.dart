import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/booking_cancel/presentation/bloc/booking_cancel_bloc.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/const_info_list.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_check_box.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_form_field.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../content_client/presentation/pages/privacy_policy.dart';
import '../../../content_client/presentation/pages/terms_of_use.dart';
import '../bloc/booking_cancel_event.dart';
import '../bloc/booking_cancel_state.dart';

class BookingCancelPage extends StatefulWidget {
  static const routeName = '/booking-cancel';

  const BookingCancelPage({Key? key}) : super(key: key);

  @override
  State<BookingCancelPage> createState() => _BookingCancelPageState();
}

class _BookingCancelPageState extends State<BookingCancelPage> {
  final descriptionController = TextEditingController();
  String reason = "";
  int currentIndex = 0;
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final client = routeData?['client'] as String?;
    final booking = context.read<BookingsBloc>().state.bookingRes.status;
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Reason For Cancellation',
        trailingWidget: SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  color: Colors.orange.shade50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: kColorSecondary,
                        size: 20,
                      ),
                      Text(
                        ' There will be penalty for cancelling this task or service.',
                        style: TextStyle(
                            color: kColorSecondary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                if (client == 'client')
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: booking == 'On Progress'
                          ? BookingCancelReasonClientAfterTaskStartedList.length
                          : BookingCancelReasonClientList.length,
                      itemBuilder: (context, index) {
                        return booking == 'On Progress'
                            ? RadioListTile(
                                onChanged: (p0) => setState(
                                  () {
                                    final options =
                                        BookingCancelReasonClientAfterTaskStartedList
                                            .firstWhere(
                                      (element) => p0 == element,
                                    );
                                    reason = options;
                                    currentIndex = index;
                                    print(reason);
                                  },
                                ),
                                title: Text(
                                  BookingCancelReasonClientAfterTaskStartedList[
                                      index],
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                value:
                                    BookingCancelReasonClientAfterTaskStartedList[
                                        index],
                                groupValue:
                                    BookingCancelReasonClientAfterTaskStartedList[
                                        currentIndex],
                              )
                            : RadioListTile(
                                onChanged: (p0) => setState(
                                  () {
                                    final options =
                                        BookingCancelReasonClientList
                                            .firstWhere(
                                      (element) => p0 == element,
                                    );
                                    reason = options;
                                    currentIndex = index;
                                    print(reason);
                                  },
                                ),
                                title: Text(
                                  BookingCancelReasonClientList[index],
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                value: BookingCancelReasonClientList[index],
                                groupValue:
                                    BookingCancelReasonClientList[currentIndex],
                              );
                      }),
                if (client == 'merchant')
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: booking == 'On Progress'
                          ? BookingCancelReasonMerchantsAfterStartedList.length
                          : BookingCancelReasonMerchantsList.length,
                      itemBuilder: (context, index) {
                        return booking == 'On Progress '
                            ? RadioListTile(
                                onChanged: (p0) => setState(
                                  () {
                                    final options =
                                        BookingCancelReasonMerchantsAfterStartedList
                                            .firstWhere(
                                      (element) => p0 == element,
                                    );
                                    reason = options;
                                    currentIndex = index;
                                    print(reason);
                                  },
                                ),
                                title: Text(
                                  BookingCancelReasonMerchantsAfterStartedList[
                                      index],
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                value:
                                    BookingCancelReasonMerchantsAfterStartedList[
                                        index],
                                groupValue:
                                    BookingCancelReasonMerchantsAfterStartedList[
                                        currentIndex],
                              )
                            : RadioListTile(
                                onChanged: (p0) => setState(
                                  () {
                                    final options =
                                        BookingCancelReasonMerchantsList
                                            .firstWhere(
                                      (element) => p0 == element,
                                    );
                                    reason = options;
                                    currentIndex = index;
                                    print(reason);
                                  },
                                ),
                                title: Text(
                                  BookingCancelReasonMerchantsList[index],
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                value: BookingCancelReasonMerchantsList[index],
                                groupValue: BookingCancelReasonMerchantsList[
                                    currentIndex],
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  color: Colors.blue.shade50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                        size: 20,
                      ),
                      Text(
                        ' Refund will be initiated within Two Working Days.',
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  callback: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (isChecked == false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please agree to the terms and policy.',
                            ),
                          ),
                        );
                      } else {
                        print(
                            'booking Id : ${context.read<BookingsBloc>().state.bookingRes.booking}');
                        context.read<BookingCancelBloc>().add(CancelActionPost(
                            bookingId: context
                                    .read<BookingsBloc>()
                                    .state
                                    .bookingRes
                                    .booking ??
                                0,
                            reason: reason,
                            description: descriptionController.text));
                        Future.delayed(const Duration(seconds: 2), () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: BlocBuilder<BookingCancelBloc,
                                BookingCancelState>(builder: (context, stateM) {
                              return TheStates.success == stateM.theState
                                  ? Text('Cancel Successfully')
                                  : Text("Please Try Again!");
                            }),
                            duration: const Duration(seconds: 1),
                          ));
                          Navigator.pushNamed(context, Root.routeName);
                        });
                      }
                    }
                  },
                  label: 'Proceed to Cancel',
                ),
                addVerticalSpace(10),
                CustomElevatedButton(
                  callback: () {
                    Navigator.pop(context);
                  },
                  label: 'Close',
                  textColor: kColorPrimary,
                  mainColor: Colors.white,
                  borderColor: Theme.of(context).primaryColor,
                ),
              ]),
        ),
      ),
    );
  }
}

class CommonAgreePolicyPage extends StatefulWidget {
  final bool isChecked;
  const CommonAgreePolicyPage({Key? key, required this.isChecked})
      : super(key: key);

  @override
  State<CommonAgreePolicyPage> createState() => _CommonAgreePolicyPageState();
}

class _CommonAgreePolicyPageState extends State<CommonAgreePolicyPage> {
  // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 18,
            height: 18,
            child: CustomCheckBox(
              boxColor: Colors.blue,
              isChecked: widget.isChecked,
              onTap: () => setState(() {
                bool isChecked = widget.isChecked;
                isChecked = !widget.isChecked;
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
                        color: Colors.black, letterSpacing: 0.3, fontSize: 12),
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
                        color: Colors.black, letterSpacing: 0.3, fontSize: 12),
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
    );
  }
}
