import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';

class HomeFinalCard extends StatelessWidget {
  const HomeFinalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Column(
          children: [
            SizedBox(height: AppSize.getHeight(17)),
            Padding(
              padding: AppPadding.horizontalPadding20,
              child: Container(
                height: AppSize.getHeight(110),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppAssets.test),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSize.getHeight(17)),
          ],
        ),
      ]),
    );
  }
}
