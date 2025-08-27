import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      title: SafeArea(
        child: Padding(
          padding: AppPadding.startPadding25,
          child: Row(
            spacing: AppSize.getWidth(12),
            children: [
              SvgPicture.asset(
                AppAssets.menuIcon,
                height: AppSize.getHeight(18),
                width: AppSize.getWidth(18),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${'hi'.tr} ${'ahmed'}',
                    style: AppTextTheme.white900(size: 12),
                  ),
                  Text(
                    'timeToChallenge'.tr,
                    style: AppTextTheme.white400(size: 12),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: AppPadding.endPadding20,
                child: SvgPicture.asset(
                  AppAssets.notification,
                  height: AppSize.getHeight(18),
                  width: AppSize.getWidth(18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
