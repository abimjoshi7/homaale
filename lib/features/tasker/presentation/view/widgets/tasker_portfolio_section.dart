import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/core/constants/text.dart';
import 'package:cipher/features/tasker/data/models/tasker_list_res.dart' as tsklst;
import 'package:flutter/material.dart';

class TaskerPortfolioSection extends StatelessWidget {
  const TaskerPortfolioSection({super.key, required this.portfolio});

  final List<tsklst.Portfolio> portfolio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Portfolio',
              style: kText17,
            ),
            addVerticalSpace(16),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.175,
              child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: portfolio.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 183,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width * 0.54,
                            child: Image.network(
                              portfolio[index].images?.first.media.toString() ?? kServiceImageNImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${portfolio[index].title}'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => addHorizontalSpace(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
