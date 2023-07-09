import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key});

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(minutes: 1),
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        setState(() {
          if (_controller.isCompleted) {
            _controller.repeat(
              max: 1,
            );
          }
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Transform.rotate(
      angle: _controller.value * 100,
      child: Container(
        height: 60,
        width: 60,
        child: Image.asset("assets/homaale.png"),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
