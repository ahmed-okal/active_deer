import 'package:active_deer/core/theme/app_text_theme.dart';
import 'package:active_deer/core/utils/app_colors.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../getx/controllers/nutritional_advice_controller.dart';

class NutritionalAdviceView extends GetView<NutritionalAdviceController> {
  const NutritionalAdviceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              flexibleSpace: CustomAppBar(title: 'nutritionalAdvice'.tr),
            ),
            SliverPadding(
              padding: AppPadding.allPadding20,
              sliver: SliverList.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.advice,
                        arguments: {'heroTag': 'advice_$index'},
                      );
                    },
                    child: Column(
                      children: [
                        Hero(
                          tag: 'advice_$index',
                          child: Container(
                            height: AppSize.getHeight(88),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(6),
                                topEnd: Radius.circular(6),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(AppAssets.test),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: AppSize.getHeight(24),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadiusDirectional.only(
                              bottomStart: Radius.circular(6),
                              bottomEnd: Radius.circular(6),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'فوائد السلطة',
                              style: AppTextTheme.white700(size: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
