import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  static const routeName = '/categories-page';
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            kHeight50,
            CustomHeader(
              leadingWidget: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              trailingWidget: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                ),
              ),
              child: Text('Categories'),
            ),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 98,
                  color: const Color(0xffF7FAFF),
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Padding(
                    padding: kPadding20,
                    child: ListView.separated(
                      itemCount: 5,
                      itemBuilder: (context, index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CategoriesIcons(
                            data: 'data',
                          ),
                        ],
                      ),
                      separatorBuilder: (context, index) => kHeight20,
                      // children: [
                      //   Text('data'),
                      // ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 98,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Padding(
                    padding: kPadding20,
                    child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) =>
                          Card(child: ExpansionTile(title: Text('data'))),
                    ),
                  ),
                ),
              ],
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Container(
            //     height: MediaQuery.of(context).size.height - 98,
            //     color: Colors.red,
            //     width: MediaQuery.of(context).size.width * 0.25,
            //     child: ListView(
            //       children: [
            //         Text('data'),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
