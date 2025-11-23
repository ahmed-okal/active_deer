import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_border.dart';
import '../../../../../core/utils/size_config.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            AppAssets.test,
            fit: BoxFit.cover,
            height: AppSize.getHeight(66),
            width: AppSize.getHeight(66),
          ),
        ),
        SizedBox(width: AppSize.getWidth(10)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('أحمد محمد', style: AppTextTheme.primary700(size: 14)),
            Text(
              'ahmed.okal@gmail.com',
              style: AppTextTheme.primary500(size: 12),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.editProfile);
          },
          child: Container(
            height: AppSize.getHeight(27),
            width: AppSize.getWidth(73),
            decoration: AppBorder.primaryButtonBorder,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.edit),
                SizedBox(width: AppSize.getWidth(6)),
                Text('edit'.tr, style: AppTextTheme.white700(size: 12)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
