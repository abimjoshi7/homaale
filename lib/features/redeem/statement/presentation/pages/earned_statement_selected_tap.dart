import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/date_time_representation.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../core/constants/enums.dart';
import '../bloc/earned_bloc.dart';
import '../bloc/redeem_statement_state.dart';

class EarnedStatementSelectedTap extends StatelessWidget {
  const EarnedStatementSelectedTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EarnedBloc, RedeemStatementState>(
        builder: (BuildContext context, state) {
      if (state.theState == TheStates.initial) {
        CardLoading(height: 100);
      } else {
        return state.redeemStatement?.result?.length !=0
            ? Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300)),
                        margin:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      state.redeemStatement?.result?[index]
                                              .objectRepr ??
                                          '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(3),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        state.redeemStatement?.result?[index]
                                                    .status ==
                                                'earned'
                                            ? "Earned"
                                            : state.redeemStatement
                                                    ?.result?[index].status ??
                                                "",
                                        style: TextStyle(
                                            color: Colors.green,
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
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Point : ${state.redeemStatement?.result?[index].points} Pts'),
                                  if (state.redeemStatement!.result![index]
                                          .createdAt !=
                                      null)
                                    Text(getVerboseDateTimeRepresentation(state
                                            .redeemStatement!
                                            .result![index]
                                            .createdAt!)),
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
              )
            : Center(
                child: Text(
                  'No Earned Points Founds.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
      }
      return CardLoading(height: 100);
    });
  }
}
