import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class BookingsServiceCard extends StatelessWidget {
  final String? serviceName;
  final String? providerName;
  final Widget? firstWidget;
  final Widget? secondWidget;
  final Widget? thirdWidget;
  final String? status;
  final Widget? bottomLeftWidget;
  final Widget? bottomRightWidget;
  final Widget? mainContentWidget;
  final Color? color;

  const BookingsServiceCard({
    super.key,
    this.serviceName,
    this.providerName,
    this.firstWidget,
    this.secondWidget,
    this.thirdWidget,
    this.status,
    this.bottomRightWidget,
    this.mainContentWidget,
    this.color = const Color(0xfff98900),
    this.bottomLeftWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
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
            height: 250,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            serviceName ?? '',
                            style: kPurpleText16,
                          ),
                          Text(
                            providerName ?? '',
                            style: kLightBlueText14,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_vert_rounded,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      mainContentWidget ?? SizedBox.shrink(),
                    ],
                  ),
                  thirdWidget ?? SizedBox.shrink(),
                  const Divider(
                    thickness: 1.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      bottomLeftWidget ??
                          Row(
                            children: [
                              const Text("Status :"),
                              kWidth5,
                              Chip(
                                backgroundColor: Colors.teal.shade100,
                                label: Text(status ?? ''),
                              )
                            ],
                          ),
                      bottomRightWidget ?? SizedBox.shrink()
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
