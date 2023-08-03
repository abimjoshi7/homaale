import 'package:cipher/core/constants/constants.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ProfileStatsCard extends StatelessWidget {
  const ProfileStatsCard({
    super.key,
    required this.label,
    required this.imagePath,
    required this.value,
    this.height,
    this.width,
    this.assetsColor,
    this.isThemeChangeColor,
  });

  final String label;
  final String imagePath;
  final String value;
  final double? height;
  final double? width;
  final Color? assetsColor;
  final bool? isThemeChangeColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 100,
      width: width ?? 180,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AutoSizeText(
                  value,
                  style: assetsColor != null ? TextStyle(color: assetsColor) : Theme.of(context).textTheme.displayLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imagePath,
                      color: isThemeChangeColor == null ? assetsColor : Colors.blue,
                    ),
                    kWidth5,
                    Flexible(
                      child: AutoSizeText(
                        label,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
