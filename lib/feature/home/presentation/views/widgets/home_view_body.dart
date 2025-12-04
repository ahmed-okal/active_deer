import 'package:active_deer/feature/home/presentation/views/widgets/home_actions_section.dart';
import 'package:active_deer/feature/home/presentation/views/widgets/home_premium_card_section.dart';
import 'package:active_deer/feature/home/presentation/views/widgets/home_sliver_app_bar.dart';
import 'package:active_deer/feature/home/presentation/views/widgets/panner_dots.dart';
import 'package:active_deer/feature/home/presentation/views/widgets/panner_slider.dart';
import 'package:active_deer/feature/home/presentation/views/widgets/premium_card_dots.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../offers/presentation/views/widgets/offers_item.dart';
import '../../getx/controllers/home_controller.dart';

class HomeViewBody extends GetView<HomeController> {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          flexibleSpace: HomeSliverAppBar(),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(height: AppSize.getHeight(20)),
            const PannerSlider(),
            SizedBox(height: AppSize.getHeight(6)),
            const PannerDots(),
            SizedBox(height: AppSize.getHeight(13)),
            const HomePremiumCardSection(),
            SizedBox(height: AppSize.getHeight(6)),
            const PremiumCardDots(),
            SizedBox(height: AppSize.getHeight(13)),
            const HomeActionsSection(),
            SizedBox(height: AppSize.getHeight(15)),
            Padding(
              padding: AppPadding.horizontalPadding20,
              child: Row(
                children: [
                  Text('offers'.tr, style: AppTextTheme.primary700(size: 12)),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.fitnessClassSchedule);
                    },
                    child: Text(
                      'more'.tr,
                      style: AppTextTheme.secondary700(size: 12).copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.darkGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        // const HomeDaysSection(),
        SliverPadding(
          padding: AppPadding.allPadding20,
          sliver: SliverList.separated(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const OfferItem();
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: AppSize.getHeight(18));
            },
          ),
        ),
        // const HomeFinalCard(),
      ],
    );
  }
}
