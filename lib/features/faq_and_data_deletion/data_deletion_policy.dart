import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class DataDeletionPolicy extends StatelessWidget {
  static const String routeName = '/data-deletion-page';

  const DataDeletionPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: 'Data Deletion Policy',trailingWidget: SizedBox()),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse("https://sandbox.homaale.com/data-deletion-policy?mobile_app=true")),
      ),
    );
  }
}
