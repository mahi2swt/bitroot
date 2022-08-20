import 'dart:math';

import 'package:bitroot_org/constants/colors.dart';
import 'package:flutter/material.dart';

class CircularSpriteAnimation extends CustomPainter {
  final Animation<double> _animation;

  CircularSpriteAnimation(this._animation) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (0.7 - (value / 4.0)).clamp(0.0, 1.0);
    Color color = ColorsBase.white.withOpacity(opacity);

    double size = rect.width / 2;
    double area = size * size;
    double radius = sqrt(area * value / 4);

    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(CircularSpriteAnimation oldDelegate) {
    return true;
  }
}
