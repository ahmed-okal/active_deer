import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/size_config.dart';

class OfferImage extends StatelessWidget {
  const OfferImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.getHeight(112),
      width: AppSize.getWidth(175),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(6),
          topStart: Radius.circular(6),
        ),
      ),
      child: Image.asset(AppAssets.test, fit: BoxFit.cover),
    );
  }
}
