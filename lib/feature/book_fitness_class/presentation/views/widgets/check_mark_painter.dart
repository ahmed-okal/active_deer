import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CheckMarkPainter extends CustomPainter {
  final double progress;

  CheckMarkPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white
      ..strokeWidth = 12.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final checkSize = size.width * 0.6;

    // Define check mark path points
    final startPoint = Offset(center.dx - checkSize * 0.3, center.dy);
    final middlePoint = Offset(
      center.dx - checkSize * 0.1,
      center.dy + checkSize * 0.2,
    );
    final endPoint = Offset(
      center.dx + checkSize * 0.3,
      center.dy - checkSize * 0.2,
    );

    final path = Path();

    if (progress <= 0.5) {
      // First half: draw from start to middle
      final firstProgress = progress * 2;
      final currentPoint = Offset.lerp(startPoint, middlePoint, firstProgress)!;

      path.moveTo(startPoint.dx, startPoint.dy);
      path.lineTo(currentPoint.dx, currentPoint.dy);
    } else {
      // Second half: draw from middle to end
      final secondProgress = (progress - 0.5) * 2;
      final currentPoint = Offset.lerp(middlePoint, endPoint, secondProgress)!;

      path.moveTo(startPoint.dx, startPoint.dy);
      path.lineTo(middlePoint.dx, middlePoint.dy);
      path.lineTo(currentPoint.dx, currentPoint.dy);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CheckMarkPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
