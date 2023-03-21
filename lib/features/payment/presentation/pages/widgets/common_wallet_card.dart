import 'package:flutter/material.dart';

class CommonWalletDisplayCard extends StatelessWidget {
  final String walletAssets;
  final String walletName;
  final String walletCardNo;
  final Widget radio;

  const CommonWalletDisplayCard(
      {Key? key,
      required this.walletAssets,
      required this.walletName,
      required this.walletCardNo,
      required this.radio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: ListTile(
          leading: Image.network(
            walletAssets,
            height: 100,
            width: 100,
            scale: 1,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(walletName), Text(walletCardNo)],
          ),
          trailing:  radio,
        ),
      ),
    );
  }
}
