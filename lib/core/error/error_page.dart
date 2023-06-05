import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  static const routeName = '/error-page';
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: 'Error Page',trailingWidget: SizedBox()),
      body: Column(
        children: [
          addVerticalSpace(20),
          Image.asset('assets/page_not_found.png'),
          addVerticalSpace(20),
          Text("Oops!", style: Theme.of(context).textTheme.headlineSmall),
          Text("Page not found",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: 16)),
          Text(
              "We’re sorry, the page you requested could not found."
              "Please go back to the homepage !",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey, fontSize: 12)),
          CustomElevatedButton(
            callback: () {
              Navigator.pushNamed(
                context,
                Root.routeName,
              );
            },
            label: 'Go Home',
          ),
        ],
      ),
    );
  }
}
