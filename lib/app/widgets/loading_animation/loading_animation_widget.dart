import 'package:flutter/material.dart';

import 'discrete_circle.dart';

class LoadingAnimationWidget {
  LoadingAnimationWidget._();

  static Widget discreteCircle({
    required Color color,
    required double size,
    Color secondRingColor = Colors.teal,
    Color thirdRingColor = Colors.orange,
    Key? key,
  }) {
    return DiscreteCircle(
      color: color,
      size: size,
      secondCircleColor: secondRingColor,
      thirdCircleColor: thirdRingColor,
      key: key,
    );
  }
}
