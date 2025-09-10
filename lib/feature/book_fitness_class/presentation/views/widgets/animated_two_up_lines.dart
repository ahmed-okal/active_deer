import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

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
