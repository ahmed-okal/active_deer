import 'package:active_deer/core/utils/app_colors.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_text_theme.dart';
import 'widgets/animated_two_up_lines.dart';
import 'widgets/check_mark_painter.dart';

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
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Separate controller for check mark drawing
    _checkController = AnimationController(
      duration: const Duration(milliseconds: 1200),
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
