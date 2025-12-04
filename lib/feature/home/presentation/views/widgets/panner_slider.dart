import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/home_controller.dart';

class PannerSlider extends GetView<HomeController> {
  const PannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 10,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: AppPadding.horizontalPadding20,
          child: Container(
            height: AppSize.getHeight(123),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppAssets.test),
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        height: AppSize.getHeight(123),
        enlargeCenterPage: true,
        enlargeFactor: 1,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.easeInOut,
        onPageChanged: (index, reason) {
          controller.currentImageIndex.value = index;
        },
      ),
    );
  }
}
