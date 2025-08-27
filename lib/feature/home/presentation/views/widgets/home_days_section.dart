import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_border.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/home_controller.dart';

class HomeDaysSection extends GetView<HomeController> {
  const HomeDaysSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: AppSize.getHeight(73),
        child: ListView.separated(
          padding: AppPadding.horizontalPadding20,
          separatorBuilder: (context, index) =>
              SizedBox(width: AppSize.getWidth(10)),
          itemCount: 30,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final dayDate = controller.getCalendarDate(index);
            final isToday = controller.isToday(dayDate);
            final dayName = controller.getDayName(dayDate);

            return Container(
              height: AppSize.getHeight(73),
              width: AppSize.getWidth(56),
              decoration: isToday
                  ? AppBorder.homeCardPrimaryBorder
                  : AppBorder.homeCardBorder,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.getHeight(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(dayName, style: AppTextTheme.primary400(size: 12)),
                    Text(
                      '${dayDate.day}',
                      style: AppTextTheme.primary800(size: 14),
                    ),
                    Container(
                      height: AppSize.getHeight(8),
                      width: AppSize.getWidth(8),
                      decoration: BoxDecoration(
                        color: isToday ? AppColors.green : AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
