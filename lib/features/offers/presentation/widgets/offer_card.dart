// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/core/constants/text.dart';
import 'package:cipher/features/offers/presentation/bloc/offers_bloc.dart';
import 'package:flutter/services.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
    required this.state,
    required this.index,
  }) : super(key: key);
  final OffersState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Card(
              child: Image.network(
                fit: BoxFit.cover,
                state.offerModel?.result?[index].image ?? kNoImageNImg,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    state.offerModel?.result?[index].title ?? "data",
                    style: kPurpleText19,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AutoSizeText(
                    state.offerModel?.result?[index].description ?? "data",
                    style: kLightBlueText14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "View Details>",
                          style: kLightBlueText12,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(
                              text: state.offerModel?.result?[index].code,
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            color: kColorSecondary.withOpacity(
                              0.6,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              state.offerModel?.result?[index].code ?? "",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
