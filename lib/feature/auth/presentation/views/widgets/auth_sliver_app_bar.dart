import 'package:active_deer/feature/auth/presentation/views/widgets/auth_custom_app_bar_painter.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

class AuthSliverAppBar extends StatelessWidget {
  const AuthSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      backgroundColor: AppColors.transparent,
      surfaceTintColor: AppColors.transparent,
      toolbarHeight: AppSize.getHeight(160),
      flexibleSpace: FlexibleSpaceBar(
        background: CustomPaint(
          painter: CurvedAppBarPainter(color: AppColors.primary),
          child: Center(
            child: Image.asset(
              AppAssets.whiteLogo,
              height: AppSize.getHeight(113),
              width: AppSize.getWidth(113),
            ),
          ),
        ),
      ),
    );
  }
}
