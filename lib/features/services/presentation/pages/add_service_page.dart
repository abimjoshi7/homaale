import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddServicePage extends StatelessWidget {
  static const routeName = '/add-service-page';
  const AddServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight50,
        CustomHeader(
          leadingWidget: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          trailingWidget: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          child: Text('Add Service'),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [Text('data')],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
