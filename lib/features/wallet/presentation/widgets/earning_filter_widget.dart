import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EarningFilterWidget extends StatefulWidget {
  final String? fromText;
  final String? toText;
  final VoidCallback? onFromTap;
  final VoidCallback? onToTap;
  final VoidCallback? onClearFilterTap;

  const EarningFilterWidget({
    super.key,
    this.onFromTap,
    this.onToTap,
    this.fromText,
    this.toText,
    this.onClearFilterTap,
  });

  @override
  State<EarningFilterWidget> createState() => _EarningFilterWidgetState();
}

class _EarningFilterWidgetState extends State<EarningFilterWidget> {
  bool readOnly = true;
  final searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Icon(
              Icons.filter_alt_outlined,
              color: kColorSilver,
            ),
            addHorizontalSpace(8),
            InkWell(
              onTap: widget.onToTap,
              child: SizedBox(
                width: 200,
                height: 40,
                child: CustomTextFormField(
                  hintText: "Search",
                  controller: searchController,
                  inputAction: TextInputAction.done,
                  onFieldSubmitted: (p0) {
                    if (p0!.length >= 3) {
                      context.read<WalletBloc>().add(
                            WalletHistoryLoaded(
                              searchQuery: p0,
                              isNewFetch: true,
                            ),
                          );
                    }
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         toText ?? "To",
              //         overflow: TextOverflow.ellipsis,
              //       ),
              //       addHorizontalSpace(8),
              //       Icon(
              //         Icons.calendar_today_outlined,
              //         color: kColorSilver,
              //       ),
              //     ],
              //   ),
              // ),
            ),
            addHorizontalSpace(8),
            InkWell(
              onTap: widget.onFromTap,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kColorGrey),
                  borderRadius: BorderRadius.circular(16),
                ),
                constraints: BoxConstraints.loose(Size(110, 100)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.fromText ?? "From"),
                      addHorizontalSpace(8),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: kColorSilver,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            addHorizontalSpace(8),
            InkWell(
              onTap: widget.onToTap,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kColorGrey),
                  borderRadius: BorderRadius.circular(16),
                ),
                constraints: BoxConstraints.loose(Size(110, 100)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.toText ?? "To",
                        overflow: TextOverflow.ellipsis,
                      ),
                      addHorizontalSpace(8),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: kColorSilver,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            widget.fromText != null ||
                    widget.toText != null ||
                    searchController.text.isNotEmpty
                ? TextButton(
                    onPressed: widget.onClearFilterTap,
                    child: Text('Clear Fitlers'))
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
