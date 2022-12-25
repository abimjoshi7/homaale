import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    this.child,
    this.leadingWidget,
    this.trailingWidget,
  }) : super(key: key);

  final Widget? child;
  final Widget? leadingWidget;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset("assets/main_bg.png"),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: MediaQueryHelper.theHeight(context) * 0.04,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        leadingWidget ?? const SizedBox.shrink(),
                        trailingWidget ?? const SizedBox.shrink(),
                      ],
                    ),
                    Image.asset("assets/homaale_logo_title.png"),
                  ],
                )),
            Positioned(
              top: MediaQueryHelper.theHeight(context) * 0.25,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                  ),
                ),
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
