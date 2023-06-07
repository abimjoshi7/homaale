import 'package:flutter/material.dart';

class SkillBox extends StatelessWidget {
  const SkillBox({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: const Color(0xff0693E3),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            child: Text(label,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      letterSpacing: 1.1,
                    )),
          ),
        ),
      ),
    );
  }
}
