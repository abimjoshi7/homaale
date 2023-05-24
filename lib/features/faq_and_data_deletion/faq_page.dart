import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  static const String routeName = '/faq-page';

  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: 'FAQs'),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://sandbox.homaale.com/FAQs?mobile=true")),
      ),
    );
  }
}
