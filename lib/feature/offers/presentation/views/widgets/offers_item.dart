import 'package:active_deer/feature/offers/presentation/views/widgets/offers_details.dart';
import 'package:active_deer/feature/offers/presentation/views/widgets/offers_image.dart';
import 'package:active_deer/feature/offers/presentation/views/widgets/offers_price_container.dart';
import 'package:active_deer/feature/offers/presentation/views/widgets/offers_title.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_border.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.getHeight(112),
      decoration: AppBorder.homeCardBorder,
      child: Stack(
        children: [
          Row(
            children: [
              const OfferImage(),
              Padding(
                padding: AppPadding.allPadding8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSize.getHeight(2),
                  children: [
                    const OfferTitle(),
                    SizedBox(height: AppSize.getHeight(2)),

                    const OfferDetails(),
                    const OfferDetails(),
                    const OfferDetails(),
                  ],
                ),
              ),
            ],
          ),
          const OfferPriceContainer(),
        ],
      ),
    );
  }
}
