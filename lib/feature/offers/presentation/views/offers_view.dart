import 'package:active_deer/core/utils/app_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/size_config.dart';
import '../getx/controllers/offers_controller.dart';

class OffersView extends GetView<OffersController> {
  const OffersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
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
                      SvgPicture.asset(
                        AppAssets.menuIcon,
                        height: AppSize.getHeight(18),
                        width: AppSize.getWidth(18),
                      ),
                      Text('offers'.tr, style: AppTextTheme.white900(size: 12)),
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
            ),
          ),
          SliverPadding(
            padding: AppPadding.allPadding20,
            sliver: SliverList.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: AppSize.getHeight(112),
                  decoration: AppBorder.homeCardBorder,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: AppSize.getHeight(112),
                            width: AppSize.getWidth(175),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.only(
                                bottomStart: Radius.circular(6),
                                topStart: Radius.circular(6),
                              ),
                            ),
                            child: Image.asset(
                              AppAssets.test,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: AppPadding.allPadding8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: AppSize.getHeight(2),
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'عرض اليوم الوطني',
                                      style: AppTextTheme.primary700(size: 12),
                                    ),
                                    SizedBox(width: AppSize.getWidth(6)),

                                    Container(
                                      height: AppSize.getHeight(16),
                                      width: AppSize.getWidth(43),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius:
                                            BorderRadiusDirectional.all(
                                              Radius.circular(8),
                                            ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '3 اشهر',
                                          style: AppTextTheme.white700(
                                            size: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppSize.getHeight(2)),

                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.correct,
                                      height: AppSize.getHeight(10),
                                      width: AppSize.getWidth(10),
                                    ),
                                    SizedBox(width: AppSize.getWidth(6)),
                                    Text(
                                      'مدربين معتمدين',
                                      style: AppTextTheme.primary600(size: 10),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.correct,
                                      height: AppSize.getHeight(10),
                                      width: AppSize.getWidth(10),
                                    ),
                                    SizedBox(width: AppSize.getWidth(6)),
                                    Text(
                                      'مدربين معتمدين',
                                      style: AppTextTheme.primary600(size: 10),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.correct,
                                      height: AppSize.getHeight(10),
                                      width: AppSize.getWidth(10),
                                    ),
                                    SizedBox(width: AppSize.getWidth(6)),
                                    Text(
                                      'مدربين معتمدين',
                                      style: AppTextTheme.primary600(size: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Container(
                          height: AppSize.getHeight(24),
                          width: AppSize.getWidth(113),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(6),
                              bottomEnd: Radius.circular(6),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '1200 ريال',
                                style: AppTextTheme.white600(size: 10).copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColors.white,
                                ),
                              ),
                              SizedBox(width: AppSize.getWidth(6)),
                              Text(
                                '1000 ريال',
                                style: AppTextTheme.white700(size: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: AppSize.getHeight(18));
              },
            ),
          ),
        ],
      ),
    );
  }
}
