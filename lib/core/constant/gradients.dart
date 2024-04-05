import 'package:flutter/material.dart';
import 'colors.dart';

///Gradient

Gradient primaryGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    primaryColor,
    secondaryColor,
  ],
);

LinearGradient secondaryGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF3E3B6F),
    Color(0xFF24223E),
  ],
);

Gradient inActiveGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Colors.grey.shade400,
    Colors.grey.shade500,
    Colors.grey.shade600,
  ],
);
LinearGradient linearGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    primaryColor,
    secondaryColor,
  ],
);

Gradient activityGradient = const RadialGradient(
  center: Alignment(0.34, 0.85),
  radius: 0.6,
  colors: [
    Color(0xFF3E3B6F),
    Color(0xFF24223E),
  ],
);

Gradient calenderGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.15, .28, .55],
  colors: [
    Color(0xFF40224E),
    Color(0xFF261F37),
    Color(0xFF1D1C32),
  ],
);

LinearGradient customColorGradient({required Color color}) {
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      color,
      color.withOpacity(0.9),
      Colors.white.withOpacity(0.9),
      color.withOpacity(0.7),
      Colors.white.withOpacity(0.9),
      color.withOpacity(0.8),
    ],
  );
}

RadialGradient backgroundGradient = const RadialGradient(
  center: Alignment(0.34, 0.85),
  radius: 0.6,
  colors: [
    Color(0xFF3E3B6F),
    Color(0xFF24223E),
  ],
);

Gradient greyGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Colors.grey.shade200,
    Colors.grey.shade400,
  ],
);

Gradient blankGradient = const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
  Colors.grey,
  Colors.grey,
], stops: [
  0,
  0.100
]);

Gradient textFieldGradient = const LinearGradient(
  begin: Alignment.centerRight,
  end: Alignment.centerLeft,
  colors: [
    primaryColor,
    secondaryColor,
  ],
);
