import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  static const String routeName = '/faq-page';
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: 'FAQs'),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://sandbox.homaale.com/FAQs")),
      ),
    );
  }
}
