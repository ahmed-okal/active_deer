import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
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
              InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: SvgPicture.asset(
                  AppAssets.menuIcon,
                  height: AppSize.getHeight(18),
                  width: AppSize.getWidth(18),
                ),
              ),
              Text(title, style: AppTextTheme.white900(size: 12)),
              Padding(
                padding: AppPadding.endPadding20,
                child: InkWell(
                  onTap: () {},
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
