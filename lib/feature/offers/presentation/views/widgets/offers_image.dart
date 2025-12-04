import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/size_config.dart';

class OfferImage extends StatelessWidget {
  const OfferImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.only(
        bottomStart: Radius.circular(5),
        topStart: Radius.circular(5),
      ),
      child: Image.asset(
        AppAssets.test,
        fit: BoxFit.cover,
        width: AppSize.getWidth(168),
      ),
    );
  }
}
