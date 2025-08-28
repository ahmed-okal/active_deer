import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

class OfferTitle extends StatelessWidget {
  const OfferTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('عرض اليوم الوطني', style: AppTextTheme.primary700(size: 12)),
        SizedBox(width: AppSize.getWidth(6)),

        Container(
          height: AppSize.getHeight(16),
          width: AppSize.getWidth(43),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
          ),
          child: Center(
            child: Text('3 اشهر', style: AppTextTheme.white700(size: 10)),
          ),
        ),
      ],
    );
  }
}
