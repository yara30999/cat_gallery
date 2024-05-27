import 'package:flutter/material.dart';

import '../../../resources/values_manager.dart';

class CustomDividerWithText extends StatelessWidget {
  final Text text;

  const CustomDividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: CustomPaint(
            painter: CustomDividerPainter(leftGradient: true),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
          child: text,
        ),
        Expanded(
          child: CustomPaint(
            painter: CustomDividerPainter(rightGradient: true),
          ),
        ),
      ],
    );
  }
}

class CustomDividerPainter extends CustomPainter {
  final bool? leftGradient;
  final bool? rightGradient;

  CustomDividerPainter({
    this.leftGradient = false,
    this.rightGradient = false,
    super.repaint,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3; //the thickness of the divider

    // Define the start, middle, and end points for the gradient effect
    final startPoint = Offset(0, size.height / 2);
    //final middlePoint = Offset(size.width / 2, size.height / 2);
    final endPoint = Offset(size.width, size.height / 2);

    // Define a path to draw the gradient line
    final path = Path()
      ..moveTo(startPoint.dx, startPoint.dy)
      //..lineTo(middlePoint.dx, middlePoint.dy)
      ..lineTo(endPoint.dx, endPoint.dy);

    // Define the gradient effect
    dynamic gradient;
    if (leftGradient!) {
      gradient = const LinearGradient(
        colors: [Colors.transparent, Colors.grey],
        stops: [0.0, 1.0],
      );
    } else if (rightGradient!) {
      gradient = const LinearGradient(
        colors: [Colors.grey, Colors.transparent],
        stops: [0.0, 1.0],
      );
    }

    final gradientPaint = paint
      ..shader = gradient.createShader(Rect.fromPoints(startPoint, endPoint));
    // Draw the path with the gradient effect
    canvas.drawPath(path, gradientPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
