import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/custom_app_bar.dart';

class HoroscopePage extends StatelessWidget {
  static const routeName = '/horoscope';

  const HoroscopePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Horoscope ',trailingWidget: SizedBox()
      ),
      body:  InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://sandbox.homaale.com/horoscope/nepali?mobile_app=true")),
      ),
    );
  }
}
