import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class BookingsServiceCard extends StatelessWidget {
  final String serviceName;
  final String providerName;
  final Widget mainContentWidget;
  final String status;
  final Widget bottomLeftWidget;
  final Widget bottomRightWidget;
  final Color color;
  final double height;
  final Widget? topRightWidget;

  const BookingsServiceCard({
    super.key,
    required this.serviceName,
    required this.providerName,
    required this.status,
    this.bottomLeftWidget = const Text('View Detail'),
    this.color = const Color(0xfff98900),
    this.height = 250,
    this.topRightWidget = const SizedBox.shrink(),
    required this.mainContentWidget,
    required this.bottomRightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
        ),
        Positioned(
          left: 5,
          right: 0,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0.5, 0.5),
                  color: Colors.black12,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            serviceName,
                            style: kPurpleText16,
                          ),
                          Text(
                            providerName,
                            style: kLightBlueText14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  mainContentWidget,
                  const Divider(
                    thickness: 1.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      bottomLeftWidget,
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: bottomRightWidget,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: SizedBox(
            height: 90,
            width: 100,
            child: topRightWidget,
          ),
        ),
      ],
    );
  }
}
