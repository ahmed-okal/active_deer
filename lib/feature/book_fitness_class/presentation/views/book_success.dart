import 'package:active_deer/core/utils/app_colors.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_text_theme.dart';

class BookSuccess extends StatefulWidget {
  const BookSuccess({super.key});

  @override
  State<BookSuccess> createState() => _BookSuccessState();
}

class _BookSuccessState extends State<BookSuccess>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _checkController;

  late Animation<double> _topLinesAnimation;
  late Animation<double> _bottomLinesAnimation;
  late Animation<double> _checkCircleAnimation;
  late Animation<double> _checkMarkAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    // Main animation controller for overall sequence
    _mainController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    );

    // Separate controller for check mark drawing
    _checkController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Top lines slide in from left and right
    _topLinesAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOutBack),
      ),
    );

    // Check circle scale animation
    _checkCircleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.2, 0.5, curve: Curves.elasticOut),
      ),
    );

    // Check mark drawing animation
    _checkMarkAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeInOut),
    );

    // Text fade in
    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.6, 0.8, curve: Curves.easeOut),
      ),
    );

    // Bottom lines slide in from left and right
    _bottomLinesAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.7, 1.0, curve: Curves.easeOutBack),
      ),
    );

    // Start animations
    _startAnimations();
  }

  void _startAnimations() async {
    await _mainController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    await _checkController.forward();
  }

  @override
  void dispose() {
    _mainController.dispose();
    _checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([_mainController, _checkController]),
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Top animated lines
              AnimatedTwoUpLines(animation: _topLinesAnimation),

              SizedBox(height: AppSize.getHeight(190)),

              // Animated check circle with custom check mark
              Transform.scale(
                scale: _checkCircleAnimation.value,
                child: SizedBox(
                  width: AppSize.getHeight(182),
                  height: AppSize.getHeight(182),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Circle background
                      Container(
                        width: AppSize.getHeight(182),
                        height: AppSize.getHeight(182),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Animated check mark
                      CustomPaint(
                        size: Size(
                          AppSize.getHeight(200),
                          AppSize.getHeight(200),
                        ),
                        painter: CheckMarkPainter(
                          progress: _checkMarkAnimation.value,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: AppSize.getHeight(33)),

              // Animated text
              Opacity(
                opacity: _textAnimation.value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - _textAnimation.value)),
                  child: Text(
                    'bookingSuccess'.tr,
                    style: AppTextTheme.primary800(size: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(height: AppSize.getHeight(190)),

              // Bottom animated lines (rotated)
              RotationTransition(
                turns: const AlwaysStoppedAnimation(1 / 2),
                child: AnimatedTwoUpLines(animation: _bottomLinesAnimation),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Animated version of TwoUpLines that slides in from sides
class AnimatedTwoUpLines extends StatelessWidget {
  final Animation<double> animation;

  const AnimatedTwoUpLines({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Column(
          children: [
            // Top line slides in from left
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Transform.translate(
                offset: Offset(
                  -AppSize.getWidth(200) * (1 - animation.value),
                  0,
                ),
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                    start: AppSize.getWidth(16),
                  ),
                  height: AppSize.getHeight(5),
                  width: AppSize.getWidth(160) * animation.value,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSize.getHeight(20)),
            // Bottom line slides in from right
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Transform.translate(
                offset: Offset(
                  AppSize.getWidth(200) * (1 - animation.value),
                  0,
                ),
                child: Container(
                  height: AppSize.getHeight(5),
                  width: AppSize.getWidth(160) * animation.value,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// Custom painter for animated check mark
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

// Keep original TwoUpLines for backward compatibility
class TwoUpLines extends StatelessWidget {
  const TwoUpLines({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Container(
            margin: EdgeInsetsDirectional.only(start: AppSize.getWidth(16)),
            height: AppSize.getHeight(5),
            width: AppSize.getWidth(160),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(6),
                bottomEnd: Radius.circular(6),
              ),
            ),
          ),
        ),
        SizedBox(height: AppSize.getHeight(20)),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Container(
            height: AppSize.getHeight(5),
            width: AppSize.getWidth(160),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
