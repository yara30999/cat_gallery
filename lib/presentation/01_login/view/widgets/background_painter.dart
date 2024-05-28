import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    var path = Path();

    // upper shape
    paint.color = ColorManager.primary4;
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.01, size.height * 0.01,
        size.width * 0.4, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.9, size.height * 0.2, size.width, 0);
    path.close();
    canvas.drawPath(path, paint);

    // right shape

    paint.color = ColorManager.pink1;
    path = Path();
    path.moveTo(size.width * 0.55, size.height);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.95,
        size.width * 0.37, size.height * 0.91);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.95, size.width, size.height * 0.5);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);

    // middel shape
    paint.color = ColorManager.pink2;
    path = Path();
    path.moveTo(size.width * 0.1, size.height);
    path.quadraticBezierTo(
        size.width * 0.19, size.height * 0.82, size.width * 0.5, size.height);
    path.close();
    canvas.drawPath(path, paint);

    // left shape
    paint.color = ColorManager.brown1;
    path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.79,
        size.width * 0.35, size.height * 0.9);
    path.quadraticBezierTo(
        size.width * 0.1, size.height * 0.85, size.width * 0.05, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
