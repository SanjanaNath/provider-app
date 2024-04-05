import 'package:flutter/material.dart';

import '../../core/constant/shadows.dart';

class ShadowBubble extends StatelessWidget {
  const ShadowBubble({Key? key, required this.radius, this.boxShadow}) : super(key: key);
  final double radius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: boxShadow ?? primaryBubbleShadow(radius: radius),
      ),
    );
  }
}
