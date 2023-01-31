import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ServiceProviderPage extends StatelessWidget {
  static const String routeName = '/service_provider_page';
  const ServiceProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {},
            ),
            trailingWidget: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            child: Text('Root Canal Treatment'),
          ),
          Divider(),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Divider(
            thickness: 2,
          ),

          // Row(
          //   children: [ListTile()],
          // )
        ],
      ),
    );
  }
}
