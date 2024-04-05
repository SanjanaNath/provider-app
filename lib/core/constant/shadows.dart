import 'package:flutter/material.dart';
import 'package:provider_setup/core/extensions/normal/build_context_extension.dart';

import 'colors.dart';

///1) Text Shadow...

List<Shadow>? primaryTextShadow(BuildContext context, {Color? color}) {
  return [
    Shadow(
      color: color ?? (context.darkMode ? Colors.black : Colors.white),
      blurRadius: 1,
    ),
  ];
}

///2) Box Shadow...
List<BoxShadow> primaryBoxShadow() {
  List<BoxShadow> boxShadow = [
    const BoxShadow(offset: Offset(0, -1), color: Colors.white, blurRadius: 0, spreadRadius: 0),
    BoxShadow(offset: const Offset(0, 0), color: Colors.grey.shade50, blurRadius: 2, spreadRadius: 0),
  ];
  return boxShadow;
}

List<BoxShadow> primaryBubbleShadow({
  required double radius,
}) {
  List<BoxShadow> boxShadow = [
    BoxShadow(
      offset: const Offset(0, 0),
      color: (primaryColor).withOpacity(0.1),
      blurRadius: radius * 2,
      spreadRadius: radius,
    ),
    BoxShadow(
      offset: const Offset(1, 1),
      color: (primaryColor).withOpacity(0.16),
      blurRadius: radius * 2,
      spreadRadius: radius,
    ),
  ];
  return boxShadow;
}
