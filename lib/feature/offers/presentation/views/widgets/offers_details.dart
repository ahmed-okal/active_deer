import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/size_config.dart';

class OfferDetails extends StatelessWidget {
  const OfferDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.correct,
          height: AppSize.getHeight(10),
          width: AppSize.getWidth(10),
        ),
        SizedBox(width: AppSize.getWidth(6)),
        Text('مدربين معتمدين', style: AppTextTheme.primary600(size: 10)),
      ],
    );
  }
}
