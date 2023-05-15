import 'package:flutter/material.dart';

import '../../../../widgets/custom_app_bar.dart';

class BookingCancelPage extends StatelessWidget {
  static const routeName = '/booking-cancel';

  const BookingCancelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Reason For Cancellation',trailingWidget: SizedBox(),
      ),
    );
  }
}

