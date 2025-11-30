import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

class OfferPriceContainer extends StatelessWidget {
  const OfferPriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: Container(
        height: AppSize.getHeight(24),
        width: AppSize.getWidth(113),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(6),
            bottomEnd: Radius.circular(5),
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
            Text('1000 ريال', style: AppTextTheme.white700(size: 12)),
          ],
        ),
      ),
    );
  }
}
