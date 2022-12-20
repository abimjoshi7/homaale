import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
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
                top: 40,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        leadingWidget ?? const SizedBox.shrink(),
                        trailingWidget ?? const SizedBox.shrink(),
                      ],
                    ),
                    // CustomHeader(
                    //   leadingWidget: IconButton(
                    //     onPressed: () {},
                    //     icon: const Icon(
                    //       Icons.arrow_back,
                    //       color: Color(0xffADB5BD),
                    //     ),
                    //   ),
                    //   trailingWidget: Row(
                    //     children: const [
                    //       Text(
                    //         "Skip",
                    //         style: kSkipHelper,
                    //       ),
                    //       Icon(
                    //         Icons.arrow_forward_ios_sharp,
                    //         size: 20,
                    //         color: Color(0xffADB5BD),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Image.asset("assets/logo_title.png"),
                  ],
                )),
            Positioned(
              top: 200,
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
