import 'package:cipher/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class GoogleLogin extends StatelessWidget {
  static const routeName = "/google-login";
  const GoogleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      leadingWidget: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }
}
