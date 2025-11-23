import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';

class MyAccountItem extends StatelessWidget {
  const MyAccountItem({
    super.key,
    required this.itemTitle,
    required this.itemIcon,
    this.isLangauge = false,
    required this.onTap,
    this.logout = false,
  });
  final String itemTitle;
  final String itemIcon;
  final bool isLangauge, logout;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSize.getHeight(9)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: AppSize.getHeight(45),
          decoration: BoxDecoration(
            border: Border.all(
              color: logout ? AppColors.darkRed : AppColors.secondry,
              width: AppSize.getHeight(1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: AppPadding.horizontalPadding10,
            child: Row(
              children: [
                SvgPicture.asset(
                  itemIcon,
                  height: AppSize.getHeight(24),
                  color: logout ? AppColors.darkRed : AppColors.black,
                ),
                SizedBox(width: AppSize.getWidth(6)),
                Text(
                  itemTitle,
                  style: logout
                      ? AppTextTheme.darkRed700(size: 14)
                      : AppTextTheme.primary700(size: 14),
                ),
                Spacer(),
                if (isLangauge) ...[
                  Text(
                    Get.locale?.languageCode == 'ar' ? 'العربية' : 'English',
                    style: logout
                        ? AppTextTheme.darkRed700(size: 14)
                        : AppTextTheme.secondary700(size: 14),
                  ),
                  SizedBox(width: AppSize.getWidth(4)),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: AppSize.getHeight(12),
                    color: logout ? AppColors.darkRed : AppColors.secondry,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
