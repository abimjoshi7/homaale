import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PackagesOffersCard extends StatelessWidget {
  final String name;
  final String rate;
  final String offerName;

  const PackagesOffersCard({
    super.key,
    required this.name,
    required this.rate,
    required this.offerName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 180,
      child: Card(
        child: Padding(
          padding: kPadding15,
          child: Column(
            children: [
              Text(name),
              const CustomModalSheetDrawerIcon(
                color: Colors.black,
              ),
              Text(
                rate,
                style: kPurpleText16,
              ),
              Text(
                offerName,
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 12,
                ),
              ),
              kHeight10,
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.circle,
                          size: 7,
                          color: Colors.blue,
                        ),
                        kWidth10,
                        Text('Filings')
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 7,
                          color: Colors.blue,
                        ),
                        kWidth10,
                        const Text('Filings')
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 7,
                          color: Colors.blue,
                        ),
                        kWidth10,
                        const Text('Filings')
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 7,
                          color: Colors.blue,
                        ),
                        kWidth10,
                        const Text('Filings')
                      ],
                    ),
                  ],
                ),
              ),
              kHeight20,
              SizedBox(
                height: 40,
                child: CustomElevatedButton(
                  callback: () {},
                  label: 'Book',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
