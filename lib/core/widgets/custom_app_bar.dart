import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../routes/app_pages.dart';
import '../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.notificationIcon = true,
    // this.lisIcon = true,
  });
  final String title;
  final bool notificationIcon;
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      title: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: AppSize.getWidth(25),
            bottom: AppSize.getHeight(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: AppSize.getWidth(12),
            children: [
              const SizedBox(),
              Text(title, style: AppTextTheme.white900(size: 12)),
              notificationIcon
                  ? const NotificationIcon()
                  : SizedBox(width: AppSize.getWidth(36)),
            ],
          ),
        ),
      ),
    );
  }
}

class ListIcon extends StatelessWidget {
  const ListIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: SvgPicture.asset(
        AppAssets.menuIcon,
        height: AppSize.getHeight(18),
        width: AppSize.getWidth(18),
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.endPadding20,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.notification);
        },
        child: Badge.count(
          backgroundColor: AppColors.red,
          count: 5,
          child: SvgPicture.asset(
            AppAssets.notification,
            height: AppSize.getHeight(18),
            width: AppSize.getWidth(18),
          ),
        ),
      ),
    );
  }
}
