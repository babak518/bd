import 'dart:math';
import 'package:flutter/material.dart';

class PolygonPoints {
  static List<Offset> generate({
    required int sides,
    required double radius,
    required Offset center,
  }) {
    final points = <Offset>[];
    final step = (2 * pi) / sides;
    for (int i = 0; i < sides; i++) {
      final angle = -pi / 2 + step * i;
      points.add(
        Offset(
          center.dx + radius * cos(angle),
          center.dy + radius * sin(angle),
        ),
      );
    }
    return points;
  }
}
