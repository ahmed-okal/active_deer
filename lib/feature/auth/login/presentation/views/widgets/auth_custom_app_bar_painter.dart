import 'package:flutter/material.dart';

class CurvedAppBarPainter extends CustomPainter {
  final Color color;

  CurvedAppBarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();

    // Start from top left
    path.moveTo(0, 0);
    // Top edge
    path.lineTo(size.width, 0);
    // Right edge - make it go down more
    path.lineTo(size.width, size.height - 80);

    // Much more curved bottom - deeper curve
    path.quadraticBezierTo(
      size.width / 2, // control point X (center)
      size.height + 60, // control point Y (much further below for deeper curve)
      0, // end point X
      size.height - 80, // end point Y (higher up for more dramatic curve)
    );

    // Left edge back to start
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Alternative with even more dramatic curve using cubic bezier
class ExtraCurvedAppBarPainter extends CustomPainter {
  final Color color;

  ExtraCurvedAppBarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();

    // Start from top left
    path.moveTo(0, 0);
    // Top edge
    path.lineTo(size.width, 0);
    // Right edge
    path.lineTo(size.width, size.height - 100);

    // Super curved bottom using cubic bezier for maximum curve
    path.cubicTo(
      size.width * 0.8, // control point 1 X
      size.height + 40, // control point 1 Y
      size.width * 0.2, // control point 2 X
      size.height + 40, // control point 2 Y
      0, // end point X
      size.height - 100, // end point Y
    );

    // Left edge back to start
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
