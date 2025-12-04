import 'package:active_deer/feature/home/presentation/views/widgets/home_premium_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/home_controller.dart';

class HomePremiumCardSection extends GetView<HomeController> {
  const HomePremiumCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSize.getHeight(3),
          children: [
            Container(
              height: AppSize.getHeight(2),
              width: AppSize.getWidth(14),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(6),
                  bottomEnd: Radius.circular(6),
                ),
              ),
            ),
            Container(
              height: AppSize.getHeight(2),
              width: AppSize.getWidth(11),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(6),
                  bottomEnd: Radius.circular(6),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: CarouselSlider.builder(
            itemCount: 10,
            itemBuilder: (context, index, realIndex) {
              return HomePremiumCard(padding: AppPadding.horizontalPadding6);
            },
            options: CarouselOptions(
              height: AppSize.getHeight(97),
              autoPlay: false,
              enlargeCenterPage: true,
              enlargeFactor: 1,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlayCurve: Curves.easeInOut,
              onPageChanged: (index, reason) {
                controller.currentPremiumCardIndex.value = index;
              },
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: AppSize.getHeight(3),
          children: [
            Container(
              height: AppSize.getHeight(2),
              width: AppSize.getWidth(11),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(6),
                  bottomStart: Radius.circular(6),
                ),
              ),
            ),
            Container(
              height: AppSize.getHeight(2),
              width: AppSize.getWidth(14),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(6),
                  bottomEnd: Radius.circular(6),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
