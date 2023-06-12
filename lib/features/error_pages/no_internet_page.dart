import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CommonErrorContainer extends StatelessWidget {
  final String assetsPath;
  final String? errorTile;
  final String? errorDes;
  const CommonErrorContainer({Key? key, required this.assetsPath, this.errorTile, this.errorDes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          addVerticalSpace(20),
          Image.asset(assetsPath),
          addVerticalSpace(10),
          Text("Oops!", style: Theme.of(context).textTheme.headlineSmall),
          Text(errorTile ?? "", style: Theme.of(context).textTheme.bodySmall),
          Text(
            errorDes ?? "",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                  fontSize: 12,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
