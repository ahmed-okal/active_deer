import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_border.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/club_branchs_controller.dart';
import 'branches_map.dart';

class BranchesItem extends GetView<ClubBranchsController> {
  const BranchesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.getHeight(116),
      decoration: AppBorder.homeCardBorder,
      child: Padding(
        padding: AppPadding.allPadding8,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('فرع الرياض', style: AppTextTheme.primary700(size: 14)),
                Text(
                  'حي التملك شارع عبد الحليم رضوان',
                  style: AppTextTheme.primary500(size: 12),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    controller.openGoogleMaps(
                      'https://www.google.com/maps/search/?api=1&query=30.825347,31.010891',
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: AppSize.getHeight(27),
                    width: AppSize.getWidth(113),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppAssets.location,
                            color: AppColors.white,
                            height: AppSize.getHeight(16),
                            width: AppSize.getWidth(16),
                          ),
                          SizedBox(width: AppSize.getWidth(3)),
                          Text(
                            'showLocation'.tr,
                            style: AppTextTheme.white700(size: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const BranchesMap(),
          ],
        ),
      ),
    );
  }
}
