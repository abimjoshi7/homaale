
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/date_time_representation.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../core/constants/enums.dart';
import '../bloc/redeem_statement_state.dart';
import '../bloc/redeemed_bloc.dart';

class RedeemedStatementSelectedTap extends StatelessWidget {
  const RedeemedStatementSelectedTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RedeemedBloc, RedeemStatementState>(
        builder: (BuildContext context, state) {
          if (state.theState == TheStates.success) {
            return Expanded(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300)),
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  state.redeemStatement?.result?[index]
                                      .objectRepr ??
                                      '',
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(3),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      state.redeemStatement?.result?[index]
                                          .status ==
                                          'spent'
                                          ? "Redeemed"
                                          : state.redeemStatement?.result?[index]
                                          .status ?? "",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          addVerticalSpace(10),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Point : ${state.redeemStatement?.result?[index].points} Pts'),
                                if (state.redeemStatement!.result![index]
                                    .createdAt !=
                                    null)
                                  Text(getVerboseDateTimeRepresentation(state
                                      .redeemStatement!
                                      .result![index]
                                      .createdAt!) ??
                                      ""),
                              ],
                            ),
                          ),
                          addVerticalSpace(10),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(),
                  itemCount: state.redeemStatement?.result?.length ?? 0),
            );
          }
          return CardLoading(height: 100);
        });
  }
}
