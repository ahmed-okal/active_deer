import 'package:active_deer/core/utils/app_colors.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../feature/book_fitness_class/presentation/views/widgets/animated_two_up_lines.dart';
import '../../feature/book_fitness_class/presentation/views/widgets/check_mark_painter.dart';

class SuccessPage extends StatefulWidget {
  final String message;
  final VoidCallback? onFinishNavigation;

  const SuccessPage({
    super.key,
    required this.message,
    this.onFinishNavigation,
  });

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _checkController;

  late Animation<double> _topLinesAnimation;
  late Animation<double> _bottomLinesAnimation;
  late Animation<double> _checkCircleAnimation;
  late Animation<double> _checkMarkAnimation;
  late Animation<double> _textAnimation;

  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _mainController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _checkController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _topLinesAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOutBack),
      ),
    );
    _checkCircleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.2, 0.5, curve: Curves.elasticOut),
      ),
    );
    _checkMarkAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeInOut),
    );
    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.6, 0.8, curve: Curves.easeOut),
      ),
    );
    _bottomLinesAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.7, 1.0, curve: Curves.easeOutBack),
      ),
    );
    _startAnimations();
  }

  void _startAnimations() async {
    await _mainController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    await _checkController.forward();
    await Future.delayed(const Duration(milliseconds: 800));
    await _checkController.reverse();
    await Future.delayed(const Duration(milliseconds: 200));
    await _mainController.reverse();
    await Future.delayed(const Duration(milliseconds: 500));
    _navigate();
  }

  void _navigate() {
    if (!_hasNavigated && mounted) {
      _hasNavigated = true;
      if (widget.onFinishNavigation != null) {
        widget.onFinishNavigation!();
      }
    }
  }

  @override
  void dispose() {
    _mainController.dispose();
    _checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: AnimatedBuilder(
          animation: Listenable.merge([_mainController, _checkController]),
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTwoUpLines(animation: _topLinesAnimation),
                SizedBox(height: AppSize.getHeight(190)),
                Transform.scale(
                  scale: _checkCircleAnimation.value,
                  child: SizedBox(
                    width: AppSize.getHeight(182),
                    height: AppSize.getHeight(182),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: AppSize.getHeight(182),
                          height: AppSize.getHeight(182),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
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
                Opacity(
                  opacity: _textAnimation.value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - _textAnimation.value)),
                    child: Text(
                      widget.message,
                      style: AppTextTheme.primary800(size: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.getHeight(190)),
                RotationTransition(
                  turns: const AlwaysStoppedAnimation(1 / 2),
                  child: AnimatedTwoUpLines(animation: _bottomLinesAnimation),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
