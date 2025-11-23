import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../book_fitness_class/presentation/views/widgets/check_mark_painter.dart';

class StopSubscriptionSuccessBottomSheet extends StatefulWidget {
  final VoidCallback? onFinished;

  const StopSubscriptionSuccessBottomSheet({super.key, this.onFinished});

  @override
  State<StopSubscriptionSuccessBottomSheet> createState() =>
      _StopSubscriptionSuccessBottomSheetState();
}

class _StopSubscriptionSuccessBottomSheetState
    extends State<StopSubscriptionSuccessBottomSheet>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _checkController;

  late Animation<double> _checkCircleAnimation;
  late Animation<double> _checkMarkAnimation;
  late Animation<double> _textAnimation;

  bool _hasFinished = false;
  bool _canPop = false;

  @override
  void initState() {
    super.initState();
    _mainController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _checkController = AnimationController(
      duration: const Duration(microseconds: 200),
      vsync: this,
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

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await _mainController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    await _checkController.forward();
    await Future.delayed(const Duration(milliseconds: 800));
    await _checkController.reverse();
    await Future.delayed(const Duration(milliseconds: 200));
    await _mainController.reverse();
    await Future.delayed(const Duration(milliseconds: 500));
    _finish();
  }

  void _finish() {
    if (_hasFinished || !mounted) return;
    _hasFinished = true;
    _canPop = true;
    if (widget.onFinished != null) {
      widget.onFinished!();
    } else {
      Get.back();
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
    return WillPopScope(
      onWillPop: () async => _canPop,
      child: Padding(
        padding: AppPadding.allPadding20,
        child: AnimatedBuilder(
          animation: Listenable.merge([_mainController, _checkController]),
          builder: (context, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Opacity(
                  opacity: _textAnimation.value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - _textAnimation.value)),
                    child: Text(
                      'subscriptionFrozenSuccessfully'.tr,
                      style: AppTextTheme.primary800(size: 26),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.getHeight(24)),

                Transform.scale(
                  scale: _checkCircleAnimation.value,
                  child: SizedBox(
                    width: AppSize.getHeight(100),
                    height: AppSize.getHeight(100),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: AppSize.getHeight(100),
                          height: AppSize.getHeight(100),
                          decoration: const BoxDecoration(
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
                SizedBox(height: AppSize.getHeight(24)),
                Opacity(
                  opacity: _textAnimation.value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - _textAnimation.value)),
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AppTextTheme.primary600(size: 14),
                            children: [
                              TextSpan(
                                text: '${'subscriptionWillResumeOn'.tr} ',
                              ),
                              TextSpan(
                                text: '01/10/2025',
                                style: AppTextTheme.primary800(size: 14),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSize.getHeight(10)),
                        Text(
                          'youCanCancelFreezeAnytime'.tr,
                          style: AppTextTheme.primary600(size: 14),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSize.getHeight(30)),
              ],
            );
          },
        ),
      ),
    );
  }
}
