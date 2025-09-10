import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

class HomePopupMenuButton extends StatelessWidget {
  const HomePopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        menuPadding: EdgeInsets.zero,
        constraints: BoxConstraints(
          maxWidth: AppSize.getWidth(150),
          maxHeight: AppSize.getHeight(58),
        ),
        itemBuilder: (context) => [
          PopupMenuItem<String>(
            height: AppSize.getHeight(29),
            onTap: () {},
            child: Row(
              children: [
                Icon(Icons.block, size: AppSize.getHeight(12)),
                SizedBox(width: AppSize.getWidth(4)),
                Text('stop'.tr, style: AppTextTheme.primary700(size: 10)),
              ],
            ),
          ),
          const PopupMenuDivider(height: 1, thickness: 1),
          PopupMenuItem<String>(
            height: AppSize.getHeight(29),

            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.waiver,
                  height: AppSize.getHeight(12),
                  width: AppSize.getWidth(12),
                ),
                SizedBox(width: AppSize.getWidth(4)),
                Text('waiver'.tr, style: AppTextTheme.primary700(size: 10)),
              ],
            ),
          ),
        ],
        child: Icon(
          Icons.more_vert,
          color: AppColors.primary,
          size: AppSize.getHeight(14),
        ),
      ),
    );
  }
}
