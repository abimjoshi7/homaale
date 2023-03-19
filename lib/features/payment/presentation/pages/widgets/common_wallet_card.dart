import 'package:cipher/features/payment/presentation/pages/payment_page.dart';
import 'package:flutter/material.dart';

class CommonWalletDisplayCard extends StatefulWidget {
  final String walletAssets;
  final String walletName;
  final String walletCardNo;
  final Widget radio;
  const CommonWalletDisplayCard({
    super.key,
    required this.walletAssets,
    required this.walletName,
    required this.walletCardNo,
    required this.radio,
  });

  @override
  State<CommonWalletDisplayCard> createState() =>
      _CommonWalletDisplayCardState();
}

class _CommonWalletDisplayCardState extends State<CommonWalletDisplayCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: ListTile(
          leading: Image.network(
            widget.walletAssets,
            height: 100,
            width: 100,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text(widget.walletName), Text(widget.walletCardNo)],
          ),
          trailing: widget.radio,
        ),
      ),
    );
  }
}
