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
      body: Column(
        children: [
          addVerticalSpace(
            50,
          ),
          const CustomHeader(
            label: 'Error',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(
            context,
            Root.routeName,
          );
        },
        label: const Text('Go Home'),
      ),
    );
  }
}
