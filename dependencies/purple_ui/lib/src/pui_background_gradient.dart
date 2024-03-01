import 'package:flutter/material.dart';

class PuiBackgroundGradient extends StatelessWidget {
  const PuiBackgroundGradient({
    this.child,
    this.opacity,
    super.key,
  });

  final Widget? child;
  final double? opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xff6b38dd).withOpacity(opacity ?? 1),
            const Color(0xffa42f80).withOpacity(opacity ?? 1),
          ],
          stops: const [0.15, 0.85],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
